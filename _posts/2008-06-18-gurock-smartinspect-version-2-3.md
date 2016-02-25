---
layout: post
title: Gurock SmartInspect Version 2.3
date: 2008-06-18 20:19
author: Gordon Breuer
comments: true
categories: [Praxistest, Werkzeugkiste]
---
<p><a href="http://www.gurock.com/products/smartinspect/t/2/" target="_blank"><img style="margin: 0px 5px 0px 0px; border-width: 0px" title="SmartInspectLogo" src="http://anheledirwp.blob.core.windows.net/wordpress/2008/06/SmartInspectLogo_3.png" border="0" alt="SmartInspectLogo" width="240" height="75" align="left" /></a> Jedes Projekt, dass ein wenig gr&ouml;&szlig;er wird, ben&ouml;tigt sp&auml;testens wenn die ersten Fehler auftreten eine M&ouml;glichkeit zum Debuggen. Bei einfacheren Programmen gen&uuml;gen ein paar Write-Befehle oder auch die Trace- und Debug-M&ouml;glichkeiten des <span style="font-family: Courier New;">System.Diagnostics</span> Namespaces im .NET Framework. Diese Art des Loggens wird jedoch mit Zunahme der Informationsmenge immer schwerer erfassbar; und bei Multithreading-Anwendungen ist es schlie&szlig;lich nahezu unm&ouml;glich die Aktionen eines bestimmten Threads jederzeit im Auge zu behalten. Will man in das fertige Produkt ebenfalls eine Logging-M&ouml;glichkeit einbauen, um bei <abbr title="eventuellen">evtl</abbr>. Fehlern das Verhalten des Anwenders das zu selbigen f&uuml;hrte nachzuvollziehen, ist man mit den einfachen Methoden schnell an seine Grenzen gesto&szlig;en. Die Firma Gurock Software <acronym title="Gesellschaft mit beschr&auml;nkter Haftung">GmbH </acronym>mit Sitz in Paderborn hat sich mit ihrem Produkt <strong>SmartInspect</strong> diesem Problem angenommen.</p>
<table style="width: 523px;" border="1" cellspacing="0" cellpadding="2">
<tbody>
<tr>
<td style="background-color: yellow" width="521" valign="top">F&uuml;r diesen Test kam die Trial-Version von SmartInspect Professional v2.3.4.7144 zum Einsatz. Als <acronym title="Integrated Development Environment">IDE </acronym>wurde die englische Version von Microsoft Visual Studio 2008 unter Vista SP1 und Windows XP SP3 eingesetzt. Die Beispiele sind allesamt in C# geschrieben und basieren auf der Version 3.5 des .NET-Frameworks.</td>
</tr>
</tbody>
</table>
<p><a href="http://dotnet-forum.de/" target="_blank"><img title="dotnet-forum" src="http://anheledirwp.blob.core.windows.net/wordpress/2008/06/dotnet-forum_3.gif" border="0" alt="dotnet-forum" width="240" height="47" /></a></p>
<p>Den folgenden Artikel habe ich auch in der Knowledge Base auf <a href="http://dotnet-forum.de/KnowledgeBase/articles/2008/06/18/294-gurock-smartinspect-version-2-3.aspx" target="_blank">www.dotnet-forum.de</a> im Rahmen eines Erfahrungsberichtes ver&ouml;ffentlicht. Hier findet der geneigte Leser auch noch zahlreiche Artikel von anderen Entwicklern und ein gut besuchtes Support-Forum f&uuml;r alle Aspekte der Programmierung mit dem .NET-Framework. Ein Besuch lohnt sich hier also auf jeden Fall!</p>
<p>[more]</p>
<hr />
<h2>Download und Installation</h2>
<p>Auf der Seite des Herstellers findet man leicht den Link zur Testversion von SmartInspect. Diese hat keine Einschr&auml;nkungen im Funktionsumfang und funktioniert 30 Tage. Sollte ein l&auml;ngerer Zeitraum f&uuml;r einen ausf&uuml;hrlichen Test notwendig sein kann man sich auch mit dem Support von Gurock in Verbindung setzen um eine Lizenz zu erhalten, die den Testzeitraum verl&auml;ngert. Die Lizenz f&uuml;r einen Benutzer kostet 229 Euro (<em>Upgrade von Version 1.x: 119 Euro</em>) und darf auf bis zu drei <acronym title="Personal Computer">PCs </acronym>installiert werden, <abbr title="beispielsweise">bsp</abbr>. Zuhause, im B&uuml;ro und auf einem Notebook. Die Preise f&uuml;r weitere Lizenzen sind entsprechend gestaffelt. Der Download ist nur 7.25 <acronym title="Megabyte">MB </acronym>schlank und somit schnell auf dem eigenen Rechner. Die Installation verl&auml;uft ebenfalls schnell und unproblematisch und ben&ouml;tigt, wie mir die UAC von Vista mitteilt, administrative Rechte. Das sollte auf einem Entwicklungsrechner aber in der Regel kein Problem sein.</p>
<p>Eine gro&szlig;e Hilfe bei der Arbeit sind auch die Snippets, die Gurock Software mitliefert. Man findet sie f&uuml;r Visual Studio 2008 und C# im Unterverzeichnis <strong>/templates/vs/2008/csharp/</strong> des Installationsordners. Es werden aber auch Snippets f&uuml;r die 2005er Version und VB.NET mitgeliefert sowie f&uuml;r CodeGear, Borland Developer Studio, Eclipse, und den Borland JBuilder. Ich werde in diesem Artikel mehrfach auf diese Snippets zur&uuml;ckkommen und sie zus&auml;tzlich <span style="color: #ff8000;">orange </span>in Klammern erw&auml;hnen.</p>
<p>Eine Dokumentation liefert der Hersteller zum einen in Form einer <acronym title="Portable Document Format">PDF</acronym>-Datei mit, die eine gute Einf&uuml;hrung bietet einschlie&szlig;lich der auch online verf&uuml;gbaren Tutorials f&uuml;r die unterst&uuml;tzten Programmiersprachen und einen &Uuml;berblick &uuml;ber die wichtigsten Funktionen der SmartInspect Konsole. Zus&auml;tzlich wird noch eine ausf&uuml;hrliche Dokumentation der SmartInspect-Bibliothek im <acronym title="Compiled/Compressed HTML Help">CHM</acronym>-Format mitgeliefert. Beides ist nur in englischer Sprache verf&uuml;gbar.</p>
<h2>&bdquo;Debug World&ldquo;</h2>
<p><a rel="lightbox[SmartInspect]" href="http://static.gordon-breuer.de/img/SmartInspect_A40/image11.png"><img style="margin: 0px 5px 5px 0px; border: 0px" title="image" src="http://anheledirwp.blob.core.windows.net/wordpress/2008/06/image11_thumb.png" border="0" alt="image" width="156" height="130" align="left" /></a>Wer wie ich kein Freund von Bedienungsanleitungen ist und lieber direkt versucht loszulegen wird bei SmartInspect auf keine gr&ouml;&szlig;eren Schwierigkeiten sto&szlig;en. Es empfiehlt sich aber&nbsp; zumindest das Tutorial auf der Website des Anbieters einmal zu &uuml;berfliegen. F&uuml;r eine erste kleine Beispielanwendung erstellen wir ein Windows Forms-Projekt in Visual Studio und f&uuml;gen die SmartInspect-Library als Referenz hinzu (<em>Bild 1</em>). Im Unterordner <strong>/lib/</strong> des Installationsverzeichnis finden sich die Bibliotheken f&uuml;r die Programmiersprachen <strong>Delphi</strong> (<em>Version 6, 7, 2005, 2006, 2007</em>), <strong>.NET</strong> (<em>v1.x, v2.x, v3.x</em>) und <strong>Java</strong>. Die Bibliothek hat sich f&uuml;r das .NET 3.0/3.5 Framework nicht ver&auml;ndert und man findet lediglich eine <em>Readme.txt</em> im entsprechenden Verzeichnis welche auf die v2.x Version verweist. Anschlie&szlig;end fehlt nur noch die entsprechende Anweisung um die Bibliotheken von SmartInspect auch einzubinden:</p>
<p><span style="font-family: Courier New;"><span style="color: #0000ff;">using</span> Gurock.SmartInspect;</span></p>
<p>Um unserer Testanwendung nun zu Debuggen &ouml;ffnen wir die Datei <strong>Program.cs</strong> und aktivieren dies dort in der Methode <strong>Main()</strong> mit folgender Anweisung (<span style="color: #ff8000;">&bdquo;sien&ldquo;</span>):</p>
<p><span style="font-family: Courier New;"><span style="color: #408080;">SiAuto</span>.Si.Enabled = <span style="color: #0000ff;">true</span>;</span></p>
<p>Das war im Prinzip alles, um die Logging-Funktionalit&auml;t f&uuml;r eine Anwendung zu aktivieren. Die Eigenschaft <strong>Enabled</strong> l&auml;sst sich dabei jederzeit innerhalb des Programms aktivieren oder deaktivieren, beispielsweise auch &uuml;ber einen Men&uuml;punkt. <a rel="lightbox[SmartInspect]" href="http://static.gordon-breuer.de/img/SmartInspect_A40/image33.png"><img style="margin: 5px 0px 5px 5px; border: 0px" title="image" src="http://anheledirwp.blob.core.windows.net/wordpress/2008/06/image33_thumb.png" border="0" alt="image" width="186" height="101" align="right" /></a>Bisher sendet unsere kleine Anwendung allerdings noch keinerlei Informationen an unser Logfile. Zeit das zu &auml;ndern!</p>
<p>Wir erstellen einen einfachen Button auf unserer Form und klicken diesen doppelt an. Im automatisch erstellten Click-Event schreiben wir nun folgende Anweisung (<span style="color: #ff8000;">&bdquo;simsg&ldquo;</span>):</p>
<p><span style="font-family: Courier New;"><span style="color: #408080;">SiAuto</span>.Main.LogMessage(<span style="color: #804040;"> </span><span style="color: #800000;">"Hello World!"</span> );</span></p>
<p>Um unsere Anwendung zu testen starten wir zun&auml;chst noch die SmartInspect Konsole und anschlie&szlig;end unser Testprojekt. Wenn wir dann auf den Button dr&uuml;cken sehen wir unsere Nachricht in der Konsole von SmartInspect (<em>Bild 2</em>).</p>
<p>Standartm&auml;&szlig;ig verwendet SmartInspect <acronym title="Transmission Control Protocol">TCP </acronym>um die Logfile der Anwendung direkt an den <acronym title="Transmission Control Protocol">TCP</acronym>-Server der SmartInspect Konsole zu senden. Dies ist f&uuml;r das Debuggen auf dem Entwicklungsrechner oder im internen Firmennetz durchaus praktikabel. Soll die Anwendung hingegen eine Datei auf der Festplatte mit den Daten ablegen ist lediglich eine weitere Zeile Code vor dem Setzen der Eigenschaft enabled&nbsp; auf true notwendig (<span style="color: #ff8000;">&bdquo;siconn&ldquo;</span>):</p>
<p><span style="font-family: Courier New;"><span style="color: #408080;">SiAuto</span>.Si.Connections = <span style="color: #800000;">"file(filename="c:myLogfile.sil")"</span>;</span></p>
<p>Ist die Datei bereits vorhanden wird sie standartm&auml;&szlig;ig &uuml;berschrieben und ansonsten neu erstellt. Es ist auch m&ouml;glich mehrere Verbindungen gleichzeitig zu nutzen:</p>
<p><span style="font-family: Courier New;"><span style="color: #408080;">SiAuto</span>.Si.Connections = <span style="color: #800000;">"file(filename="c:myLogfile.sil"), tcp(host="localhost")"</span>;</span></p>
<p>Was ich an dieser Stelle ein wenig vermisst habe ist ein reiner Logging-Server, der unabh&auml;ngig der SmartInspect Konsole l&auml;uft und der zentral von verschiedenen Anwendungen die Logfiles entgegen nehmen kann. In den Ank&uuml;ndigungen auf der Website des Herstellers habe ich aber gelesen, dass ein solches Zusatzprogramm bereits in Arbeit ist. Vielleicht wird es also mit Ver&ouml;ffentlichung der Version 3 von SmartInspect ein solches Tool auch geben.</p>
<h2>Logging-Level</h2>
<p>Im ersten Beispiel war noch kein gro&szlig;er Vorteil gegen&uuml;ber dem Namespace <span style="font-family: Courier New;">System.Diagnostics</span> zu erkennen. Ein &auml;hnliches Resultat h&auml;tte man hier auch wie folgt erzeugen k&ouml;nnen:</p>
<p><span style="font-family: Courier New;"><span style="color: #408080;">Trace</span>.WriteLine( <span style="color: #800000;">"Hello World!"</span> );</span></p>
<p>SmartInspect bietet jedoch noch viele weitere Funktionen, die eine weitaus detailliertere Protokollierung erm&ouml;glichen und es dem Entwickler erleichtern den Ablauf des Programms zu &uuml;berwachen. Hier nehmen einem die vorgefertigten Snippets einige Schreibarbeit ab und zeigen gleichzeitig wie man diverse Methoden sinnvoll integriert.</p>
<table style="margin: 5px 5px 5px 0px; width: 100px; float: left; border: #000 1px solid;" border="0" cellspacing="0" cellpadding="2">
<tbody>
<tr>
<td width="98" valign="top"><span style="font-family: Courier New;">debug</span></td>
</tr>
<tr>
<td width="98" valign="top"><span style="font-family: Courier New;">verbose</span></td>
</tr>
<tr>
<td width="98" valign="top"><span style="font-family: Courier New;">message</span></td>
</tr>
<tr>
<td width="98" valign="top"><span style="font-family: Courier New;">warning</span></td>
</tr>
<tr>
<td width="98" valign="top"><span style="font-family: Courier New;">error</span></td>
</tr>
<tr>
<td width="98" valign="top"><span style="font-family: Courier New;">fatal</span></td>
</tr>
</tbody>
</table>
<p>Andererseits m&ouml;chte man w&auml;hrend dem Debuggen vielleicht weitaus mehr Informationen protokollieren und auswerten als in der fertigen Anwendung. Oder f&uuml;r eine reine Live-Zustands&uuml;berwachung ben&ouml;tigt man ausschliesslich Fehlermeldungen und nicht die vollst&auml;ndige, m&ouml;gliche Informationsflut. Hier helfen einem verschiedene Level, die man f&uuml;r die meisten Logging-Befehle festlegen kann. Im einzelnen sind dies sechs bzw. sieben verschiedene Level (<em>siehe Kasten links</em>). Der siebste Level <span style="font-family: Courier New;">control</span> wird nur von der Klasse <span style="font-family: Courier New;">ControlCommand</span> verwendet und sollte deshalb nicht vom Anwender manuell vergeben werden.</p>
<p>Zum einen kann man den Standart-Level festlegen mit der folgenden Anweisung:</p>
<p><span style="font-family: Courier New;"><span style="color: #408080;">SiAuto</span>.Si.DefaultLevel = <span style="color: #408080;">Level</span>.Verbose;</span></p>
<p>Alle Logging-Anweisungen ohne eine explizite Levelangabe erhalten den hier zugeordneten Wert. Wenn man einzelne Anweisungen davon ausnehmen m&ouml;chte, muss man also entweder einen bestimmten Befehl verwenden oder den gew&uuml;nschten Level als weiteren Parameter &uuml;bergeben. Letzteres geht bei fast allen Befehlen au&szlig;er dem Protokollieren von einfachen Nachrichten. Bei diesen gibt es jeweils eigene Befehle wie <span style="font-family: Courier New;">LogError()</span> oder <span style="font-family: Courier New;">LogDebug()</span>. Welches von beiden einfacher zu lesen ist, ein extra Befehl oder die &Uuml;bergabe des Levels als Parameter, ist vielleicht Geschmackssache. Ich pers&ouml;nlich bevorzuge jedoch die Parameter&uuml;bergabe und finde diese Inkonsistenz etwas m&uuml;hsam.</p>
<p><a href="http://static.gordon-breuer.de/img/SmartInspect_A40/Edit-view_2.png"></a></p>
<p>Unabh&auml;ngig davon welchen Logging-Level eine einzelne Anweisung hat l&auml;sst sich festlegen, welche Meldungen &uuml;berhaupt den Weg bis in das Logfile schaffen und welche bei der Ausf&uuml;hrung nicht weiter beachtet werden:</p>
<p><span style="font-family: Courier New;"><span style="color: #408080;"><a rel="lightbox[SmartInspect]" href="http://static.gordon-breuer.de/img/SmartInspect_A40/Editview.png"><img style="margin: 5px 0px 5px 5px; border: 0px" title="Edit-view" src="http://anheledirwp.blob.core.windows.net/wordpress/2008/06/Editview_thumb.png" border="0" alt="Edit-view" width="173" height="98" align="right" /></a>SiAuto</span>.Si.Level = <span style="color: #408080;">Level</span>.Warning;</span></p>
<p>Stelle ich diese Anweisung an den Anfang meiner zu testenden Applikation werden alle Logging-Anweisungen verworfen, die einen kleineren Level besitzen, hier also <span style="font-family: Courier New;">debug</span>, <span style="font-family: Courier New;">verbose</span> und <span style="font-family: Courier New;">message</span>. Eine zweite Methode des Filterns besteht darin alle Nachrichten in das Logfile schreiben zu lassen, was dadurch nat&uuml;rlich unter Umst&auml;nden bedeutend gr&ouml;&szlig;er wird, und das Filtern der SmartInspect Konsole zu &uuml;berlassen. Hier kann man in den so genannten Views auch Filter etc. anwenden, die nur Nachrichten eines bestimmten Typs oder Levels durchlassen (<em>Bild 3</em>). Das ist f&uuml;r ausgelieferte Anwendungen aber sicher nicht sehr praktikabel, da die Gr&ouml;&szlig;e einer Logfile so schon mal schnell auf ein Vielfaches ansteigen kann.</p>
<h2>Thread-Protokollierung</h2>
<p>Einer der gro&szlig;en Vorteile von SmartInspect ist die M&ouml;glichkeit auch Anwendungen mit mehreren Threads sauber mitprotokollieren zu k&ouml;nnen. Damit das funktioniert muss man in den aufgerufenen Thread entsprechende Funktionen von SmartInspect einbinden (<span style="color: #ff8000;">&bdquo;sitr&ldquo;</span>):</p>
<p><span style="font-family: Courier New;"><span style="color: #408080;">SiAuto</span>.Main.EnterThread( <span style="color: #800000;">"Threadname"</span> ); <br /><span style="color: #0000ff;">try</span> { <br />...</span><span style="font-family: Courier New;"> <br />} <br /><span style="color: #0000ff;">finally</span> { <br />&nbsp; <span style="color: #408080;">SiAuto</span>.Main.LeaveThread( <span style="color: #800000;">"Threadname"</span> ); <br />}</span></p>
<p>Das Snippet bindet automatisch das try/finally-Konstrukt mit ein, damit der Aufruf der <span style="font-family: Courier New;">LeaveThread()</span> Methode in jedem Fall gesichert ist. Als Name l&auml;sst sich jeder beliebige Name eingeben, es bietet sich hier jedoch der Methodenname des Threads an. Alternativ kann man auch noch einen Logging-Level festlegen der f&uuml;r den Thread-Aufruf entsprechend gespeichert wird:</p>
<p><span style="font-family: Courier New;"><span style="color: #408080;">SiAuto</span>.Main.EnterThread( <span style="color: #408080;">Level</span>.Debug, <span style="color: #800000;">"Threadname"</span> );</span></p>
<p><a rel="lightbox[SmartInspect]" href="http://static.gordon-breuer.de/img/SmartInspect_A40/threads_2.png"><img style="margin: 5px 5px 5px 0px; border: 0px" title="threads" src="http://anheledirwp.blob.core.windows.net/wordpress/2008/06/threads_thumb.png" border="0" alt="threads" width="242" height="108" align="left" /></a> Wenn man dieses Konstrukt bei jedem Threadaufruf sauber verwendet kann man in der SmartInspect Konsole mehrere Eigenschaften dieser Threads mitverfolgen wie beispielsweise die <acronym title="Identifikationsbezeichnung">ID</acronym>, Startzeit und die Laufzeit (<em>Bild 4</em>). Zus&auml;tzlich wird auch mitverfolgt, in welchem Thread sich eine Logging-Funktion bei ihrem Aufruf befunden hat. So kann man in der SmartInspect Konsole sich beispielsweise nur die Logmessages eines bestimmten Threads anzeigen lassen. Auch bietet das Programm die M&ouml;glichkeit an anhand bestimmter Regeln automatisch neue Views zu erstellen. So ist es beispielsweise m&ouml;glich, dass f&uuml;r jeden neu gestarteten Thread die SmartInspect Konsole automatisch eine neue View anlegt, so dass man auf einen Blick nur die von diesem Thread benutzten Methoden sehen kann.</p>
<p>Analog zu den Methoden <span style="font-family: Courier New;">EnterThread()</span> und <span style="font-family: Courier New;">LeaveThread()</span> gibt es noch weitere die analog eingesetzt werden k&ouml;nnen f&uuml;r eigene Methoden (<span style="font-family: Courier New;">EnterMethod()</span> / <span style="font-family: Courier New;">LeaveMethod()</span>, <span style="color: #ff8000;">&bdquo;sime&ldquo;</span>) und Prozesse (<span style="font-family: Courier New;">EnterProcess()</span> / <span style="font-family: Courier New;">LeaveProcess()</span>, <span style="color: #ff8000;">&bdquo;sipr&ldquo;</span>). Um den Hauptprozess eigens zu benennen kann man also die Datei <em>program.cs</em> wie folgt erg&auml;nzen:</p>
<p><span style="font-family: Courier New;"><span style="color: #408080;">SiAuto</span>.Main.EnterProcess( <span style="color: #800000;">"My Program"</span> ); <br /><span style="color: #0000ff;">try</span> { <br />&nbsp; <span style="color: #408080;">Application</span>.Run( <span style="color: #0000ff;">new</span> <span style="color: #408080;">Form1</span>() ); <br />} <span style="color: #0000ff;">finally</span> { <br />&nbsp; <span style="color: #408080;">SiAuto</span>.Main.LeaveProcess( <span style="color: #800000;">"My Program"</span> ); <br />}</span></p>
<p>Die mit diesen Methoden protokollierten Aufrufe lassen sich wie auch schon bei den Threads in SmartInspect gefiltert anzeigen. So kann man auch unabh&auml;ngig vom Logging-Level beispielsweise alle Methodenaufrufe in der Konsole ausblenden. Innerhalb der SmartInspect Konsole werden s&auml;mtliche Aufrufe au&szlig;erdem hierarchisch dargestellt, <abbr title="das hei&szlig;t">d.h.</abbr> innerhalb einer Baumstruktur ist auf einen Blick ersichtlich in welcher Methode beispielsweise eine bestimmte Logging-Nachricht erzeugt wurde. Die einzelnen &Auml;ste lassen sich entsprechend auf mit dem gewohnten Plus- und Minuszeichen auf- und einklappen um eine schnelle &Uuml;bersicht zu gewinnen. Hierbei ist mir jedoch negativ aufgefallen, dass die Konsole nach jeder &Auml;nderung, beispielsweise dem Einf&uuml;gen eines Kommentares oder dem Einf&auml;rben einer Zeile, wieder s&auml;mtliche &Auml;ste einblendet selbst wenn diese zuvor geschlossen wurden. Das ist leider auf Dauer doch ziemlich nervig und kostet unn&ouml;tig Zeit.</p>
<h2>Weitere Logging-M&ouml;glichkeiten</h2>
<p>Nat&uuml;rlich kann man mit SmartInspect nicht nur einfache Textnachrichten oder das Starten und Beenden von Threads, Methoden und Prozessen protokollieren. In der umfangreichen Bibliothek warten noch zahlreiche weitere Methoden, mit denen man beinahe jedes Objekt in das Logfile schreiben kann beispielsweise Bilder, Icons, <acronym title="Structured Query Language">SQL</acronym>-Querys, Streams, Dateien, Exceptions, <acronym title="Hypertext Markup Language ">HTML</acronym>-Text, Textreader oder auch ganz allgemein Object. Wem die vielf&auml;ltigen M&ouml;glichkeiten der mitgelieferten Bibliothek nicht ausreichen kann diese auch einfach um eigene Methoden erweitern um beispielsweise eine eigene Logging-Methode zu schreiben. Um die protokollierten Objekte betrachten zu k&ouml;nnen besitzt die SmartInspect Konsole verschiedene sogenannte Viewer, die die unterschiedlichsten Daten aufbereiten und entsprechend darstellen. Hierzu geh&ouml;rt die einfache Textanzeige, der Objekt-Viewer, die Bin&auml;ranzeige, der Sourcecode-Viewer (<em>mit Syntax-Highlighting f&uuml;r <acronym title="Extensible Markup Language ">XML</acronym>, <acronym title="Transact Structured Query Language">T-SQL</acronym>, <acronym title="Hypertext Markup Language ">HTML</acronym>, &hellip;</em>) und f&uuml;r protokollierten <acronym title="Hypertext Markup Language ">HTML</acronym>-Text einen integrierten Webbrowser.</p>
<p><a rel="lightbox[SmartInspect]" href="http://static.gordon-breuer.de/img/SmartInspect_A40/exception_2.png"><img style="margin: 5px 5px 5px 0px; border: 0px" title="exception" src="http://anheledirwp.blob.core.windows.net/wordpress/2008/06/exception_thumb.png" border="0" alt="exception" width="136" height="79" align="left" /></a> Gerade das Protokollieren von Exceptions bietet sich bei <span style="font-family: Courier New;">try/catch</span>-Bl&ouml;cken an. Selbst wenn man eine eigene, eventuell sogar transparent im Hintergrund stattfindende, Fehlerbehandlung verwendet kann man so leicht feststellen, welche Methode / Thread / Prozess bei welchem Aufruf eine Ausnahme ausgel&ouml;st hat und auch die vorangegangenen Aktionen mit ber&uuml;cksichtigen (sofern sie protokolliert wurden). Aber auch andere Fehler und dabei beteiligte Objekte lassen sich mit den entsprechenden Methoden in das Logfile zur (sp&auml;teren) Analyse schreiben. Gerade am Anfang neigt man dazu haupts&auml;chlich die gewohnten reinen Textnachrichten zum protokollieren zu verwenden. Man sollte sich aber m&ouml;glichst fr&uuml;hzeitig auch mit den anderen Methoden auseinander setzen, da sie einem die Debug-Arbeit teilweise deutlich erleichtern k&ouml;nnen.</p>
<p><a rel="lightbox[SmartInspect]" href="http://static.gordon-breuer.de/img/SmartInspect_A40/watches_2.png"><img style="margin: 5px 0px 5px 5px; border: 0px" title="watches" src="http://anheledirwp.blob.core.windows.net/wordpress/2008/06/watches_thumb.png" border="0" alt="watches" width="175" height="103" align="right" /></a> Eine sehr n&uuml;tzliche Erweiterung stellen die so genannten &bdquo;Watches&ldquo; dar. Statt beispielsweise in einer Schleife oder &auml;hnlichem die Anzahl von Durchl&auml;ufen mit der Methode <span style="font-family: Courier New;">LogInt()</span> auszugeben kann man hierf&uuml;r auch die Methode <span style="font-family: Courier New;">Watch()</span> verwenden (<span style="color: #ff8000;">&bdquo;siw&ldquo;</span>):</p>
<p><span style="font-family: Courier New;"><span style="color: #408080;">SiAuto</span>.Main.Watch(<span style="color: #800000;">"Name"</span>, value);</span></p>
<p>Der Wert <span style="font-family: Courier New;">value</span> wird dabei ebenfalls protokolliert mit dem angegebenen Namen, allerdings wird dieser nicht innerhalb des Protokoll-Trees angezeigt sondern in einem speziellen Bereich der Konsole. Dort sind alle &uuml;berwachten Werte zusammengefasst mit ihrem jeweils gerade aktuellem Wert. Die &Auml;nderung dieses Wertes l&auml;sst sich bei Bedarf auch grafisch in einem Graphen darstellen um den zeitlichen Verlauf des Wertes zu visualisieren (<em>Bild 6</em>). Sowohl die Aktualisierung des angezeigten Wertes als auch des Graphen geschehen hierbei in Echtzeit sofern die Logging-Daten der Anwendung per <acronym title="Transmission Control Protocol">TCP </acronym>an die Konsole &uuml;bertragen werden.</p>
<h2>Team-Work</h2>
<p>SmartInspect ist grunds&auml;tzlich mit einigen Funktionen ausgestattet, die es auch Entwickler-Teams erm&ouml;glichen gemeinsam die erstellten Logfiles auszuwerten. So kann man zu den Eintr&auml;gen im Logfile Kommentare hinzuf&uuml;gen, einzelne Zeilen manuell oder automatisiert einf&auml;rben und das Logfile direkt aus der Konsole heraus an andere Mitarbeiter per E-Mail oder dem integriertem <acronym title="Transmission Control Protocol">TCP</acronym>-Dienst versenden. Bei letzterem muss der Empf&auml;nger des Logfiles in seiner SmartInspect Konsole den <acronym title="Transmission Control Protocol">TCP</acronym>-Server aktivieren. Anschlie&szlig;end kann der Kollege durch Eingabe des Hostnames und des entsprechenden Ports seine aktuelle Logfile direkt auf die andere Konsole &uuml;bertragen ohne die Dateien von Hand austauschen zu m&uuml;ssen. Wie bereits weiter oben erw&auml;hnt fehlt mir hier im Augenblick noch die M&ouml;glichkeit eines zentralen Servers.</p>
<p>Um die protokollierten Daten auch in anderen Anwendungen verwenden zu k&ouml;nnen gibt es auch diverse Export-M&ouml;glichkeiten. Hier bietet SmartInspect das Exportieren aller Daten sowohl in das <acronym title="Character Separated Values">CSV</acronym>- als auch das <acronym title="Extensible Markup Language">XML</acronym>-Format an. Beide Formate erm&ouml;glichen es die enthaltenen Daten leicht zu &auml;ndern oder auch in anderen Applikationen zu verwenden. Zus&auml;tzlich gibt es noch einen Export in das <acronym title="Hypertext Markup Language">HTML</acronym>-Format. Das Ergebnis ist eine webf&auml;hige Darstellung des Logfiles inklusive der Icons, Einr&uuml;ckungen und farblichen Markierungen. Auch eine Zusammenfassung aller Watches und Threads wird an das Ende hinzugef&uuml;gt. Erfreulich ist, dass der erzeugte Quellcode valide nach <acronym title="Hypertext Markup Language">HTML </acronym>4.01 Transitional ist.</p>
<p>&nbsp;</p>
<h2>Grab-Bag</h2>
<p>&Uuml;ber eine Anwendung wie SmartInspect kann man vermutlich ein ganzes Buch f&uuml;llen. Neben den bereits erw&auml;hnten Funktionen gibt es deshalb noch zahlreiche andere M&ouml;glichkeiten, die ich hier entweder aus Platzmangel nicht ausf&uuml;hrlich beschrieben habe oder die ich aus Zeitmangel selber noch nicht im Detail getestet habe. Einige, meiner Meinung nach n&uuml;tzliche, sollen deshalb hier noch eine kurze Erw&auml;hnung finden.s</p>
<h3>Fehlerbehandlung</h3>
<p>Die Bibliothek von SmartInspect wirft selber eigentlich keine Fehler um den Ablauf des Hauptprogramms nicht zu beeinflussen. Eine Ausnahme ist die Verwendung eines ung&uuml;ltigen Wertes beim Erstellen der Verbindung. Um auf Fehler der Bibliothek innerhalb der Anwendung reagieren zu k&ouml;nnen wurde jedoch ein Event bereitgestellt das man abonieren kann:</p>
<p><span style="font-family: Courier New;"><span style="color: #408080;">SiAuto</span>.Si.Error += <span style="color: #0000ff;">new</span> <span style="color: #408080;">ErrorEventHandler</span>( Si_Error );</span></p>
<p><span style="font-family: Courier New;">...</span></p>
<p><span style="font-family: Courier New;"><span style="color: #0000ff;">static void</span> Si_Error( <span style="color: #0000ff;">object</span> sender, <span style="color: #408080;">ErrorEventArgs</span> e ) { <br />&nbsp; <span style="color: #408080;">Console</span>.WriteLine( e.Exception ); <br />}</span></p>
<h3>Protokolle</h3>
<p>Das Speichern der Daten in eine Datei oder das Versenden &uuml;ber <acronym title="Transmission Control Protocol">TCP </acronym>sind vermutlich am h&auml;ufigsten eingesetzten Protokolle. Zus&auml;tzlich bietet SmartInspect aber noch weitere M&ouml;glichkeiten:</p>
<ul>
<li>&bdquo;<strong>File Protocol</strong>&ldquo; &ndash; Wie bereits erw&auml;hnt werden die Daten hier im SmartInspect-Bin&auml;rformat abgespeichert </li>
<li>&bdquo;<strong><acronym title="Transmission Control Protocol">TCP </acronym>Protocol</strong>&ldquo; &ndash; Die Anwendung versucht eine Verbindung zur SmartInspect Konsole aufzubauen und &uuml;bertr&auml;gt die Daten dann direkt </li>
<li>&bdquo;<strong>Memory Protocol</strong>&ldquo; &ndash; Die Daten werden im Speicher vorgehalten und auf Anforderung in einen Stream gespeichert </li>
<li>&bdquo;<strong>Text Protocol</strong>&ldquo; &ndash; Die Daten werden in einer Textdatei gespeichert und man kann selber entscheiden wie die Meldungen hier formatiert werden </li>
</ul>
<h3>Konfigurationsdatei</h3>
<p>Statt alle notwendigen Einstellungen direkt in den Quellcode der Anwendung zu schreiben kann man auch eine Konfigurationsdatei bereitstellen die dann von der SmartInspect-Bibliothek zur Laufzeit der Anwendung geladen wird. Um eine solche Konfigurationsdatei zu erstellen liefert Gurock Software auch gleich ein passendes Tool mit: &bdquo;SmartInspect Configuration Builder&ldquo;. Der Vorteil hierbei ist, dass man beispielsweise den Standart-Loglevel jederzeit &auml;ndern kann sowie die Art und Weise des Loggings (<em>siehe &bdquo;<strong>Protokolle</strong>&ldquo;</em>) ohne am eigentlichen Quellcode etwas zu ver&auml;ndern.</p>
<h3>Eigene Erweiterungen</h3>
<p>Wem die mitgelieferten Funktionen von SmartInspect&nbsp; nicht ausreichen der kann einfach selber Hand anlegen: Sowohl der vollst&auml;ndige Quellcode der Bibliothek steht zur Verf&uuml;gung als auch umfangreiche M&ouml;glichkeiten beispielsweise eigene Log-Events innerhalb der eigenen Anwendung zu erstellen.</p>
<h3>Selbsterstellte Objekte</h3>
<p>In diesem kurzen Erfahrungsbericht habe ich der Einfachheithalber ausschlie&szlig;lich die von SmartInspect automatisch erzeugten Objekte verwendet, die man &uuml;ber <span style="font-family: Courier New;">SiAuto</span> ansprechen kann. Allerdings besteht auch die M&ouml;glichkeit sich selber um diese Objekte zu k&uuml;mmern, was einem einen flexibleren Umgang mit diesen erm&ouml;glicht. Es ist hierf&uuml;r notwendig sowohl ein <span style="font-family: Courier New;">SmartInspect</span>-Objekt als auch ein <span style="font-family: Courier New;">Session</span>-Objekt zu erzeugen wobei letztere einem <span style="font-family: Courier New;">SmartInspect</span>-Objekt zugeordnet sein m&uuml;ssen. So k&ouml;nnen dann beispielsweise unterschiedliche <span style="font-family: Courier New;">Session</span>-Objekte ihre Meldungen in verschiedenen Farben an die SmartInspect Konsole senden um die einzelnen Sessions leichter auseinander halten zu k&ouml;nnen.</p>
<h3>Automatische Views und Marker</h3>
<p>Wie bereits beim Punkt &bdquo;Thread-Protokollierung&ldquo; erw&auml;hnt besitzt die SmartInspect Konsole die M&ouml;glichkeit anhand von bestimmten Regeln automatisch weitere Views zu erstellen. Eine View ist dabei ein Anzeigefenster f&uuml;r die protokollierten Daten dessen Inhalt man anhand verschiedenster Kriterien und Regeln filtern kann. Zur weiteren Erleichterung bietet die Konsole auch die M&ouml;glichkeit Marker automatisch zu erzeugen. Ein Marker ist hierbei eine farbliche Hervorhebung einer Zeile (<em>Bild 5</em>). Man kann also beispielsweise alle Nachrichten, die den Level &bdquo;Error&ldquo; haben rot oder Nachrichten die eine bestimmte Zeichenkette enthalten gelb hinterlegen. Hierbei k&ouml;nnen auch regul&auml;re Ausdr&uuml;cke verwendet werden, was die M&ouml;glichkeiten f&uuml;r diesen Automatismus potenziert.</p>
<h2>Fazit</h2>
<p>Ich war zun&auml;chst ein wenig skeptisch ob eine Anwendung die &bdquo;nur&ldquo; f&uuml;r das Logging Verwendung findet &uuml;ber 200 Euro wert sein kann. Ein paar <span style="font-family: Courier New;">write</span>-Befehle in eine Textdatei kann ich auch mit Bordmitteln realisieren und Visual Studio bringt auch einen brauchbaren Debugger mit. Was ich dann aber beim Testen und Ausprobieren der vielen M&ouml;glichkeiten von SmartInspect erlebt habe war ein regelrechtes &bdquo;Wow&ldquo;-Erlebnis: Das ansonsten recht unangenehme Debuggen von Programmen (<em>wer besch&auml;ftigt sich schon gerne mit Fehlern die er dazu noch selbst zu verantworten hat!</em>) wird mit diesem Tool deutlich vereinfacht und l&auml;sst die Fehlersuche deutlich effizienter werden. Gerade das Debuggen von Web-Applikationen ist selbst im Livebetrieb mit SmartInspect kein Problem mehr. Nat&uuml;rlich ist es ein wenig aufw&auml;ndig eine bereits (zum Teil) fertige Anwendung nachtr&auml;glich mit der SmartInspect-Bibliothek nachzur&uuml;sten; doch diese Zeitinvestition rechnet sich sp&auml;ter eindeutig bei der Fehlersuche. Sp&auml;testens wenn man Fehler in bereits ausgelieferten / im Produktiveinsatz befindlichen Anwendungen in einer erzeugten Logfile nachvollziehen will spart einem das Produkt von Gurock Software wertvolle Arbeitszeit die man dann sinnvoller f&uuml;r die Fehlerbeseitigung nutzen kann.</p>
<p>Ein paar kleine Abz&uuml;ge in der B-Note gibt es nur f&uuml;r ein paar Ungereimtheiten im Handling (<em>bsp. das Aufklappen aller &Auml;ste beim &Auml;ndern eines Eintrages in der View</em>) und die nur in englisch verf&uuml;gbaren Handb&uuml;cher und Hilfen. Letztere sind aber dennoch sehr ausf&uuml;hrlich und gut geschrieben und machen bei soliden Englischkenntnissen keine gro&szlig;en Schwierigkeiten. Etwas ausf&uuml;hrlicher k&ouml;nnte die Dokumentation lediglich bei Themen wie die Erweiterung mit eigenen Log-Events usw. sein, hier ist man zum Teil leider auf <em>&bdquo;Try&rsquo;n&rsquo;Error&ldquo;</em> oder das Suchen im Support-Forum auf der Website angewiesen.</p>
<p>Insgesamt bekommt SmartInspect von mir <strong>4 von 5 Punkten</strong>; ich kann jedem ernsthaften Entwickler nur empfehlen sich die kostenlose Testversion einmal anzusehen und eine Weile damit zu arbeiten. Auf der anderen Seite ist die Anwendung sicher auch f&uuml;r den Hobby-Programmierer und f&uuml;r eher kleine Projekte interessant, hier d&uuml;rften die Kosten den Nutzen jedoch &uuml;berwiegen. Es w&auml;re deshalb noch w&uuml;nschenswert, wenn Gurock Software f&uuml;r beispielsweise Studenten und OpenSource-Entwickler eine kostenlose oder zumindest stark verg&uuml;nstigte Variante anbieten w&uuml;rde.</p>