---
layout: post
title: PHP Un-/Serialize with C#
date: 2011-05-04 12:46
author: Gordon Breuer
comments: true
categories: [Development, English]
---
<p class="hide"><img style="background-image: none; border-right-width: 0px; padding-left: 0px; padding-right: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px" border="0" alt="(c) Bernd Boscolo" src="http://anheledirwp.blob.core.windows.net/wordpress/2011/05/aboutpixel.de-Netzwerk-10-Bernd-Boscolo.jpg" width="240" height="218" /></p>  <p>Did you ever had to use a web-service written in PHP that used the proprietary PHP functions to serialize data? Me neither, until a few days ago. It took me some time to find a library that can handle this data and unserialize it again. Granted, the serialization-format isn’t too complicated, but why should someone invest time into a problem already solved? And I was sure that I’m neither the first nor the only one facing this task.</p>  <p>The library in question is the <a href="http://csphpserial.sourceforge.net/">Sharp Serialization Library</a> on Sourceforge. The project was released on 2010-01-07 and is in beta. Also I am not quite sure if the supported types are a limitation of the library or if PHP doesn’t have more of them. It’s a few years ago since I last actively worked with this language. But the library covers all possible types for my duties, so I’m fine with it.</p>  <p>My only problem was: I need this library for a Windows Phone 7 project, but the used types “ArrayList” and “Hashtable” aren’t compatible with the Silverlight 3 Subset of the framework. So I rewrote the accordingly parts of the library with “List&lt;&gt;” and “Dictionary&lt;&gt;” and voíla, now I can use it within my WP7-project, too!</p>  <p>Here is the sourcecode of my changes for your convenience:</p>  <pre class="brush: csharp;">/*
 * Serializer.cs
 * This is the Serializer class for the PHPSerializationLibrary
 *  
 * Copyright 2004 Conversive, Inc.
 * 
 * Modified for WP7-Silverlight by Gordon Breuer
 *
 */

using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;

namespace Conversive.PHPSerializationLibrary {
    /// &lt;summary&gt;
    /// Serializer Class.
    /// &lt;/summary&gt;
    public class PhpSerializer {
        //types:
        // N = null
        // s = string
        // i = int
        // d = double
        // a = array (hashtable)

        private readonly NumberFormatInfo _nfi;
        public Encoding StringEncoding = new UTF8Encoding();

        public bool XmlSafe = true;
        //This member tells the serializer wether or not to strip carriage returns from strings when serializing and adding them back in when deserializing

        private int _pos; //for unserialize
        private Dictionary&lt;List&lt;object&gt;, bool&gt; _seenArrayLists; //for serialize (to infinte prevent loops) lol
        private Dictionary&lt;Dictionary&lt;object, object&gt;, bool&gt; _seenHashtables; //for serialize (to infinte prevent loops)

        public PhpSerializer() {
            _nfi = new NumberFormatInfo { NumberGroupSeparator = &quot;&quot;, NumberDecimalSeparator = &quot;.&quot; };
        }

        public string Serialize(object obj) {
            _seenArrayLists = new Dictionary&lt;List&lt;object&gt;, bool&gt;();
            _seenHashtables = new Dictionary&lt;Dictionary&lt;object, object&gt;, bool&gt;();

            return serialize(obj, new StringBuilder()).ToString();
        }

        //Serialize(object obj)

