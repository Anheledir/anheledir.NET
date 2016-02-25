---
layout: post
title: Platzhalter in einem String ersetzen
date: 2008-03-17 20:52
author: Gordon Breuer
comments: true
categories: [Development]
---
<p>Die Frage kam am Wochenende bei <a href="http://glengamoi.com" target="_blank">Glengamoi</a> auf: Man hat einen String &quot;<strong>Lorem ipsum <em>[[Parameter1=49;Parameter2=0815]]</em> dolor sit amet</strong>&quot;, und möchte dabei den mit der doppelten eckigen Klammer eingeschlossenen Parameter auslesen und durch etwas neues ersetzen. </p>  <p>Da es hier um mein Lieblingsthema &quot;Reguläre Ausdrücke&quot; ging möchte ich meine Lösung hier auch noch mal notieren - dem Fragesteller hatte sie zumindest geholfen. </p>  <div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:80a01704-68a8-4938-9470-99d08ad470f7" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#">using System.Text.RegularExpressions;
…
string inputString = "Lorem ipsum [[Parameter1=1;Parameter=2]] dolor sit amet";
string paramString, resultString;
Regex r = new Regex(@"[[(?&amp;lt;param&amp;gt;.*)]]", RegexOptions.IgnoreCase | RegexOptions.Singleline );
Match m = r.Match( inputString );
paramString = m.Groups["param"].Value;
// Hier den Inhalt von paramString prüfen und durch das Gewünschte ersetzen
resultString = Regex.Replace(inputString, @"[[.*]]", paramString, RegexOptions.Singleline | RegexOptions.IgnoreCase);</pre></div>

<p>Eigentlich ganz simpel ... aber nicht jeder freundet sich gerne mit RegEx an. :-) </p>
