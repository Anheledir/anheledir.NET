---
layout: post
section-type: post
title: Bildkomprimierung bei mobilen Datentarifen
date: 2008-09-08 03:03
author: Gordon Breuer
comments: true
category: Development, English, Werkzeugkiste
---
<p>
<img style="margin: 0px 10px 0px 0px; border: 0px" src="http://anheledirwp.blob.core.windows.net/wordpress/2008/09/ap_26914_chillhandy_2_6.jpg" border="0" alt="aboutpixel.de / Chillin' phone &copy; Stachurski Michael " title="aboutpixel.de / Chillin' phone &copy; Stachurski Michael " width="244" height="184" align="left" /> Seit einiger Zeit bin ich vollst&auml;ndig auf einen Datentarif von Vodafone umgestiegen um auch zu Hause ins Internet zu gehen. Die 10GB Traffic im Monat reichen normalerweise aus und wenn ich doch mal dr&uuml;ber komme muss ich mich halt ein paar Tage mit GPRS abfinden. Daf&uuml;r muss ich aber auch unterwegs nicht auf E-Mail und Internet verzichten. 
</p>
<p>
Das einzige das mich bisher enorm gest&ouml;rt hat war die automatische Komprimierung von Bildern beim Betrachten &ldquo;normaler&rdquo; Webseiten. Vodafone hat, wie alle anderen deutschen Provider auch, einen Proxy der Firma ByteMobile transparent dazwischen geschaltet &uuml;ber den automatisch alle Anfragen gesendet werden. Wenn der Datenstream ausgelesen werden kann (also nicht bei https oder VPN-Verbindungen) werden alle enthaltenen Bilder verlustbehaftet komprimiert um so die zu &uuml;bertragene Datenmenge zu reduzieren. Ein kleines Javascript soll im Hintergrund dann die Tastenkombination Strg+F5 abfangen und daraufhin die Originalbilder nachladen. Das hat bei mir allerdings nicht funktioniert. Auch der HighPerformance Client, den Vodafone separat zum Download anbietet, wollte bei mir einfach nicht starten. 
</p>
<p>
Schlie&szlig;lich ging mir jetzt am Wochenende die Geduld aus und ich habe mir ein kleines Programm geschrieben, dass einen Befehl zum Abschalten der Bildkomprimierung an den ByteMobile-Proxy sendet. Das Programm muss daf&uuml;r nicht st&auml;ndig im Hintergrund laufen sondern wird einfach einmal nach dem Herstellen einer Verbindung gestartet. Ich habe es mir hierf&uuml;r als externes Programm in den Vodafone Mobile Connect eingetragen. Die eigentliche Ausf&uuml;hrung dauert nur einen kurzen Moment, abh&auml;ngig von der Geschwindigkeit in der der Proxy antwortet. 
</p>
<p>
Getestet habe ich es wie gesagt selber mit Vodafone in Deutschland, vermutlich funktioniert es aber auch mit allen anderen Providern die den ByteMobile-Proxy einsetzen. 
</p>
[addlang] 
<p>
<img style="margin: 0px 10px 0px 0px; border: 0px" src="http://anheledirwp.blob.core.windows.net/wordpress/2008/09/ap_26914_chillhandy_2_3.jpg" border="0" alt="aboutpixel.de / Chillin' phone &copy; Stachurski Michael " title="aboutpixel.de / Chillin' phone &copy; Stachurski Michael " width="145" height="110" align="left" />I&rsquo;m using a Vodafone data tariff for using the internet since a few weeks. Everything works good except the automatically lossy image compression. Vodafone German, just like most other cellphone-provider, has a transparent proxy from ByteMobile to reduce the image quality on-the-fly to reduce the traffic. But there are a lot of applications when this behavior is not desired, for example when watching a photo gallery. 
</p>
<p>
There are some solutions for this problem, but neither the Vodafone HighPerformance Client nor an alternative connection tool has solved it satisfying. So I wrote my own program to deactivate the image compression. 
</p>
<p>
Just run this tool everytime after establishing a new connection with your cellphone-provider. It&rsquo;s not memory resistent and takes only a short moment to send the command to the proxy. I tested it with Vodafone Germany but most likely it will also function with other cellphone-provider using the ByteMobile-Proxy. 
</p>