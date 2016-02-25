---
layout: post
section-type: post
title: Probleme beim Einrichten der Microsoft-ID auf einem neuen Windows Phone
date: 2013-12-11 14:11
author: Gordon Breuer
comments: true
categories: [Mobile, Tipps &amp; Tricks]
---
<img class="alignleft size-full wp-image-6810" style="margin-right:10px; margin-bottom:10px;" alt="WP-TdT-Kommunikation-8" src="http://anheledirwp.blob.core.windows.net/wordpress/2013/10/WP-TdT-Kommunikation-8.png" width="124" height="124" />Vor ein paar Tagen hat mich <a title="Blog von Sascha Dittmann" href="http://www.sascha-dittmann.de/">Sascha Dittmann</a> angeschrieben, ob ich eine Idee hätte warum er auf seinem neuen Windows Phone kein Microsoft-Konto anlegen könne. Auf die Lösung kam er wenig später selber - hab die Nachricht erst abends gelesen - als er bemerkt hat das zwar Uhrzeit und Tag korrekt eingestellt waren, aber nicht der korrekte Monat. Dadurch gibt es vermutlich Probleme beim Austausch von Sicherheits-Token die auf dem aktuellen Datum und der Uhrzeit basieren - und es kommt nur eine nichtssagende Fehlermeldung das man die Verbindung überprüfen oder es später erneut versuchen soll.

Gestern habe ich nun selbst mal wieder ein neues Windows Phone eingerichtet (das Nokia Lumia 1520 als Leihgerät, Testbericht folgt die Tage) und zunächst auch den gleichen Fehler erhalten. Saschas Problem hatte ich in der Zwischenzeit schon wieder verdrängt und so dauerte es ein paar Stunden, bis ich schließlich auch selbst auf die Lösung kam als ich das falsche Datum &amp; Uhrzeit entdeckte.

Jetzt stellte sich mir natürlich die Frage, wieso mir das passiert ist - immerhin habe ich in den letzten Monaten immer wieder Smartphones zurückgesetzt und neu eingerichtet, und mir ist das eigentlich noch nie passiert. Warum also jetzt? Ich meine die Ursache inzwischen zu kennen: <a title="Windows Phone Preview für Entwickler verfügbar" href="http://gordon-breuer.de/2013/10/windows-phone-preview-fuer-entwickler-verfuegbar/">GDR3</a>!

Mit dem jüngsten Update hat Microsoft endlich die Möglichkeit hinzugefügt, vor dem Einspielen eines Backups sich an einem WLAN anzumelden. Bis dahin ging der Traffic für das Wiederherstellen eines Backups immer zu Lasten der mobilen Datenverbindung. Doch ein anderer Schritt ist dafür still und heimlich offenbar bei der Einrichtung weggefallen: Die Abfrage nach Datum und Uhrzeit! Zwar musste ich immer noch meine Sprache und Region einstellen, aber bei früheren Versionen von Windows Phone 8 wurde auch immer die Zeiteinstellung abgefragt. Eigentlich ja auch sinnvoll, da die Anmeldung mit dem Microsoft-Account nur mit korrekt gesetztem Zeitstempel funktioniert.

Deshalb als Tipp, bei Problemen mit dem Einrichten von Konten explizit noch einmal Datum und Uhrzeit zu kontrollieren sowie die korrekte Zeitzone.
