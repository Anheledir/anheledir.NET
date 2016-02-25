---
layout: post
title: Störung im Routing
date: 2008-02-07 22:31
author: Gordon Breuer
comments: true
categories: [Allgemein]
---
<p>
Aufgrund einer technischen St&ouml;rung im Bereich des Rechenzentrums ist zur Zeit die Haupt-IP des Servers (<em>svr3.anheledir.net</em>) nicht erreichbar. Bisher war noch nicht in Erfahrung zu bringen, wie schnell diese S&ouml;rung beseitigt werden kann. 
</p>
<p>
Ich habe jedoch eine Backup-L&ouml;sung eingerichtet und in den DNS-Server jeweils eine zus&auml;tzliche IP-Adresse eingetragen, deren Routing im Augenblick nicht gest&ouml;rt ist. Sollte die Verbindung auf ein gehostetes Webnicht funktionieren, kann folgender Befehl ausprobiert werden: 
</p>
<blockquote>
	<p>
	<strong><em>ipconfig /flushdns</em></strong> 
	</p>
</blockquote>
<p>
Der Befehl kann im Windows-Startmen&uuml; unter dem Punkt &quot;Ausf&uuml;hren...&quot; eingegeben werden. Davor auch alle Browserfenster schliessen. Da beim erneuten Versuch per Zufall eine der beiden IP-Adressen ausgew&auml;hlt wird, k&ouml;nnt ihr danach Gl&uuml;ck haben und die Verbindung funktioniert. Das ist nat&uuml;rlich nur eine tempor&auml;re L&ouml;sung, in K&uuml;rze sollte es wieder &uuml;ber beide IP-Adressen funktionieren! Ich werde dann hier ein entsprechendes Update ver&ouml;ffentlichen. 
</p>
<p>
Der Zugriff aus dem Arcor-Netz scheint &uuml;brigens fehlerfrei zu funktionieren!
</p>
<p>
<strong>Update 1:</strong> Da der Fehler weiterhin nicht behoben wurde habe ich kurzerhand die alte IP komplett aus dem DNS-Server entfernt und den Server entsprechend umkonfiguriert. Sobald sich die DNS-&Auml;nderung also bei den anderen Nameservern rumgesprochen hat sollte es keine Verbindungsprobleme mehr geben - vorl&auml;ufig.
</p>
