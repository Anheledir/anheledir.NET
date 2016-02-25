---
layout: post
section-type: post
title: IIS für Silverlight-, ClickOnce- und WPF-Anwendungen vorbereiten
category: Unknown
tags: []
---
<p>
Der Internet-Information-Service (IIS) von Microsoft verwendet f&uuml;r die Bereitstellung von Daten eine Whitelist mit erlaubten Dateiendungen. Steht eine Dateiendung nicht in dieser Liste, so erzeugt der IIS beim Abruf stattdessen eine Fehlermeldung. 
</p>
<p>
Neue Technologien bringen meistens auch neue Dateitypen und somit neue Dateiendungen mit, die dem IIS vor der Verwendung erst mitgeteilt werden m&uuml;ssen. Und weil ich selber immer wieder von neuem im Internet suchen muss welche das sind und welcher MIME-Typ jeweils gesetzt werden muss, fasse ich hier die wichtigsten zusammen f&uuml;r die oben genannten Anwendungen: 
</p>
<h4>Silverlight (inkl. Beta 2.0)</h4>
<table border="0" cellspacing="0" cellpadding="2" width="400">
	<tbody>
		<tr style="background-color: #ccc">
			<td width="200" valign="top"><strong>Dateiendung</strong></td>
			<td width="200" valign="top"><strong>MIME-Typ</strong></td>
		</tr>
		<tr>
			<td width="200" valign="top">.dll</td>
			<td width="200" valign="top">application/x-msdownload</td>
		</tr>
		<tr>
			<td width="200" valign="top">.xaml</td>
			<td width="200" valign="top">application/xaml+xml</td>
		</tr>
		<tr>
			<td width="200" valign="top">.xap</td>
			<td width="200" valign="top">application/x-silverlight-app</td>
		</tr>
	</tbody>
</table>
<p>
<strong>Wichtig</strong>: Damit die DLL-Datei von Silverlight heruntergeladen werden kann und nicht auf dem Server ausgef&uuml;hrt wird, muss die Ausf&uuml;hrungsberechtigung auf &quot;nur Skripts&quot; stehen und nicht auf &quot;Skripts und ausf&uuml;hrbare Dateien&quot;. 
</p>
<h4>ClickOnce</h4>
<table border="0" cellspacing="0" cellpadding="2" width="402">
	<tbody>
		<tr style="background-color: #ccc">
			<td width="200" valign="top"><strong>Dateiendung</strong></td>
			<td width="200" valign="top"><strong>MIME-Typ</strong></td>
		</tr>
		<tr>
			<td width="200" valign="top">.application</td>
			<td width="200" valign="top">application/x-ms-application</td>
		</tr>
		<tr>
			<td width="200" valign="top">.deploy</td>
			<td width="200" valign="top">application/octet-stream</td>
		</tr>
		<tr>
			<td width="200" valign="top">.manifest</td>
			<td width="200" valign="top">application/manifest</td>
		</tr>
		<tr>
			<td width="200" valign="top">.vsto</td>
			<td width="200" valign="top">application/x-ms-vsto</td>
		</tr>
	</tbody>
</table>
<h4>Windows Presentation Foundation (WPF)</h4>
<table border="0" cellspacing="0" cellpadding="2" width="402">
	<tbody>
		<tr style="background-color: #ccc">
			<td width="200" valign="top"><strong>Dateiendung</strong></td>
			<td width="200" valign="top"><strong>MIME-Typ</strong></td>
		</tr>
		<tr>
			<td width="200" valign="top">.xbap</td>
			<td width="200" valign="top">application/x-ms-xbap</td>
		</tr>
	</tbody>
</table>
<h4>sonstige Dateien</h4>
<table border="0" cellspacing="0" cellpadding="2" width="400">
	<tbody>
		<tr style="background-color: #ccc">
			<td width="144" valign="top"><strong>Anwendung</strong></td>
			<td width="52" valign="top"><strong>Endung</strong></td>
			<td width="200" valign="top"><strong>MIME-Typ</strong></td>
		</tr>
		<tr>
			<td width="144" valign="top">Rich-Site-Summary</td>
			<td width="52" valign="top">.rss</td>
			<td width="198" valign="top">application/rss+xml</td>
		</tr>
		<tr>
			<td width="144" valign="top">XML Paper Specification</td>
			<td width="52" valign="top">.xps</td>
			<td width="196" valign="top">application/vnd.ms-xpsdocument</td>
		</tr>
	</tbody>
</table>