        private StringBuilder serialize(object obj, StringBuilder sb) {
            if (obj == null) return sb.Append(&quot;N;&quot;);
            if (obj is string) {
                var str = (string)obj;
                if (XmlSafe) {
                    str = str.Replace(&quot;rn&quot;, &quot;n&quot;); //replace rn with n
                    str = str.Replace(&quot;r&quot;, &quot;n&quot;); //replace r not followed by n with a single n  Should we do this?
                }
                return sb.Append(&quot;s:&quot; + StringEncoding.GetByteCount(str) + &quot;:&quot;&quot; + str + &quot;&quot;;&quot;);
            }
            if (obj is bool) return sb.Append(&quot;b:&quot; + (((bool)obj) ? &quot;1&quot; : &quot;0&quot;) + &quot;;&quot;);
            if (obj is int) {
                var i = (int)obj;
                return sb.Append(&quot;i:&quot; + i.ToString(_nfi) + &quot;;&quot;);
            }
            if (obj is double) {
                var d = (double)obj;

                return sb.Append(&quot;d:&quot; + d.ToString(_nfi) + &quot;;&quot;);
            }
            if (obj is List&lt;object&gt;) {
                if (_seenArrayLists.ContainsKey((List&lt;object&gt;)obj))
                    return sb.Append(&quot;N;&quot;); //cycle detected
                _seenArrayLists.Add((List&lt;object&gt;)obj, true);

                var a = (List&lt;object&gt;)obj;
                sb.Append(&quot;a:&quot; + a.Count + &quot;:{&quot;);
                for (int i = 0; i &lt; a.Count; i++) {
                    serialize(i, sb);
                    serialize(a[i], sb);
                }
                sb.Append(&quot;}&quot;);
                return sb;
            }
            if (obj is Dictionary&lt;object, object&gt;) {
                if (_seenHashtables.ContainsKey((Dictionary&lt;object, object&gt;)obj))
                    return sb.Append(&quot;N;&quot;);
                _seenHashtables.Add((Dictionary&lt;object, object&gt;)obj, true);

                var a = (Dictionary&lt;object, object&gt;)obj;
                sb.Append(&quot;a:&quot; + a.Count + &quot;:{&quot;);
                foreach (var entry in a) {
                    serialize(entry.Key, sb);
                    serialize(entry.Value, sb);
                }
                sb.Append(&quot;}&quot;);
                return sb;
            }
            return sb;
        }

        public object Deserialize(string str) {
            _pos = 0;
            return deserialize(str);
        }

        private object deserialize(string str) {
            if (str == null || str.Length &lt;= _pos)
                return new Object();

            int start, end, length;
            string stLen;
            switch (str[_pos]) {
                case 'N':
                    _pos += 2;
                    return null;
                case 'b':
                    char chBool = str[_pos + 2];
                    _pos += 4;
                    return chBool == '1';
                case 'i':
                    start = str.IndexOf(&quot;:&quot;, _pos) + 1;
                    end = str.IndexOf(&quot;;&quot;, start);
                    var stInt = str.Substring(start, end - start);
                    _pos += 3 + stInt.Length;
                    return Int32.Parse(stInt, _nfi);
                case 'd':
                    start = str.IndexOf(&quot;:&quot;, _pos) + 1;
                    end = str.IndexOf(&quot;;&quot;, start);
                    var stDouble = str.Substring(start, end - start);
                    _pos += 3 + stDouble.Length;
                    return Double.Parse(stDouble, _nfi);
                case 's':
                    start = str.IndexOf(&quot;:&quot;, _pos) + 1;
                    end = str.IndexOf(&quot;:&quot;, start);
                    stLen = str.Substring(start, end - start);
                    var bytelen = Int32.Parse(stLen);
                    length = bytelen;
                    if ((end + 2 + length) &gt;= str.Length) length = str.Length - 2 - end;
                    var stRet = str.Substring(end + 2, length);
                    while (StringEncoding.GetByteCount(stRet) &gt; bytelen) {
                        length--;
                        stRet = str.Substring(end + 2, length);
                    }
                    _pos += 6 + stLen.Length + length;
                    if (XmlSafe) stRet = stRet.Replace(&quot;n&quot;, &quot;rn&quot;);
                    return stRet;
                case 'a':
                    start = str.IndexOf(&quot;:&quot;, _pos) + 1;
                    end = str.IndexOf(&quot;:&quot;, start);
                    stLen = str.Substring(start, end - start);
                    length = Int32.Parse(stLen);
                    var htRet = new Dictionary&lt;object, object&gt;(length);
                    var alRet = new List&lt;object&gt;(length);
                    _pos += 4 + stLen.Length; //a:Len:{
                    for (int i = 0; i &lt; length; i++) {
                        var key = deserialize(str);
                        var val = deserialize(str);

                        if (alRet != null) {
                            if (key is int &amp;&amp; (int)key == alRet.Count)
                                alRet.Add(val);
                            else
                                alRet = null;
                        }
                        htRet[key] = val;
                    }
                    _pos++;
                    if (_pos &lt; str.Length &amp;&amp; str[_pos] == ';')
                        _pos++;
                    return alRet != null ? (object)alRet : htRet;
                default:
                    return &quot;&quot;;
            }
        }
    }
}</pre>