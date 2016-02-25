---
layout: post
title: Die Dreifaltigkeit in C# 3.0: λ, LINQ und Extension-Methods (Teil 1 / 3)
category: .*
tags: []
---
<p>Wenn man von den wichtigsten Spracherweiterungen des .NET Frameworks in der Version 3.5 – und damit auch von Visual C# 2008 – spricht, so denken viele zunächst an <strong>LINQ</strong>. Beschäftigt man sich mit diesem Thema ein wenig stößt man kurz darauf auf so genannte <strong>Lambda-Ausdrücke</strong>. Und als ob diese beiden Themen noch nicht umfangreich genug wären basieren beide Technologien auf einer weiteren Neuerung: den <strong>Extension Methods</strong>. In dieser Artikelserie möchte ich auf alle drei Themen nacheinander eingehen und so die Zusammenhänge und Abhängigkeiten zwischen ihnen verdeutlichen. Denn bevor man eine neue Technologie auch effektiv einsetzen kann sollte man sie zunächst selber verstehen können.</p>  <div style="border-right: #000000 1px solid; padding-right: 4px; border-top: #000000 1px solid; padding-left: 4px; padding-bottom: 4px; vertical-align: top; border-left: #000000 1px solid; width: 523px; padding-top: 4px; border-bottom: #000000 1px solid; background-color: yellow">Obwohl viele Neuerungen sowohl für C# 3.0 als auch Visual Basic .NET 9.0 und Chrome 2.0 verfügbar sind, werde ich im Folgenden lediglich auf die Implementierung in C# eingehen. Als <acronym title="Integrated Development Environment">IDE </acronym>wurde die englische Version von Microsoft Visual Studio 2008 unter Vista SP1 und Windows XP SP3 eingesetzt. Die Beispiele sind allesamt in C# geschrieben und basieren auf der Version 3.5 des .NET-Frameworks.</div>  <p>[more]</p>  <h2>Teil 1: Extension Methods</h2>  <h3>Einführung</h3>  <p>Die Extension Methods, oder im Deutschen auch Erweiterungsmethoden genannt, sind eine Spracherweiterung die mit der Version 3.5 des .NET-Frameworks eingeführt wurde und es ermöglichen, Datentypen um Funktionalität zu erweitern ohne dass der Entwickler den Quellcode dieser Datentypen besitzen muss. So ließe sich beispielsweise eine Methode <font face="Courier New">ToInt32()</font> für den Datentyp <font face="Courier New">string</font> schreiben, auf den man sonst keinen Zugriff hätte (die <font face="Courier New">string</font>-Klasse ist als <font face="Courier New">sealed</font> markiert). Zunächst wurden die Erweiterungsmethoden allerdings nicht eingeführt um bestehende Datentypen belieb erweitern zu können. Das ist lediglich ein (erfreulicher) Nebeneffekt, den man als Programmierer davon hat. In erster Linie waren die Erweiterungsmethoden für die LINQ-Technologie und die damit verbundenen Lambda-Ausdrücke notwendig geworden, weshalb ich sie hier auch behandeln möchte.</p>  <p>Wie bereits erwähnt und auch am Namen erkennbar kann man andere Datentypen mit den Extension Methods um zusätzliche Funktionalitäten erweitern ohne direkten Zugriff auf den Quellcode dieser Datentypen zu benötigen. Bleiben wir für ein kleines Beispiel beim oben genannten Szenario, einer Methode <font face="Courier New">ToInt32()</font> für die <font face="Courier New">String</font>-Klasse. Eine Erweiterungsmethode wird als statische Methode einer ebenso statischen Klasse deklariert. Der erste Parameter dieser Methode definiert hierbei den zu erweiternen Datentyp und bekommt zur Unterscheidung für den Compiler ein Schlüsselwort vorangestellt (<font face="Courier New">this</font>). Wenn erforderlich können nach diesem (<em>zwingend erforderlichen</em>) Parameter weitere folgen, die beim Aufruf in Klammern übergeben werden können. Ganz allgemein sieht die Deklaration einer Erweiterungsmethode also wie folgt aus:</p>  <div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:e3a8c813-5d44-4ae0-b542-5a143824c50f" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nogutter:nocontrols">public static void MeineErweiterung(this BestehenderDatentyp parametername[, Parameter]) {
  // Implementierung der Erweiterung
}</pre></div>

