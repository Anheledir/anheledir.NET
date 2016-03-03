---
layout: post
section-type: post
title: Screenshots der eigenen Windows Phone App verhindern
category: Development
tags: [mobile, windows phone, silverlight, winprt]
---
<a href="http://anheledirwp.blob.core.windows.net/wordpress/2014/10/CaptureProtectedContent.png"><img class="alignright size-thumbnail wp-image-7178" src="http://anheledirwp.blob.core.windows.net/wordpress/2014/10/CaptureProtectedContent-150x150.png" alt="Cannot capture protected Content" width="150" height="150" /></a>Es kann Situationen geben, in denen man gerne verhindern möchte, dass der Benutzer der eigenen App einen Screenshot (Lautstärke hoch + Ein-/Aus-Button kurz drücken) erstellen kann. Sei es während der Darstellung von internen Zahlen / Daten im Enterprise-Umfeld, oder auch bei einer App wie Snapchat.

[appbox windowsphone 82fa6341-28dc-4203-bd08-9749b167bc4b]

Es gibt ein API mit dem genau das verhindert werden kann, sowohl für die Silverlight 8.0 Apps (ab GDR 1) als auch für die WinPRT-Apps. Wenn der Benutzer dann versucht einen Screenshot anzufertigen erhält er die Meldung angezeigt, dass das bei geschützten Inhalten nicht funktioniert. Jedoch ist in der Silverlight-API die entsprechende Eigenschaft versteckt und deshalb nur über Umwege erreichbar.

<strong>Windows Phone 8.1 <em>WinPRT</em>-App:
</strong>
<pre>Windows.UI.ViewManagement.ApplicationView.GetForCurrentView().<a href="http://msdn.microsoft.com/en-us/library/windows/apps/windows.ui.viewmanagement.applicationview.isscreencaptureenabled.aspx?cs-save-lang=1&amp;cs-lang=csharp#code-snippet-1">IsScreenCaptureEnabled </a>= false;</pre>
<strong>Windows Phone 8.1 <em>Silverlight</em>-App:</strong>
<pre>public static void SetScreenCaptureEnabled(this Microsoft.Phone.Controls.PhoneApplicationPage page, bool enabled)
{
    var propertyInfo =
        typeof (Microsoft.Phone.Controls.PhoneApplicationPage).GetProperty("IsScreenCaptureEnabled");
 
    if (propertyInfo != null)
    {
        propertyInfo.SetValue(page, enabled);
    }
}
</pre>
Eine schöne Lösung als Attached-Property gibt es auch <a title="Added screenshot enabling / disabling " href="https://github.com/advancedrei/XamlEssentials/commit/3e6be9c2866e80694f8d60dee6aa943b2a9bc825">auf GitHub in den XamlEssentials</a>.

Das jemand sich Daten abschreibt oder auch mit einer Kamera vom Display abfotografiert, kann man so natürlich trotzdem nicht verhindern.
