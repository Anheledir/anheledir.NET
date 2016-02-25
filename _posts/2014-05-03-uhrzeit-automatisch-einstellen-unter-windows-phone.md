---
layout: post
title: Uhrzeit unter Windows Phone automatisch einstellen? Besser Finger weg.
date: 2014-05-03 23:45
author: Gordon Breuer
comments: true
category: Allgemein, Mobile
---
[caption id="attachment_7140" align="alignleft" width="150"]<a href="http://anheledirwp.blob.core.windows.net/wordpress/2014/06/wp_ss_20140110_00012.png"><img class="wp-image-7140 size-thumbnail" src="http://anheledirwp.blob.core.windows.net/wordpress/2014/06/wp_ss_20140110_00012-150x150.png" alt="Windows Phone - Einstellungen - Datum und Uhrzeit" width="150" height="150" /></a> Windows Phone - Einstellungen - Datum und Uhrzeit[/caption]

Mancher hat in den Datum- und Uhrzeit-Einstellungen von Windows Phone schon mal die Option "Automatisch einstellen" gesehen, und sich gefragt ob - bzw. wie - die überhaupt funktioniert. Denn viele sehen die genannte Option entweder gar nicht (muss explizit in der Firmware vor Auslieferung aktiviert werden) oder sie bewirkt anscheinend nichts.

Dahinter steckt eine bereits seit 1996 in unserem Mobilfunk-Standard "GSM" vorgesehene, jedoch nur optionale, Funktion zum Übertragen von Datums-/Zeitangaben und Provider-Informationen. Technisch basiert das auf dem so genannten "Network Identity and Timezone"-Mechanismus (kurz: NITZ). Hier in Deutschland wird der jedoch nur von O2 als Provider verwendet um die Zeit-Informationen bereit zu stellen. Interessanterweise macht bsp. T-Mobile das auch, jedoch in Polen und nicht in Deutschland.

Hat man die genannte Option in den Einstellungen seines Smartphones und aktiviert sie obwohl der eigene Provider sie nicht unterstützt, passiert allerdings auch nichts dramatisches. Genauer gesagt es passiert gar nichts. Naja, schon: Windows Phone blendet jetzt die Möglichkeiten Datum und Uhrzeit manuell einzustellen aus. Eigentlich ja auch logisch. Aber wenn vom Provider keine Zeitdaten kommen, wird das halt auch nie korrigiert und es gibt auch keine Hinweismeldung. Doch selbst wenn der Provider eine Aktualisierung unterstützt: Die Genauigkeit liegt bei NITZ im Bereich von Minuten.

Obwohl unter Windows Phone derzeit alternative Verfahren zum automatischen Stellen der Uhrzeit (bsp. über den eingebauten GPS-Empfänger oder mit Hilfe von Internet-Zeitservern über NTP) nicht verfügbar sind, erreicht man also oft eine wesentlich genauere Einstellung durch das manuelle Stellen. Auch das erfolgt "nur" minutengenau, aber mit einer entsprechend genauen Uhr daneben und dem gezielten Speichern zur "vollen Minute" erreicht man trotzdem eine höhere Genauigkeit als es mit NITZ über GSM möglich wäre. Also "Finger weg" von der "Automatisch einstellen"-Option und hoffen, dass Microsoft bald entweder selbst die Unterstützung für Internet-Zeitserver nachliefert, oder aber eine API zum Setzen von Datum / Uhrzeit per App zur Verfügung stellt. :-)
