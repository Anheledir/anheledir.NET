---
layout: post
title: XML-Validierung mit Visual Studio 2005
category: .*
tags: []
---
<p>
Wir haben bei uns in der Firma schon seit einiger Zeit einen XML-Editor gesucht, der nicht nur gegen Standard-DTDs validieren, sondern bei dem man auch eigene Schemas angeben kann. Gefunden haben wir dabei beispielsweise <a href="http://www.oxygenxml.com/" target="_blank">&lt;oXygen/&gt;</a>, der mit &uuml;ber $200 allerdings doch etwas teuer ist, daf&uuml;r dass wir nur einen sehr kleinen Funktionsumfang wirklich br&auml;uchten. F&uuml;r neue XSD-Schemas gibt es ebenfalls einige Editoren wie beispielsweise <a href="http://www.microsoft.com/downloads/details.aspx?FamilyID=72D6AA49-787D-4118-BA5F-4F30FE913628&amp;displaylang=en" target="_blank">Microsoft XML Notepad 2007</a>, aber unsere XML-Dateien verwenden aus technischen Gr&uuml;nden noch eine DTD und keine XSD - und gegen die kann XML Notepad nicht validieren. 
</p>
<p>
In der Tat ist aber in Visual Studio 2005 ein sehr guter Editor eingebunden, der einem zahlreiche Arbeiten abnimmt. Ich werde hier auch nur einen ganz kleinen Teil vorstellen und Themen wie das Debuggen von XSLTs dabei v&ouml;llig aussen vor lassen - zumal ich mich damit bisher selber noch nie besch&auml;ftigt habe. <img src="http://anheledirwp.blob.core.windows.net/wordpress/2007/09/smile_angel.gif" alt="smile_angel" width="19" height="19" /> 
</p>
<p>
Um also eine XML-Datei mit Visual Studio gegen eine eigene DTD zu validieren &ouml;ffnen wir zun&auml;chst die XML-Datei &uuml;ber &quot;File - Open - File...&quot;. In dieser muss &uuml;ber den Doctype zun&auml;chst angegeben werden, welche DTD Verwendung finden soll: 
</p>
<div style="font-size: 10pt; background: white; color: black; font-family: consolas">
<p style="margin: 0px">
<span style="color: #2b91af">&nbsp;&nbsp;&nbsp; 1</span>&nbsp;<span style="color: blue">&lt;?</span><span style="color: #a31515">xml</span><span style="color: blue"> </span><span style="color: red">version</span><span style="color: blue">=</span>&quot;<span style="color: blue">1.0</span>&quot;<span style="color: blue"> </span><span style="color: red">encoding</span><span style="color: blue">=</span>&quot;<span style="color: blue">UTF-8</span>&quot;<span style="color: blue">?&gt;</span> 
</p>
<p style="margin: 0px">
<span style="color: #2b91af">&nbsp;&nbsp;&nbsp; 2</span>&nbsp;<span style="color: blue">&lt;!</span><span style="color: #a31515">DOCTYPE</span><span style="color: blue"> </span><span style="color: red">doc</span><span style="color: blue"> SYSTEM </span>&quot;<span style="color: blue">example.dtd</span>&quot;<span style="color: blue">&gt;</span> 
</p>
</div>
<p>
In diesem Fall liegt die Datei example.dtd im selben Verzeichnis wie die XML-Datei. Sollte Visual Studio sie dort nicht vorfinden, wird der Dateiname mit einer roten Wellenlinie unterstrichen. Das reicht jetzt im Prinzip auch schon VS2k5 als Information: &Ouml;ffnet man die &quot;Error List&quot; bekommt man eine Echtzeit-Analyse der XML-Datei mit allen Fehlern inkl. kurzer Beschreibung. 
</p>
<p>
Nat&uuml;rlich funktioniert auch Intellisense wie im &uuml;brigen Editor: Anhand der Informationen in der DTD weiss Visual Studio welche Elemente mit welchen Attributen noch hinzugef&uuml;gt werden m&uuml;ssen bzw. k&ouml;nnen. 
</p>
<p>
Als weiteres Extra kann man sich nat&uuml;rlich auch XML-Dateien sauber formatieren lassen: &quot;Edit - Advanced - Format Document...&quot; funktioniert hier ebenso wie in den &uuml;blichen .NET-Sprachen. Die eigenen Vorlieben wie das Einr&uuml;cken etc. lassen sich &uuml;ber die Optionen des Texteditors festlegen. 
</p>
<p>
Eine letzte Anregung ist das zus&auml;tzliche Men&uuml; &quot;XML&quot;, dass bei ge&ouml;ffneten XML-Dateien erscheint. Hier ist auch die Funktion zum Debuggen von XSLT-Dateien zu finden, aber f&uuml;r den Augenblick ist die oberste Funktion evtl. interessanter: &quot;Create Schema&quot;. Visual Studio 2005 kann mit Hilfe eines internen Parsers DTD-Dateien analysieren und erstellt daraus dann ein neues Schema im XSD-Format. Wie bei allen Dingen die ein Programm v&ouml;llig automatisch erzeugt sollte man den erstellten Code nat&uuml;rlich nicht ungepr&uuml;ft &uuml;bernehmen, aber wenn ich mich auf die Erfahrungswerte einiger anderer Programmierer verlassen kann dann funktioniert die erzeugte XSD in allen F&auml;llen fehlerfrei. 
</p>
<p>
Wer weitere Informationen zum Thema XML in Visual Studio 2005 sucht, den verweise ich auf den Webcast &quot;<a href="http://www.microsoft.com/germany/msdn/webcasts/library.aspx?id=118760184" target="_blank">XML an allen Ecken</a>&quot; von Christain Weyer. 
</p>
