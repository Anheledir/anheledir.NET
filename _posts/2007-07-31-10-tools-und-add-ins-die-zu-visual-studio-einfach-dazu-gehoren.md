---
layout: post
title: 10 Tools und Add-Ins die zu Visual Studio einfach dazu gehören
date: 2007-07-31 11:47
author: Gordon Breuer
comments: true
categories: [Development, Werkzeugkiste]
---
<p>
Man sieht sie ja immer wieder, die &quot;<em>Top-10</em>&quot;-Listen f&uuml;r diverse Bereiche. Und auch im MSDN Magazine gab es im Dezember 2005 einen Artikel &quot;<a href="http://msdn.microsoft.com/msdnmag/issues/05/12/VisualStudioAddins/default.aspx" target="_blank">Visual Studio Add-Ins Every Develper Should Download Now</a>&quot;. Nun hat aber jeder seine eigenen Vorlieben und auch andere Pr&auml;ferenzen. Im folgenden deshalb eine Auswahl der Tools und Add-Ins, die ich w&auml;hrend meiner Arbeit am h&auml;ufigsten einsetze. 
</p>
<h5>VisualSVN </h5>
<p>
Da ich viel mit <a href="http://subversion.tigris.org" target="_blank">Subversion</a> arbeite um meine Quellcodes zu verwalten habe ich nat&uuml;rlich nach einer M&ouml;glichkeit gesucht, dass auch in Visual Studio m&ouml;glichst bequem zu integrieren. Dabei bin ich auf einige wenige Add-Ins gesto&szlig;en, die jedoch bei n&auml;herem Betrachten nicht wirklich gut funktionierten und mich bei meiner Arbeit eher behinderten. Schliesslich habe ich nach langem Suchen VisualSVN gefunden, dass inzwischen in der Version 1.2.2 vorliegt. Es ben&ouml;tigt zus&auml;tzlich noch <a href="http://tortoisesvn.tigris.org/" target="_blank">TortoiseSVN</a>, ein kostenloses Tool zur Verwaltung der Subversion-Repositorys welches sich in den Windows-Explorer integriert. VisualSVN selbst macht seine Arbeit danach still im Hintergrund: Neue Dateien werden automatisch zum Repository hinzugef&uuml;gt, wird eine Datei verschoben bleibt die Historie in Subversion erhalten und auch das Umbenennen klappt unproblematisch ohne das ich mich mit zus&auml;tzlichen Schritten abgeben muss. Die Interaktion mit Subversion l&auml;uft vollst&auml;ndig im Hintergrund ab so dass man w&auml;hrend seiner Arbeit nicht unterbrochen wird. Erst am Schluss geht man auf ein Men&uuml; und w&auml;hlt den Punkt &quot;Commit...&quot; um seine &Auml;nderungen hochzuladen. Fast alle anderen aus TortoiseSVN bekannten Befehle stehen nat&uuml;rlich ebenfalls &uuml;ber das Men&uuml; zur Verf&uuml;gung (Update, Show Changes, Request Lock, ...). 
</p>
<p>
<strong>Preis:</strong> Eine Lizenz f&uuml;r Privatnutzer kostet $49, aktive Open-Source-Projekte k&ouml;nnen jedoch auch eine <strong>kostenlose Lizenz</strong> beantragen. Im &uuml;brigen auch das einzige kostenpflichtige Add-In, dass ich hier empfehle - aber es ist jeden Cent wert wenn man viel mit Subversion arbeitet! 
</p>
<p>
<strong>Download:</strong> <a href="http://www.visualsvn.com/" target="_blank">VisualSVN 1.2.2</a> 
</p>
<h5>Versioning Controlled Build </h5>
<p>
Beim erstellen eines Projektes legt Visual Studio automatisch eine Datei <em>AssemblyInfo</em> an, in der unter anderem auch verschiedene Versionsnummern gespeichert werden. Jetzt kann man entweder selbst daran denken diese bei entsprechenden Programm&auml;nderungen zu erh&ouml;hen oder man ersetzt die letzten beiden Stellen f&uuml;r die Build- und die Revision-Number durch einen Stern (*). Visual Studio setzt die beiden Werte dann in Abh&auml;ngigkeit des aktuellen Datums und der Uhrzeit zum Zeitpunkt des Buildvorganges. Dabei entstehen dann allerdings diese meist vierstelligen Versionsnummern, die sich eh niemand merken kann. Und sp&auml;testens wenn man in einer Solution mehrere Projekte hat, beispielsweise zus&auml;tzliche DLL-Dateien, hat man zig Versionsnummern um die man sich k&uuml;mmern muss und die man deshalb meistens eher vernachl&auml;ssigt. 
</p>
<p>
Dabei w&auml;re es ziemlich praktisch, dass bei einem Build automatisch bsp. die Build-Version um eins erh&ouml;ht wird und alle Projekte innerhalb einer Solution mit angepasst und synchronisiert werden. Das und noch einiges mehr macht das Add-In Versioning Controlled Build (VCB) von Julijan Sribar. Alle Funktionen hier zu beschreiben w&uuml;rde lange dauern und ist auch v&ouml;llig unn&ouml;tig: Auf der Projektseite auf Code Project ist eine sehr ausf&uuml;hrliche und bebilderte Dokumentation zu finden. 
</p>
<p>
<strong>Noch ein Installationshinweis unter Vista:</strong> Ich bin bei der Installation des Add-Ins unter Windows Vista beinahe verr&uuml;ckt geworden. Selbst wenn man die Anwendung als Administrator gestartet hat ist der Installer abgest&uuml;rzt. Um es dennoch ans Laufen zu bringen einfach in der Systemsteuerung vor&uuml;bergehend die UAC abschalten, den Hinweis auf den notwendigen Neustart ignorieren, im Startmen&uuml; die Kommandozeile mit rechts anklicken und als Administrator starten, dort dann den Installer manuell aufrufen (&quot;<em>msiexec /i BuildAutoIncrementSetup2005.msi</em>&quot;) und am Ende die UAC wieder einschalten. Danach hat auch die Installation unter Vista endlich fehlerfrei funktioniert. :-) 
</p>
<p>
<strong>Download:</strong> <a href="http://www.codeproject.com/dotnet/versioningcontrolledbuild.asp" target="_blank">Versioning Controlled Build</a> 
</p>
<p>
&nbsp;
</p>
<h5>CopySourceAsHtml (CSAH) </h5>
<p>
Zu dem Add-In ist wenig zu sagen - es kopiert den markierten Code in die Zwischenablage und formatiert ihn dabei gleichzeit mit HTML-Tags. Dabei werden die Farb- und Texteinstellungen &uuml;bernommen, die auch in Visual Studio eingestellt sind. Ein n&uuml;tzliches Tool f&uuml;r alle, die auch mal Sourcecode im Internet ver&ouml;ffentlichen wollen. 
</p>
<p>
<strong>Beispiel:</strong> 
</p>
<blockquote>
	<div style="font-size: 10pt; background: white; color: black; font-family: consolas">
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 451</span>&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: gray">///</span><span style="color: green"> </span><span style="color: gray">&lt;summary&gt;</span> 
	</p>
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 452</span>&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: gray">///</span><span style="color: green"> Calculates the calendarweek by a commited date</span> 
	</p>
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 453</span>&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: gray">///</span><span style="color: green"> </span><span style="color: gray">&lt;/summary&gt;</span> 
	</p>
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 454</span>&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: gray">///</span><span style="color: green"> </span><span style="color: gray">&lt;param name=&quot;dat&quot;&gt;&lt;/param&gt;</span> 
	</p>
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 455</span>&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: gray">///</span><span style="color: green"> </span><span style="color: gray">&lt;returns&gt;&lt;/returns&gt;</span> 
	</p>
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 456</span>&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: blue">public</span> <span style="color: blue">virtual</span> <span style="color: blue">int</span> date2kw( <span style="color: #2b91af">DateTime</span> dat ) { 
	</p>
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 457</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: #2b91af">CultureInfo</span> currentCulture = <span style="color: #2b91af">CultureInfo</span>.CurrentCulture; 
	</p>
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 458</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: #2b91af">Calendar</span> cal = currentCulture.Calendar; 
	</p>
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 459</span>&nbsp; 
	</p>
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 460</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: blue">int</span> calWeek = cal.GetWeekOfYear( dat, currentCulture.DateTimeFormat.CalendarWeekRule, currentCulture.DateTimeFormat.FirstDayOfWeek ); 
	</p>
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 461</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: blue">if</span> ( calWeek &gt; 52 ) { 
	</p>
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 462</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dat = dat.AddDays( 7 ); 
	</p>
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 463</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: blue">int</span> test = cal.GetWeekOfYear( dat, currentCulture.DateTimeFormat.CalendarWeekRule, currentCulture.DateTimeFormat.FirstDayOfWeek ); 
	</p>
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 464</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: blue">if</span> ( test == 2 ) 
	</p>
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 465</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; calWeek = 1; 
	</p>
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 466</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } 
	</p>
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 467</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color: blue">return</span> calWeek; 
	</p>
	<p style="margin: 0px">
	<span style="color: #2b91af">&nbsp; 468</span>&nbsp;&nbsp;&nbsp;&nbsp; } 
	</p>
	</div>
	<p>
	&nbsp;
	</p>
