---
layout: post
section-type: post
title: WP-Tipp #062 – High-Five - Inhalte mit NFC teilen
date: 2013-10-09 17:21
author: Gordon Breuer
comments: true
category: Unknown
tags: [Mobile, Tipps-Tricks, German]
---
<img class="alignleft size-full wp-image-4267" style="margin-right: 10px; margin-bottom: 10px;" alt="WP-TdT-Kommunikation-8" src="http://anheledirwp.blob.core.windows.net/wordpress/2013/10/WP-TdT-Kommunikation-8.png" width="124" height="124" />

Obwohl das Mobiltelefon ein wahres Multitalent für die Kommunikation mit anderen Leuten ist, gibt es nur wenige wirklich einfache Möglichkeiten beispielsweise ein Foto oder einen Kontakt meinem Gegenüber "mal eben schnell" zukommen zu lassen. Üblicherweise erstellt man eine neue E-Mail, fügt das Gewünschte als Anhang an und schickt sie dem eigentlich nur eine Armlänge entfernten Partner. Darin haben wir inzwischen soviel Routine, dass uns das beinahe selbstverständlich vorkommt.

<strong>Mögliche Probleme dabei:</strong>
<ul>
	<li>Einer oder beide haben keine Datenverbindung, die E-Mail kann also nicht verschickt / empfangen werden</li>
	<li>Bei einer großen Anzahl an Anhängen oder einer großen Dateigröße (bsp. bei Fotos) wird sowohl die Datenverbindung als auch der Mailserver belastet</li>
	<li>Hat man die Mail-Adresse des Empfängers noch nicht gespeichert, muss diese erst eingetippt werden (nachdem man sie sich mindestens 3x hat diktieren lassen bis sie fehlerfrei ist)</li>
</ul>
<span style="color: #000000; font-family: sans-serif;">Für das Verschicken über kurze Distanzen erscheint das alles doch viel zu komplex. Der Kontakt oder die Fotos sollen ja nicht um die halbe Welt geschickt werden, sondern im Prinzip ja nur wenige Meter. Gibt es hierfür nicht besser geeignete Übertragungswege?</span>

Wer jetzt an Bluetooth denkt hat völlig Recht: Hierbei handelt es sich um ein Protokoll, dass für genau solche Zwecke gemacht wurde und die Kommunikation von kleinen und großen Datenmengen über kurze Distanzen (~10 Meter) ermöglicht. Aber warum wird es dann so selten in der Praxis verwendet?

Eine Datenübertragung über Bluetooth ist recht aufwändig zu etablieren: Zunächst muss das empfangende Gerät sich "sichtbar" machen, damit das sendende Gerät dieses finden kann für die so genannte Kopplung. Aus Sicherheitsgründen muss man dann auch noch einen Pin austauschen und auf dem jeweils anderen Gerät eingeben. Erst dann kann ich meine Informationen versenden, wähle erneut aus einer Liste den richtigen Bluetooth-Empfänger aus - und wenn alles glatt läuft, bekommt der Empfänger dann eine Anfrage ob er das Gesendete auch speichern / öffnen möchte. Und damit die Liste der Bluetooth-Geräte mit denen man sich regelmäßig koppelt nicht zu lang wird, löscht man diesen nur einmal verwendeten Eintrag dort wieder. Dann doch lieber eine E-Mail schreiben ...

...oder man reduziert die Kopplung und den Austausch der Pin bei der Bluetooth-Übertragung auf ein kurzes "High Five" der beiden Smartphones! Dabei springen die Informationen natürlich nicht auf wundersame Weise von einem Gerät zum anderen, sondern man überträgt diese mit einem weiteren Protokoll: NFC (engl: Near-Field-Communication, dt: Nahbereichs-Kommunikation).

Moderne Smartphones haben einen entsprechenden Sender / Empfänger bereits verbaut und man kann ihn bei Windows Phone beispielsweise im Menü zum Versenden als "Tap &amp; Senden" finden: Wählt man diese Option aus, fängt das eigene Handy an über NFC ein entsprechendes Signal zu senden, dass von einem anderen Handy ebenfalls per NFC empfangen wird. In dieser Nachricht enthalten sind alle Informationen, welche die beiden Geräte benötigen um eine einmalige Bluetooth-Verbindung zu etablieren und darüber eine Datei (Foto, Visitenkarte, ...) zu versenden.

<img class="alignleft size-medium wp-image-4268" style="margin-right: 10px; margin-bottom: 10px;" alt="Windows Phone Screenshot - Einstellungen - Bluetooth und NFC" src="http://anheledirwp.blob.core.windows.net/wordpress/2013/10/WP_20131009-180x300.png" width="180" height="300" />

Die eigentliche Datenübertragung findet dann über Bluetooth im Hintergrund statt. NFC ist weder für große Datenmengen noch für eine hohe Übertragungsgeschwindigkeit ausgelegt. Die Reichweite bei zwei aktiven NFC-Sensoren beträgt bis zu 10cm, tatsächlich aber ist der empfangende Sensor meistens passiv um Strom zu sparen. Dadurch sinkt die Reichweite auf ~1-2cm. Deshalb muss man auch die beiden Handys "Rücken an Rücken" in Höhe der jeweiligen NFC-Antennen aneinander halten, sie "tappen" sich also.

Der ganze Vorgang um die Datenübertragung zu starten dauert nur wenige Sekunden und man muss keine Informationen direkt austauschen wie E-Mail Adresse, Bluetooth-Name oder Pins. Das funktioniert grundsätzlich auch unabhängig vom Handy-Typ, es ist also auch möglich z.B. Fotos von einem Windows Phone an ein Android-Gerät zu schicken oder auch an entsprechende Tablets, Notebooks, ...

Damit die Übertragung unter Windows Phone funktioniert müssen sowohl Bluetooth als auch NFC (unter "Tap &amp; senden" in den Einstellungen) auf beiden Geräten eingeschaltet sein. Mit Hilfe von NFC können auch andere Geräte mit Bluetooth gekoppelt werden, für die man sonst erst eine Suche und ggf. die Eingabe eines Pins benötigt. Hiervon machen beispielsweise das Bluetooth-Headset <strong>BH-220 "Luna" von Nokia</strong> Gebrauch, oder auch die <strong>JBL PlayUp</strong> bzw. <strong>JBL PowerUp</strong> Lautsprecher. Auch andere Daten können entweder über so genannte NFC-Tags empfangen werden (bsp. Aufkleber, Schlüsselanhänger, Chip-Karten, ...) und so beispielsweise Apps oder die Navigation zu einem bestimmten Ort starten.