<p>Der erste Parameter wird bei der Verwendung der Methode nicht übergeben, innerhalb dieser kann aber sowohl sein Wert als auch die Methoden des jeweiligen Datentyps verwendet werden. Damit haben wir nun alles notwendige an Handwerkszeug um unser Beispiel zu schreiben:</p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:ba567a6f-ab52-46a9-8a3b-1d38b0f44cf3" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nocontrols">public static class StringExtensions {
  public static int ToInt32( this string s ) {
    int ergebnis;
    if ( Int32.TryParse(s, out ergebnis) ) {
      return ergebnis;
    } else {
      return 0;
    }
  }
}
</pre></div>

<h3>Extension Methods und <font face="Courier New">null</font></h3>

<p>Wer hat sich noch nicht über eine <font face="Courier New">NullPointerException</font> geärgert, die er vergessen hat abzufangen? In der Tat ist mir aufgefallen, dass die meisten Ausnahmen genau von diesem Typ sind. Das mag daran liegen, dass kaum jemand jedesmal daran denkt bei der Verwendung einer Instanz-Methode vorher das Objekt auf <font face="Courier New">null</font> zu prüfen:</p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:0ddaf23d-d8ba-4d9d-9f57-4b4f38c6095a" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nogutter:nocontrols">if ( foo != null ) {
  foo.Bar();
}</pre></div>

<p>Lässt man diese Überprüfung weg wird der Aufruf der Methode <font face="Courier New">Bar()</font> vermutlich in 95% der Fälle gut gehen, aber spätestens wenn ein Tester (<em>alternativ der Chef oder Kunde</em>) das Programm startet wird aus einem bisher nicht bedachten Grund das Objekt <font face="Courier New">foo</font> nicht initialisiert sein und schon hat man die gefürchtete Exception. Wie können einem Extension Methods nun hierbei helfen? Durch eine nützliche Eigenschaft: Sie werfen nicht automatisch eine Exception wenn man sie auf ein nicht-initialisiertes Objekt aufruft! Sie sind quasi „geimpft“ und sehen über den Wert <font face="Courier New">null</font> einfach beim Aufruf hinweg:</p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:6e76643f-b689-4748-a00a-a7fa726de24a" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nogutter:nocontrols">string foo = "4711";
int bar = foo.ToInt32();
Console.WriteLine( bar );

foo = null;
bar = foo.ToInt32();
Console.WriteLine( bar );</pre></div>

<p>Diese Zeilen laufen ohne das Werfen einer Ausnahme durch und geben „4711“ und „0“ aus, da wir unsere Erweiterungsmethode <font face="Courier New">ToInt32()</font> verwendet haben. Hätten wir dagegen versucht eine Instanzmethode, beispielsweise Trim(), zu verwenden wäre eine Ausnahme geworfen worden. Es bietet sich also in bestimmten Fällen durchaus an, eine Funktion nicht als Instanzmethode sondern als Erweiterungsmethode zu implementieren und sich so bei jeder Verwendung die Überprüfung auf <font face="Courier New">null</font> zu sparen.</p>

<p>Eine mögliche Anwendung dieser Eigenart habe ich bei <a href="http://elegantcode.com/2007/12/05/firing-events-with-extension-methods/" target="_blank">Chris Brandsma</a> entdeckt und auch wenn er selber nicht ganz davon überzeugt ist („<em>OK, sometimes you have an idea that is one point (seemingly) brilliant, simple, and kind of stupid all in one shot. This is one of those.</em>“) finde ich die Idee durchaus interessant. Im Grunde hat er eine Extension Method geschrieben, die alle Events vom Typ <font face="Courier New">EventHandler&lt;TEventArgs&gt;</font> um eine Methode <font face="Courier New">Fire()</font> erweitert:</p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:c2cebab3-f1e5-40fc-b359-ae4b36ed8f9e" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nocontrols">using System;
namespace Anheledir.Extensions {
  public static class Events {
    public static void Fire&lt;TEventArgs&gt;( this EventHandler&lt;TEventArgs&gt; myEvent, object sender, TEventArgs e ) where TEventArgs : EventArgs {
      if ( myEvent != null )
        myEvent( sender, e );
    }
  }
}</pre></div>