</blockquote>
<p>
<strong>Download:</strong> <a href="http://www.jtleigh.com/people/colin/software/CopySourceAsHtml/" target="_blank">CopySourceAsHtml</a> 
</p>
<p>
&nbsp;
</p>
<h5>Smart Paster </h5>
<p>
Den umgekehrten Weg wie CSAH geht das Add-In Smart Paster. Mit ihm kann man den Inhalt der Zwischenablage in Visual Studio kopieren und dabei direkt umwandeln in einen Kommentar, einen String, einen StringBuilder, eine Region oder einen XML-Kommentar. Die notwendigen Encodierungen werden dabei automatisch vorgenommen. So werden auch beispielsweise sehr lange SQL-Querys zum Kinderspiel. Die Konfiguration wird &uuml;ber einen kleinen Dialog vorgenommen. 
</p>
<p>
<strong>Download:</strong> <a href="http://www.stbbs.net/~junichi/archive/smart-paster-2005-xmldoccomment-enhanced/SmartPaster2005-XMLDocComment-enhanced.vsi" target="_blank">Smart Paster 1.1 (with &quot;XML Document Comment&quot; function)</a> <br />
<strong>Homepage:</strong> <a href="http://weblogs.asp.net/alex_papadimoulis/archive/2004/05/25/Smart-Paster-1.1-Add-In---StringBuilder-and-Better-C_2300_-Handling.aspx" target="_blank">Originalversion</a> 
</p>
<p>
&nbsp;
</p>
<h5>Resource Refactoring Tool </h5>
<p>
Bleiben wir bei der Verarbeitung von Zeichenketten: Das Resource Refactoring Tool erm&ouml;glicht es &uuml;ber einen neuen Eintrag im Kontextmen&uuml; hardcoded Strings in Resource-Dateien auszulagern und den urspr&uuml;nglichen String durch einen entsprechenden Verweis zu ersetzen. Die Vorteile liegen auf der Hand: Gleiche Texte m&uuml;ssen nicht mehrmals eingegeben werden sondern werden zentral in der Resourcen-Datei verwaltet. Das erm&ouml;glicht auch ein schnelles und einfaches &Uuml;bersetzen in weitere Sprachen oder das &Auml;ndern von Formulierungen in der gesamten Anwendung an nur einer Stelle. 
</p>
<p>
<strong>Download:</strong> <a href="http://www.codeplex.com/ResourceRefactoring" target="_blank">Resource Refactoring Tool</a> 
</p>
<p>
&nbsp;
</p>
<h5>Koders IDE Plugin </h5>
<p>
Zugegeben, das Add-In wird wohl nur der nutzen, der auch h&auml;ufig die Suche von Koders verwendet. Weiter haben die meisten Code- und Snippet-Sammlungen inzwischen ein eigenes Add-In, dass sich auf &auml;hnliche Weise in Visual Studio einbindet. Was mir an diesem gut gef&auml;llt ist die Suche nach Treffern schon w&auml;hrend der Eingabe ohne das ich die Suche explizit starten muss. So gen&uuml;gt es beispielsweise den Header f&uuml;r eine md5-Funktion einzugeben und es wird &uuml;ber dem Cursor ein kleiner Hinweis angezeigt mit der Zahl der gefundenen Ergebnisse. Wenige Klicks sp&auml;ter hat man den Code auch schon in sein eigenes Projekt integriert. 
</p>
<p>
<strong>Download:</strong> <a href="http://www.koders.com/info.aspx?c=tools#IDEs" target="_blank">Koders IDE Plugin</a> 
</p>
<p>
&nbsp;
</p>
<h5>GhostDoc </h5>
<p>
Das Add-In gibt es inzwischen in der Version 2.1.1, die auch mit der Beta von Orcas funktionieren soll. Was das Programm macht ist schnell erkl&auml;rt: Es nimmt dem Entwickler einen Teil der m&uuml;hsamen Arbeit ab seine Methoden, Klassen, ... mit XML-Kommentaren zu versehen. Die Zusammenfassung und ggf. die Benennung der Parameter werden dabei aufgrund einer bereits existierenden Dokumentation (bsp. Basisklasse, ..) und durch Analyse der Namen und Typen vorgenommen. So wird aus einer Methode &quot;UpdateProduct&quot; die Beschreibung &quot;Updates the product&quot; erstellt oder aus dem Parameter &quot;string productName&quot; wird &quot;Name of the product&quot;. Nat&uuml;rlich sind nicht alle Texte das Gelbe vom Ei und es ist in vielen F&auml;llen noch etwas Handarbeit notwendig um die Formulierungen abzuschleifen. Dennoch nimmt es einem schon mal einen Gro&szlig;teil der Arbeit ab und liefert dem Entwickler ein Grundger&uuml;st f&uuml;r die Dokumentation. 
</p>
<p>
<strong>Download:</strong> <a href="http://www.roland-weigelt.de/ghostdoc/" target="_blank">GhostDoc 2.1.1</a> 
</p>
<p>
&nbsp;
</p>
<h5>Sandcastle </h5>
<p>
Die meisten verwenden wohl zur Erstellung ihrer Dokumentationen aufgrund der XML-Kommentare die SOftware NDoc. Doch leider unterst&uuml;tzt diese das .NET-Framework 2.0 nicht offiziell. Nachdem Microsoft dann Sandcastle vorgestellt hat f&uuml;r die Erstellung der Dokumentation wollte der Autor von NDoc das Programm auch nicht mehr weiterentwickeln da Microsoft nun selber ein &auml;hnliches Programm kostenlos anbot. Aktuell gibt es Sandcastle als CTP von Juni 2007 zum Downloaden. Einige Enthusiasten werden noch Features vermissen, die sie aus NDoc gewohnt waren, aber da es sich bisher nur um eine CTP handelt darf man noch hoffen, dass Microsoft hier nachbessert. 
</p>
<p>
<strong>Download:</strong> <a href="http://www.microsoft.com/downloads/details.aspx?familyid=e82ea71d-da89-42ee-a715-696e3a4873b2&amp;displaylang=en" target="_blank">Sandcastle - June 2007 CTP</a> 
</p>
<p>
&nbsp;
</p>
<h5>Microsoft HTML Help Workshop </h5>
<p>
Ein Programm um eigene Hilfedateien zu erstellen. Ich verwende es aber meistens in Kombination mit Sancastle und DocProject um die erstellte Hilfe im HTML-Format in eine chm-Datei zu konvertieren. Das erm&ouml;glicht neben einer Onlineversion der html-Dateien auch eine Weitergabe beispielsweise mit einem Installationsprogramm oder per E-Mail. 
</p>
<p>
<strong>Download:</strong> <a href="http://msdn2.microsoft.com/en-us/library/ms669985.aspx" target="_blank">HTML Help Workshop</a> 
</p>
<p>
&nbsp;
</p>
<h5>DocProject for Sandcastle </h5>
<p>
Wie schon die drei Add-Ins zuvor reiht sich auch dieses in die Erstellung einer Projektdokumentation ein. DocProject ist dabei &quot;nur&quot; ein neuer Projekttyp, der die Erstellung der Dokumentation mittels Sandcastle und dem HTML Help Workshop in einer grafischen Oberfl&auml;che verbindet und die Erstellung beim Buildvorgang automatisch mit startet. 
</p>
<p>
Nach der Installation f&uuml;gt man in seine aktuelle Solution ein neues Projekt vom Typ DocProject ein. Es startet automatisch ein Assistent, der einige Informationen zur Dokumentation abfragt wie beispielsweise das gew&uuml;nschte Layout. Hat man eigene XML-Kommentare in den Quellcode eingef&uuml;gt (bsp. mittels GhostDoc), so sollte man nicht vergessen in den Projekteigenschaften die Erstellung der XML-Datei zu aktivieren. Anschliessend startet man den Buildvorgang f&uuml;r die gesamte Solution und nach Kompilierung aller anderen Projekte wird dann automatisch die Dokumentation mittels Sandcastle erstellt. 
</p>
<p>
<strong>Download:</strong> <a href="http://www.codeplex.com/DocProject" target="_blank">DocProject for Sandcastle</a> 
</p>
<hr />
<p>
&nbsp;
</p>
<p>
So, das waren meine zehn Favoriten die mir das Leben mit Visual Studio doch wesentlich erleichtern. Sicher gibt es noch andere nette Tools und Add-Ins, die ich bisher noch nicht probiert, gebraucht oder einfach auch noch nicht gefunden habe. Aber f&uuml;r einen etwas anspruchsvolleren 08/15-Programmierer ist das sicher auch so schon eine ganz brauchbare Zusammenstellung. Und wenn nur einer in der Liste ein Add-In gefunden hat, dass ihm die Arbeit zuk&uuml;nftig erleichtert, hat sich die ganze Tipparbeit schon gelohnt. ;-) 
</p>
<p>
-- Gordon 
</p>
<img src="/aggbug.ashx?id=895f2df5-5f1d-4fbf-b8d1-f3cd8eb35536" alt="" width="0" height="0" />
