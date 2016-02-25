---
layout: post
title: WP-Tipp #051 – Das Handy (schneller?) wiederfinden
date: 2011-11-15 11:00
author: Gordon Breuer
comments: true
categories: [Mobile, Tipps &amp; Tricks]
---
<p><img style="margin: 0px 10px 0px 0px; display: inline; float: left" title="" alt="Windows Phone Tipp des Tages: Sonstiges" align="left" src="http://anheledirwp.blob.core.windows.net/wordpress/2011/11/sonstiges1.png" /></p>  <p>Bereits in <a href="/post/2011/09/30/WP-Tipp-021&ndash;Ubersicht-der-wichtigsten-Daten-im-Web.aspx">Tipp #021</a> habe ich mal über die Möglichkeit gesprochen, das eigene Windows Phone über die Weboberfläche aufzuspüren. Sei es über das Abspielen eines lauten Klingeltones (<em>unabhängig von eingestellter Lautstärke am Smartphone</em>), die Anzeige des GPS-Standortes auf einer Karte, das Sperren mit PIN und einer optionalen Nachricht (<em>bsp. einer Rückrufnummer oder Adresse für den ehrlichen Finder</em>) oder als letzte Maßnahme das Löschen aller Daten vom Handy damit kein Unfug damit getrieben werden kann.</p>  <p><img style="margin: 0px 0px 0px 10px; display: inline; float: right" title="" alt="Windows Phone - Einstellungen - Mein Handy finden" align="right" src="http://anheledirwp.blob.core.windows.net/wordpress/2011/11/6347190658_b41ffa0591.jpg" width="180" height="300" /></p>  <p>Es kommen jedoch immer wieder mal Fragen auf, was es mit der “<strong>Schnelleren Verbindung</strong>” auf sich hat. Zunächst einmal zur Beruhigung: Die Funktionen zum Finden, Sperren und Löschen des Windows Phone funktionieren auch wenn man die schnellere Verbindung nicht aktiviert. In diesem Fall verwendet der Service im Hintergrund spezielle Service-SMS (<em>auch “Binär-SMS” genannt</em>), die das Windows Phone beim Empfang abfängt statt sie anzuzeigen und dann die entsprechenden Funktionen (<em>“laut klingeln”, …</em>) ausführt. Der SMS-Empfang dauert jedoch, je nach Anbieter, auch schon mal etwas länger; vor allem bei SMS aus dem Ausland.</p>  <p>Setzt man den Haken bei der oberen Option “<strong>Schnellere Verbindung mit diesen Features herstellen</strong>”, so wird der Empfang von so genannten Push-Nachrichten hierfür aktiviert. Das sind im Gegensatz zu den SMS kleine Datenpakete, die direkt an ihr Handy gesendet werden. Hierfür muss dieses jedoch auch eine <a href="/post/2011/10/07/WP-Tipp-025-&ndash;-Datenverbindungen.aspx">Datenverbindung</a> aktiv haben, was den erwähnten höheren Akkuverbrauch erklärt. Jedoch wird in der Regel das Aktivieren der Option an dieser Stelle kaum einen Unterschied machen, da die Push-Nachrichten sowieso aktiv sind und von verschiedenen Diensten verwendet werden, beispielsweise <a href="http://www.windowsphone.com/de-DE/apps/218a0ebb-1585-4c7e-a9ec-054cf4569a79">WhatsApp</a>.</p>  <p>Sollte übrigens das Senden eíner Push-Benachrichtigung fehlschlagen, so wird der Microsoft-Service automatisch auf die alternative SMS zurückgreifen um die Funktion dennoch zu verwenden. Sollte das Handy also kurzzeitig gar keinen Empfang haben, die SMS jedoch später zugestellt werden, wird die Systemsperre etc. danach automatisch durchgeführt.</p>