<p>Statt nun ein Event direkt zu werfen verwendet man einfach die Erweiterungsmethode <font face="Courier New">Fire()</font> und kann sich dafür jedesmal die Überprüfung sparen ob irgendeine Methode überhaupt an das Event angehängt wurde. Und das kommt schlußendlich auch der Lesbarkeit des Codes zu Gute da man nicht alle paar Zeilen über eine weitere <font face="Courier New">null</font>-Abfrage stolpert. Die Erweiterung des (<em>generischen</em>) Datentyps <font face="Courier New">EventHandler&lt;TEventArgs&gt;</font> ermöglicht die Verwendung dieser Methode für jedes beliebige Event, einfach durch Einbinden des entsprechenden Namensraumes (<em>hier beispielsweise mit:</em>&#160;<font face="Courier New">using Anheledir.Extensions;).</font></p>

<h3>Was spricht gegen Extension Methods</h3>

<p>Ich habe bisher von zwei Hauptargumenten gegen die Erweiterungsmethoden gelesen und möchte auf diese natürlich ebenso eingehen.</p>

<h4>Extension Methods machen den Quellcode schwer lesbar / wartbar</h4>

<p>Nehmen wir folgendes Beispiel:</p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:2024f038-5a64-4690-a36c-6beba24e132e" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nogutter:nocontrols">String s = "Mein Hut der hat drei Ecken.";
Console.WriteLine( s.Reverse() );</pre></div>

<p>Was wird mir nun ausgegeben? Eine Möglichkeit wäre: „<em>.nekcE ierd tah red tuH nieM</em>”. Vielleicht aber auch „<em>Ecken drei hat der Hut Mein.</em>”. Das Problem ist, dass man auf den ersten Blick nicht weiß, woher die Methode <font face="Courier New">Reverse()</font> kommt und so auch nicht nachvollziehen kann, was sie eigentlich macht. Das Argument lässt sich aber dank der guten Intellisense Unterstützung in Visual Studio schnell entkräften, da ein Rechtsklick auf die Erweiterungsmethode und die Auswahl von „<em>Go to definition</em>“ einen direkt zum entsprechenden Quellcode führt. Und vom Lesefluß finde ich die Infixnotation der Erweiterungsmethoden auch angenehmer zu lesen als die Präfixnotation:</p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:cf02c1b2-c517-4158-8dbd-e6cd1d315fae" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nogutter:nocontrols">int p = Summe( 3, 5 ); // Präfixnotation
int i = 3 + 5; // Infixnotation</pre></div>

<p>&#160;</p>

<h4>Extension Methods sind anfälliger für Namespace-Konflikte</h4>

<p>Angenommen ich habe zwei Erweiterungsmethoden mit dem gleichen Namen, aber in unterschiedlichen Namensräumen, geschrieben die ich nun mittels using-Direktive in meine Datei einbinde. Oder ich habe eine Erweiterungsmethode geschrieben die den gleichen Namen hat wie eine Instanz-Methode der zu erweiternden Klasse. Oder ich binde in zwei unterschiedlichen Klassen jeweils einen anderen Namensraum ein und die Erweiterungsmethode mit dem gleichen Namen macht jeweils etwas anderes.</p>

<p>Im <a href="http://dotnet-forum.de/forums/t/503.aspx" target="_blank">.NET-Forum</a> wurde in einem Thread gesagt, dass solche Konflikte in der Praxis eher selten wären oder auch bei großen Projekten faktisch gar nicht auftreten. Diese Erfahrung kann ich leider nicht teilen, denn die wenigsten von uns arbeiten in einem reinen Vakuum: Man verwendet APIs oder Erweiterungen von Drittherstellern oder arbeitet in einem größeren Team mit verschiedensten Entwicklern zusammen, zum Teil auch geografisch getrennt. So hat ein Team beispielsweise eine Komponente geschrieben, die in der Anwendung mehrfach referenziert wird. Nach einer gewissen Zeit kommt die Anforderung, dass man diese Komponente um ein paar Methoden erweitert um sie aktuellen Gegebenheiten anzupassen, das ursprüngliche Entwicklerteam sitzt aber gerade an einem anderen Projekt. Man schreibt sich also beispielsweise eine Erweiterungsmethode, die eine dringend benötigte Funktionalität schon mal nachrüstet (man könnte auch von der ursprünglichen Klasse ableiten, aber das Thema ist ja gerade Extension Methods). Eine Weile später wird dann eine gleichnamige Instanz-Methode vom ursprünglichen Entwicklerteam nachgerüstet, die aber ein leicht anderes Ergebnis ausgibt (bsp. ein anders sortiertes Array, …) – die Geschichte lässt sich jetzt sicher noch weiter spinnen. Fakt ist aber, dass man als einziger Programmierer sicher noch darauf achten kann solche Konflikte zu vermeiden, mit zunehmender Anzahl der Entwickler aber auch die Wahrscheinlichkeit eines Namespace-Konfliktes steigt.</p>

<p>Das ist natürlich kein Problem, welches sich nur auf die Erweiterungsmethoden beschränkt sondern vielmehr von grundsätzlicher Natur ist. Die Frage ist hier nur, wie man mit Konflikten im speziellen bei Extension Methods umgehen kann. Im ersten Beispiel ging es darum, dass man in eine Datei zwei Namensräume einbindet die jeweils eine identisch benannte Erweiterungsmethode bereitstellen. Solange man diese nun nicht verwendet tritt auch kein Fehler auf, alleine das Vorhandensein dieses Konfliktes verhindert also noch nicht die Verwendung aller anderen Klassen und Methoden der Namensräume. Erst wenn man die Erweiterungsmethode aktiv benutzen möchte bricht der Kompiler mit einer Fehlermeldung ab, da er die Methode nicht eindeutig zuweisen kann. Das heißt aber auch, dass kein „zufälliges“ oder ungewolltes Verhalten auftreten kann, da bereits der Kompilerfehler die Ausführung des Programms verhindert. Im zweiten Fall hatte die Erweiterungsmethode den gleichen Namen wie eine Instanz-Methode. Hier gibt es eine einfache Regel: Instanz-Methoden haben immer Vorrang! Das hat im übrigen auch den Vorteil, dass ich eine gleichnamige Instanz-Methode auch dann aufrufen kann, wenn es mehrere Erweiterungsmethoden mit dem gleichen Namen geben würde (was ohne die Instanz-Methode wie bereits erwähnt zu einem Fehler beim Kompilieren führen würde).</p>

<p>Im Notfall kann man das Problem der Namenskonflikte außerdem umgehen, in dem man die Erweiterungsmehode wie eine „normale“ statische Methode aufruft:</p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:2844bb21-b650-41a0-b1b4-141b57538fa5" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nogutter:nocontrols">string s = "4711";
int i = StringExtensions.ToInt32( s );</pre></div>

<h4>Fazit</h4>

<p>Wie schwer jeder Programmierer diese Gründe gewichtet ist selbstverständlich jedem selber überlassen. Jedoch sind Extension Methods lediglich der <em>Zuckerguss</em>, der den Quellcode schöner / besser lesbar machen kann und vielleicht auch in den ein oder anderen Situationen einem Arbeit abnimmt. Dabei sollte man es natürlich nicht übertreiben, die Instanz-Methoden sind in vielen Fällen immer noch zu bevorzugen. Nur weil man ein neues „Spielzeug“ hat muss man es ja nicht gleich immer und überall auch verwenden.</p>

<h2>Quellennachweise</h2>

<ul>
  <li><a href="http://www.addison-wesley.de/main/main.asp?page=aktionen/bookdetails&amp;ProductID=163410" target="_blank">Addison Wesley Buch: Visual C# 2008, Frank Eller (ISBN: 978-3-8273-2641-6)</a> </li>

  <li><a title="" href="http://gen5.info/q/2008/07/03/extension-methods-nulls-namespaces-and-precedence-in-c/" target="_blank">Generation 5: Extension Methods, Nulls, Namespaces and Precedence in C#</a> </li>

  <li><a title="" href="http://en.wikipedia.org/wiki/Extension_method" target="_blank">Wikipedia: Extension Method</a> </li>

  <li><a title="" href="http://elegantcode.com/2007/12/05/firing-events-with-extension-methods/" target="_blank">Elegant Code: Firing events with Extension Methods</a> </li>
</ul>
