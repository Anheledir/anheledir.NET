---
layout: post
section-type: post
title: Google AdMob für Windows Phone 7
category: Unknown
tags: []
---
<p>Google hat <a href="http://googlemobileads.blogspot.com/2011/03/new-beta-admob-windows-phone-7-sdk.html">gestern</a> f&uuml;r seinen Mobile Advertising-Dienst <a href="http://www.admob.com/">AdMob</a> ein SDK f&uuml;r Windows Phone 7 herausgebracht. Nach dem es kaum Alternativen vor allem im deutschsprachigen Raum gibt, ist dieser Schritt auf jedenfall positiv zu sehen.</p>
<p>Die Einbindung ist relativ simpel (<a href="http://code.google.com/intl/de-DE/mobile/ads/docs/wp7/fundamentals.html">hier</a> die offizielle Anleitung):</p>
<ul>
<li>Account bei admob.com anlegen </li>
<li>Die eigene Anwendung im Dashboard erstellen </li>
<li>Das SDK herunterladen </li>
<li>Die .dll-Datei im WP7-Projekt referenzieren </li>
<li>Das Ad-Control bsp. mit einer Zeile XAML-Code einbinden: </li>
</ul>
<pre class="brush: xml">&lt;google:bannerad adunitid="" xmlns:google="clr-namespace:Google.AdMob.Ads.WindowsPhone7.WPF;assembly=Google.AdMob.Ads.WindowsPhone7" /&gt;</pre>
<p><em>Vielleicht als Anmerkung: Im Moment ist in der offiziellen Anleitung noch das Beispiel ohne self-closing Tag abgebildet, das sollte man nat&uuml;rlich korrigieren. ;-)</em></p>
<p>Soweit, so einfach. Das von Google bereitgestellte Beispiel funktionierte bei mir auch sofort auf Anhieb. Nur die Implementation in mein eigenes Projekt wollte einfach nicht gelingen: Nach dem Starten der App kam immer sofort eine Fehlermeldung, die nicht mal vom allgemeinen Exception-Handling abgefangen wurde:</p>
<pre class="brush: text">System.SystemException was unhandled
  Message=An unknown error has occurred. Error: 80010108.
  StackTrace:
       at Microsoft.Phone.Controls.NativeMethods.ValidateHResult(Int32 hr)
       at Microsoft.Phone.Controls.WebBrowserInterop.set_IsScriptEnabled(Boolean value)
       at Microsoft.Phone.Controls.WebBrowser.OnPresentationHosted(IWebBrowserInterop hostedInterop)
       at Microsoft.Phone.Controls.WebBrowserHwndHost.BuildWindowCore(IntPtr hwndParent)
       at MS.Internal.HwndHost.BuildWindow(IntPtr hwndParent, IntPtr&amp; hwnd)
       at MS.Internal.HwndHost.BuildWindow(IntPtr nativeHwndHost, IntPtr hwndParent, IntPtr&amp; hwnd)
       at MS.Internal.XcpImports.SetValueNative(IntPtr element, UInt32 property, CValue&amp; outval)
       at MS.Internal.XcpImports.SetValue(INativeCoreTypeWrapper obj, DependencyProperty property, DependencyObject doh)
       at System.Windows.DependencyObject.SetValue(DependencyProperty property, DependencyObject doh)
       at System.Windows.Controls.Border.set_Child(UIElement value)
       at Microsoft.Phone.Controls.WebBrowser.OnApplyTemplate()
       at System.Windows.FrameworkElement.OnApplyTemplate(IntPtr nativeTarget)
       at MS.Internal.XcpImports.MethodExNative(IntPtr context, IntPtr element, UInt32 cString, String name, UInt32 cParams, IntPtr pParams, CValue&amp; outval, Int32&amp; typeIndex)
       at MS.Internal.XcpImports.MethodEx(IntPtr ptr, String name, CValue[] cvData)
       at MS.Internal.XcpImports.MethodEx(DependencyObject obj, String name)
       at MS.Internal.XcpImports.FrameworkElement_ApplyTemplate(FrameworkElement frameworkElement)
       at System.Windows.FrameworkElement.ApplyTemplateInternal()
       at System.Windows.Controls.Control.ApplyTemplate()
       at Microsoft.Phone.Controls.WebBrowser.OnLoaded(Object sender, RoutedEventArgs e)
       at System.Windows.CoreInvokeHandler.InvokeEventHandler(Int32 typeIndex, Delegate handlerDelegate, Object sender, Object args)
       at MS.Internal.JoltHelper.FireEvent(IntPtr unmanagedObj, IntPtr unmanagedObjArgs, Int32 argsTypeIndex, String eventName)</pre>
<p>&nbsp;</p>
<p>Es hat mich gestern Abend einige M&uuml;he gekostet herauszufinden, woran das liegen k&ouml;nnte. Die L&ouml;sung fand sich schlie&szlig;lich in der Datei <strong>WMAppManifest.xml</strong> im Properties-Ordner. Hier muss unbedingt der <strong>ID_CAP_WEBBROWSERCOMPONENT</strong> gesetzt werden, den ich vor einiger Zeit wegen Nichtverwendung entfernt hatte.</p>
<p>Kaum wurde die Eigenschaft wieder eingetragen, funktionierte auch das Ad-Control fehlerfrei.</p>
