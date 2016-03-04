---
layout: post
section-type: post
title: Die Genauigkeit bei der Stifteingabe auf dem Surface (2) Pro verbessern
date: 2013-12-11 15:30
author: Gordon Breuer
comments: true
category: Unknown
tags: [Mobile, Tipps-Tricks, German]
---
<img class="alignleft size-thumbnail wp-image-7024" alt="3286.Surface_Pro" src="http://anheledirwp.blob.core.windows.net/wordpress/2013/12/3286.Surface_Pro-150x150.jpg" width="150" height="150" />Seit ich das Microsoft Surface Pro besitze, bin ich eigentlich ein ziemlicher Fan von dem Device. Es ist leicht und klein genug um es quasi immer dabei zu haben, mit dem Type-Cover kann man trotzdem bequem längere Texte schreiben und auf die Stift-Bedienung möchte ich am liebsten gar nicht mehr verzichten.

Als ich mich gestern mit einem Arbeitskollegen unterhielt, der ein Surface 2 Pro hat, stellte sich jedoch heraus das er zwar auch sehr zufrieden mit dem Gerät ist, aber er den Stift quasi nie verwendet weil dieser ihm zu ungenau arbeitet. Und tatsächlich, im direkten Vergleich merkt man sehr wohl, dass bei seinem Surface die Cursor-Position schon mal einige Millimeter von der Stift-Position abweicht. Das ist natürlich nicht so schön, aber lässt sich mit einem einfacheren Trick zum Glück korrigieren! :-)

<img class="alignright size-thumbnail wp-image-7026" alt="SurfaceProplumapantalla_Print" src="http://anheledirwp.blob.core.windows.net/wordpress/2013/12/SurfaceProplumapantalla_Print-150x150.jpg" width="150" height="150" />In den PC-Einstellungen kann man das Surface sowohl für die Finger-Eingabe als auch den Stift mit Wacom-Technology kalibrieren. Für die erstmalige Einrichtung werden 16 Referenzpunkte angezeigt, die man nacheinander mit dem Stift antippen soll. Eine zusätzliche Kalibrierung verwendet gar nur 4 Referenzpunkte. Danach ist die Positionierung des Stiftes in der Regel im Randbereich recht genau, weicht aber immer mehr ab je weiter man sich in die Bildschirmmitte bewegt. Man kann die Kalibrierung jedoch auch manuell starten und dabei selbst festlegen an welchen Stellen der X- und Y-Achse die Hilfslinien für die Referenzpunkte gezogen werden. Als ausreichend hat sich eine Kalibrierung mit 100 Referenzpunkten gezeigt - zwar ein wenig mühsam und dauert auch ein paar Minuten, aber dafür kann man sich hinterher einer in der Regel sehr präzisen Stift-Eingabe erfreuen.

Im ersten Schritt müssen die eventuell bereits vorhandenen Kalibrierungsdaten gelöscht werden unter <em>Systemsteuerung -&gt; Tablet PC-Einstellungen -&gt; Anzeige -&gt; Zurücksetzen</em>

Danach öffnet man eine Eingabeaufforderung (wichtig: Nicht die Powershell!) und gibt dort den folgenden Befehl ein: <strong>tabcal lincal novalidate XGridPts=10,60,110,360,660,960,1260,1560,1860,1910 YGridPts=10,60,170,330,490,650,810,970,1020,1070</strong>

Im Anschluss muss man wie schon gesagt nacheinander mit dem Stift die 100 Referenzpunkte auswählen und anschließend die Kalibrierung speichern. Danach sollte die Stift-Eingabe auf dem Surface Pro deutlich genauer sein und macht auch wieder Spaß beim Malen und Zeichnen. :-)
