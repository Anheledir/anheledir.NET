---
layout: post
section-type: post
title: Das Windows Phone als Webbrowser erkennen
category: Unknown
tags: []
---
<p>Es ist vollbracht! Sie haben nach wochenlanger Planung, Programmierung und Testen endlich ihre Windows Phone 7 Anwendung fertiggestellt und im Marketplace ver&ouml;ffentlicht. Gehen wir einmal von einer Webanwendung aus, beispielsweise ein CMS oder ein Eventplaner. Ihre Besucher wissen vielleicht gar nicht, dass es inzwischen eine App gibt um die Verwendung zu vereinfachen. Nat&uuml;rlich, man kann einen Link, einen Button oder auch eine ganze Supporseite zur Verf&uuml;gung stellen. Doch vor allem auf dem kleinen Display eines Handys wird der Nutzer meistens nur auf ihm bekannte und wichtige Elemente achten, bsp. zum Anmelden. Viel einfacher w&auml;re es, wenn die Seite selber merken w&uuml;rde, dass der aktuelle Besucher eine bessere Option in Form einer App h&auml;tte.</p>
<p>Die einfachste und effektivste Form so eines Hinweises ist ein wenig Javascript, dass beispielsweise den User-Agent des Browsers ausliest. Nat&uuml;rlich sollte man den Benutzer nicht ungefragt umleiten, das w&uuml;rde ihn nur verwirren und zwingt ihm die Benutzung der App auf. Besser ist es, einen Dialog anzuzeigen, in dem auf die native App hingewiesen wird und der Benutzer so die Wahl hat entweder die App zu verwenden oder doch lieber die gewohnte Website.</p>
<p>Damit die Abfrage nicht bei jedem Seitenaufruf durchgef&uuml;hrt wird und der User trotz Verneinen der Anfrage jedes mal erneut mit der Frage bel&auml;stigt wird, muss noch ein Cookie gesetzt werden, welches die Entscheidung speichert. Im Script unten wird die G&uuml;ltigkeit des Cookies auf 30 Tage gesetzt, nach dieser Zeit oder wenn er zwischendurch die Cookies l&ouml;scht w&uuml;rde der Besucher also erneut gefragt.</p>
<p>Das Javascript selber ist relativ simpel und &uuml;berpr&uuml;ft mittels eines einfachen regul&auml;ren Ausdrucks, ob im User-Agent des aktuellen Browsers die Zeichenfolge &ldquo;Windows Phone&rdquo; oder &ldquo;ZuneWP7&rdquo; drin vor kommt. Der zus&auml;tzliche Parameter &ldquo;i&rdquo; l&auml;sst eine beliebige Gro&szlig;- und Kleinschreibung der Zeichenketten zu. Die erste Zeichenkette wird verwendet, wenn der &ldquo;Handymodus&rdquo; zur Anzeige einer Website benutzt wird, die zweite Zeichenkette findet sich im User Agent bei der Verwendung der &ldquo;Desktop&rdquo;-Anzeige. Durch das Weglassen einer der beiden Bedingungen kann man also noch genauer auf die aktuelle Konfiguration eingehen. So k&ouml;nnte man bei Verwendung der Handyversion eine speziell auf mobile Websites angepasste Version anzeigen und nur bei Verwendung der Desktop-Anzeige auf die native App per Dialog verweisen. Das Javascript entsprechend zu erweitern sollte kein Problem darstellen, im Einzelfall bin ich aber auch gerne behilflich. <img class="wlEmoticon wlEmoticon-smile" style="border-style: none;" src="http://anheledirwp.blob.core.windows.net/wordpress/2011/08/wlEmoticon-smile.png" alt="Smiley" /></p>
<p>Kommen wir nun aber zum wichtigsten Teil, dem Javascript. Speichern Sie die folgenden Zeilen beispielsweise in ihrem Webverzeichnis unter &ldquo;/Scripte/WPDetect.js&rdquo;:</p>
<pre class="brush: js; highlight: [3,5,8];">if (document.cookie.indexOf("ZuneRedirect=false") &lt; 0) {
    if (navigator.userAgent.match(/Windows Phone/i) || navigator.userAgent.match(/ZuneWP7/i)) {
        if (confirm("F&uuml;r diese Website gibt es eine native App f&uuml;r Windows Phone. M&ouml;chtest du zum Marketplace weitergeleitet werden?")) {            
            document.cookie = "ZuneRedirect=false"; 
            window.location = "http://social.zune.net/redirect?type=phoneApp&amp;id=&lt;GUID&gt;";
        } else {
            var ablaufdatum = new Date();
            ablaufdatum.setTime(ablaufdatum.getTime() + (30 * 3600000 * 24));
            document.cookie = "ZuneRedirect=false" + "; expires="+ ablaufdatum.toGMTString(); 
        }
    }
}</pre>
<p>In Zeile 3 steht die Nachricht, die der Besucher angezeigt bekommt wenn er mit dem Windows Phone auf die Seite geht, in Zeile 5 wird das Ziel der Weiterleitung festgelegt. Im Beispiel gehe ich von einer App im Zune Marketplace aus und man muss nur noch die eigene GUID an die entsprechende Position setzen. Hier kann aber auch die URL einer mobilen Version der Website stehen. In Zeile 8 wird schlie&szlig;lich definiert, wie lange das Cookie g&uuml;ltig sein soll: Der aktuelle Zeitstempel + 3.600.000 Millisekunden pro Stunde x 24 Stunden pro Tag x 30 Tage. Setzen Sie das Ablaufdatum aber nicht zu kurz. Wenn der Besucher sich bewusst gegen die mobile Version entschieden hat, dann hat er daf&uuml;r vermutlich Gr&uuml;nde und f&uuml;hlt sich durch oftes Nachfragen vermutlich nur genervt.</p>
<p>Das Einbinden der Javascript-Datei ist nun kein Hexenwerk merk. Laden Sie die eben angelegte Datei einfach innerhalb ihres Quellcodes auf der entsprechenden HTML-Seite:</p>
<pre class="brush: xml;">&lt;script type="text/javascript" src="/Scripte/WPDetect.js"&gt;&lt;/script&gt;</pre>
