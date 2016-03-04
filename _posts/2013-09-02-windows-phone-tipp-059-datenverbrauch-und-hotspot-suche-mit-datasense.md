---
layout: post
section-type: post
title: WP-Tipp Nr.059 - Datenverbrauch und Hotspot-Suche mit DataSense
date: 2013-09-02 14:20
author: Gordon Breuer
comments: true
category: Unknown
tags: [Development, gdr2, hotspot, Mobile, Tipps-Tricks, German, winphone, wlan]
---
<img class="alignleft size-full wp-image-4250" style="margin-right: 10px; margin-bottom: 10px;" alt="Windows Phone 8 Tipp des Tages - Internet und Bing" src="http://anheledirwp.blob.core.windows.net/wordpress/2013/09/WP-TdT-Internet-Bing-8.png" width="124" height="124" />

Schon bei der ersten öffentlichen Präsentation von <strong>Windows Phone 8</strong> hat Microsoft ein neues Feature namens <strong>DataSense</strong> präsentiert. Ein Tool mit dem es nicht nur möglich ist, den <strong>genauen Datenverbrauch</strong> jeder einzelnen App zu kontrollieren, sondern dass auch durch serverseitige Kompression der Datenpakete eine Reduzierung um <strong>bis zu 40%</strong> des Traffics schaffen soll. Erreicht man dennoch allmählich die eingestellten Grenzwerte, so können analog zum Batterie-Sparmodus besonders datenhungrige Anwendungen eingeschränkt werden (<em>bsp. das automatische Mail-Abrufen oder Software-Updates</em>). Das besondere dabei ist, dass die DataSense-API grundsätzlich immer verfügbar ist und auch von Anfang an den verbrauchten Traffic aller Apps protokolliert. Allerdings war vor allem in europäischen Versionen des Betriebssystems in der Regel die System-App nicht installiert, mit der man die Daten auch einsehen konnte. Auch der Zugriff über die API ist nicht möglich, so dass der eigentlich enorm praktische Datenzähler für einen Großteil der Anwender bisher nicht zur Verfügung stand.
<h3>Änderungen mit dem Update</h3>
Bisher - denn mit dem <strong>GDR2-Update</strong> von Windows Phone wird <strong>DataSense</strong> einer breiteren Öffentlichkeit zur Verfügung gestellt.Die Möglichkeit der <em>serverseitigen Kompression</em> funktioniert auch weiterhin nur bei wenigen Providern, da hierzu deren Infrastruktur angepasst werden müsste. Dennoch ist die Möglichkeit den Trafficverbrauch des Windows Phones im Details kontrollieren zu können schon eine sehr praktische Funktion!

Der Datenverbrauch wird getrennt protokolliert für <strong>WLAN-Verbindungen</strong> und für <strong>mobile Datenverbindungen</strong> über den Mobilfunkprovider. Für letzteres kann man auch unterschiedliche Limitierungen einstellen:
<ul>
	<li>unbekannt</li>
	<li>monatlich</li>
	<li>einmalig</li>
	<li>unbegrenzt</li>
</ul>
<span style="color: #000000; font-family: sans-serif;">Nicht nur hat diese Konfiguration Einfluss auf die Anzeige bzw. das automatische Zurücksetzen, auch können diese Einstellungen über die entsprechende <strong>API</strong> von Entwicklern abgefragt und entsprechend ausgewertet werden. In Kombination mit der Abfrage, ob man sich im Heimnetz oder in einem Fremdnetz (<em>Roaming</em>) befindet, können so potentiell teure und unerwünschte Aktionen innerhalb von Apps <strong>unterbunden</strong> bzw. erst nach <strong>expliziter Bestätigung</strong> durch den Nutzer verwendet werden. Beispielsweise überprüft die <strong>Contacts 4 XING App</strong> mit dem Update auf Version 1.5 das noch verbleibende Datenvolumen: Sind <em>weniger als 10%</em> des eingestellten Traffics noch verfügbar oder befindet sich der Benutzer in einem Roaming-Netz, so werden die Kontakte nicht mehr automatisch aktualisiert und die App warnt den Benutzer zunächst.</span>
<h3>Für Entwickler</h3>
Wer sich übrigens auch für die technische Seite der <strong>DataSense-API</strong> interessiert oder sie in einer eigenen App verwenden möchte, kann sich das <strong>kostenlose Internet-Special der CSI:WP-Roadshow</strong> herunterladen. Hier findet sich noch mal eine detaillierte Beschreibung inklusive <strong>Referenz</strong> und <strong>Code-Beispiel</strong> für Entwickler:

[slideshare id=24612316&amp;doc=datasense-130725073327-phpapp01]
<h3>Das unscheinbare Feature: Hotspots in der Nähe</h3>
Neben den vielen nützlichen Funktionen von DataSense wird ein mindestens ebenso praktisches Feature oft übersehen: Öffnet man in der DataSense-App die App-Bar, also die Icon-/Menüleiste ganz unten am Bildschirm, hat man obendrein die neue Funktion, nach <strong>WLANs in der Umgebung</strong> zu suchen. Tatsächlich werden hier <strong>Hotspots</strong> gesucht und in der Karten-App angezeigt, in die man sich idR öffentlich anmelden kann. Hier findet man beispielsweise die tausenden Hotspot-Zugänge der Telekom, aber auch die von anderen Anbietern. Diese kann man als <em>POI</em> auswählen und bsp. direkt dorthin navigieren. Ein weiterer Einstiegspunkt für das Feature ist außerdem in den<strong> WLAN-Einstellungen</strong>: Hier befindet sich der Link zur Hotspot-Suche direkt <em>unterhalb der Liste der verfügbaren / gefundenen SSIDs</em> in der Nähe.
