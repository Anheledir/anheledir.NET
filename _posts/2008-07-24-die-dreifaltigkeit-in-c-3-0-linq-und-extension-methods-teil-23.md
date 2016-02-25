---
layout: post
section-type: post
title: Die Dreifaltigkeit in C# 3.0: λ, LINQ und Extension-Methods (Teil 2/3)
date: 2008-07-24 20:14
author: Gordon Breuer
comments: true
category: Development, Fachartikel
---
<p>Der erste Artikel meiner dreiteiligen Serie „Die Dreifaltigkeit in C# 3.0“ hat sich mit den Erweiterungsmethoden, im Englischen Extension-Methods, auseinandergesetzt. Nachdem wir nun die Vor- und auch Nachteile dieser Erweiterung des C#-Sprachschatzes besser kennengelernt haben möchte ich dieses mal auf die so genannten Lambda(λ)-Expressions zu sprechen kommen – welche die Grundlagen für LINQ bilden.</p>  <div style="border-right: #000000 1px solid; padding-right: 4px; border-top: #000000 1px solid; padding-left: 4px; padding-bottom: 4px; vertical-align: top; border-left: #000000 1px solid; width: 523px; padding-top: 4px; border-bottom: #000000 1px solid; background-color: yellow">Obwohl viele Neuerungen sowohl für C# 3.0 als auch Visual Basic .NET 9.0 und Chrome 2.0 verfügbar sind, werde ich im Folgenden lediglich auf die Implementierung in C# eingehen. Als <acronym title="Integrated Development Environment">IDE </acronym>wurde die englische Version von Microsoft Visual Studio 2008 unter Vista SP1 und Windows XP SP3 eingesetzt. Die Beispiele sind allesamt in C# geschrieben und basieren auf der Version 3.5 des .NET-Frameworks.</div>  <p>[more]</p>  <h2>Lambda(λ)-Expressions</h2>  <p>Nachdem wir nun ausführlich über die Erweiterungsmethoden gesprochen haben, können wir uns den so genannten Lambda-Expressions oder -Ausdrücken widmen. Sie sind lediglich eine andere Schreibweise für anonyme Methoden wie man sie bereits bei der Verwendung von Delegaten einsetzen konnte. Die Entscheidung eine Methode anonym zu erstellen sollte immer dann gefällt werden, wenn sie eigentlich zu „unwichtig“ für einen eigenen Namen ist (da man sie beispielsweise nur einmal benötigt). Die Schreibweise eines solchen Ausdrucks ist auf den ersten Blick etwas komplex; sobald man aber die Idee dahinter verinnerlicht hat, sollte sie kein Problem mehr darstellen.</p>  <p>In den folgenden Beispielen werde ich eine Liste vom Typ „<a href="http://static.gordon-breuer.de/files/sourcecode/Person.zip" target="_blank">Person</a>“ aus dem Buch „Visual C# 2008“ verwenden, die mit einigen Beispieldaten gefüllt ist: </p>  <div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:9796e6ea-c18e-4ef0-b209-38e16add0760" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:collapse:firstline[7]">public class Person {
  #region Automatisch implementierte Eigenschaften
  public string Title { get; set; }
  public string LastName { get; set; }
  public string FirstName { get; set; }
  public string Street { get; set; }
  public string Zip { get; set; }
  public string City { get; set; }
  public int Age { get; set; }
  #endregion

  #region Methode ToString()
  public override string ToString() {
    StringBuilder result = new StringBuilder();
    result.Append( Title );
    result.Append( " " );
    result.Append( FirstName );
    result.Append( " " );
    result.Append( LastName );
    result.Append( ", " );
    result.AppendFormat( "Alter: {0}, ", Age );
    result.Append( Street );
    result.Append( ", " );
    result.Append( Zip );
    result.Append( " " );
    result.Append( City );
    return result.ToString();
  }
  #endregion
}</pre></div>

<p>Springen wir also gleich ins kalte Wasser mit einem Beispiel, in dem wir nur die Personen aus der Liste wissen wollen, deren Nachname mit einem „P“ beginnt. Bisher musste man dafür ein ähnliches Konstrukt wie das folgende verwenden: </p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:6053c740-e715-4534-a6e4-0cdb2923ffbc" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nocontrols">List&lt;Person&gt; Adressbuch = PersonFactory.CreateRandomPeople( 100 );
List&lt;Person&gt; Ergebnis = null;
foreach ( Person p in Adressbuch ) {
  if ( p.LastName.StartsWith( "P" ) ) {
    Ergebnis.Add( p );
  }
}</pre></div>

<p>Das gleiche Ergebnis lässt sich nun mit Lambda-Expressions wie folgt erreichen: </p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:ebc0837e-9050-4282-b887-0ebec1fdbf2d" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nocontrols">List&lt;Person&gt; Adressbuch = PersonFactory.CreateRandomPeople( 100 );
List&lt;Person&gt; Ergebnis = Adressbuch.Where( p =&gt; p.LastName.StartsWith( "P" ) );</pre></div>

<p>Was ist hier geschehen? Zum Verständnis dieser Abfrage ist die Funktionsweise der Erweiterungsmethode <font face="Courier New">Where()</font> aus dem Namensraum <font face="Courier New">System.Linq</font> wichtig. Die genaue Implementierung von <font face="Courier New">Where()</font> in diesem speziellen Fall ist etwas komplexer, im Wesentlichen handelt es sich aber um die folgende Methode: </p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:6f4315e1-7bd2-408c-be68-4a46bd3cc8a8" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nocontrols">public static IEnumerable&lt;T&gt; Where&lt;T&gt;( this IEnumerable&lt;T&gt; source, Func&lt;T, bool&gt; predicate ) {
  foreach ( T item in source ) {
    if ( predicate( item ) ) {
      yield return item;
    }
  }
}</pre></div>

<p>Wir haben hier also eine <strong>Erweiterungsmethode</strong> vor uns die man auf alle Elemente anwenden kann, welche das Interface <font face="Courier New">IEnumerable&lt;T&gt;</font> implementieren (<em>der erster Parameter mit dem Schlüsselwort</em> <font face="Courier New">this</font>). Außerdem hat sie eine Rückgabe vom gleichen Typ und benötigt einen Übergabeparameter. Bei letztgenannten handelt es sich um einen <strong>Delegaten</strong>, das heißt es wird an dieser Stelle eine Funktion erwartet die als Übergabeparameter den <strong>Typ T</strong> entgegen nimmt und einen <strong>boolschen Wert</strong> als Ergebnis zurückgibt.</p>

<p>Werfen wir einen Blick in den Methodenrumpf um den Aufruf besser zu verstehen. Hier wird in Zeile 2 zunächst jedes Element der ursprünglichen Liste durchlaufen. Wir erinnern uns: Innerhalb einer Erweiterungsmethode kann man auf den Datentyp und seine Werte über den beim Schlüsselwort <font face="Courier New">this</font> angegebenen Namen zugreifen, hier also <strong>source</strong>. Innerhalb unserer foreach-Schleife haben wir nun die Variabel <font face="Courier New">item</font> vom Typ T (<em>in unserem Beispiel ist T der Typ Person</em>). In der 3. Zeile kommt nun unser Delegate mit dem Namen <font face="Courier New">predicate</font> zum Einsatz: Wir übergeben der beim Aufruf angegebenen Methode unser aktuelles Objekt <font face="Courier New">item</font> und erhalten als Ergebnis entweder <font face="Courier New">true</font> oder <font face="Courier New">false</font>. Die Erweiterungsmethode <font face="Courier New">where</font> soll ja nur die Elemente zurückgeben für die die Bedingung erfüllt ist, deshalb benutzen wir noch die if-Abfrage und geben das aktuelle Objekt nur dann zurück wenn der Aufruf der über <font face="Courier New">predicate</font> referenzierten Methode <font face="Courier New">true</font> zurückgibt. Das Schlüsselwort <font face="Courier New">yield</font> in Zeile 4 speichert die interne Laufvariabel der foreach-Schleife zwischen um beim erneuten Aufruf nicht an den Anfang zu springen, sondern vielmehr hinter die durch <font face="Courier New">yield</font> festgelegte Position innerhalb der Liste.</p>

<p>Kommen wir zu unserem Beispiel-Aufruf zurück. Hier fällt uns als nächstes das Zeichen <font face="Courier New"><strong>=&gt;</strong></font> auf. Hierbei handelt es sich um den so genannten <strong>Lambda-Operator</strong>. Man liest ihn als „<em>geht zu</em>“ bzw. im Englischen als „<em>goes to</em>“. Vor dem Lambda-Operator steht der zu übergebene Parameter. Den Datentyp lässt man in der Regel weg, da er bereits durch die verwendete Liste bekannt ist. Der Name ist frei wählbar bzw. unterliegt den üblichen Konventionen für Variabelnnamen. Auf der rechten Seite des Lambda-Operators steht der Code, der in der anonymen Methode ausgeführt werden soll. Das Schlüsselwort <font face="Courier New">return</font> läßt man hier weg, da es beim Aufruf implizit aufgerufen wird. Da unser Lambda-Ausdruck nur eine verkürzte Schreibweise für eine anonyme Methode ist, gibt es natürlich auch noch eine alternative Schreibweise wie man sie so auch mit dem .NET-Framework in der Version 2.0 hätte schreiben können: </p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:dbb3437b-1142-4847-bbed-f05b94ceec2d" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nocontrols">List&lt;Person&gt; Adressbuch = PersonFactory.CreateRandomPeople( 100 );
List&lt;Person&gt; Ergebnis = Adressbuch.Where( delegate( Person p ) {
                                            return p.LastName.StartsWith( "P" );
                                          }
                                        );</pre></div>

<p>Diese Schreibweise ist allerdings nicht so schön lesbar und kompakt wie die Lambda-Expression obwohl sie genau das gleiche macht. Der neue Syntax ist hier deutlich überlegen und sollte deshalb auch bevorzugt werden.</p>

<h3>Steuern der Rückgabe / Projektionen</h3>

<p>Als Rückgabewert haben wir bisher immer eine Liste vom gleichen Datentyp gehabt wie den der Ursprünglichen Liste. Das funktioniert auch ohne zusätzliche Befehle problemlos, aber manchmal benötigt man als Ergebnis gar nicht das vollständige Objekt oder möchte beispielsweise einen zusätzlichen Wert haben, der erst berechnet werden muss. Für diese Fälle kann man das Ergebnis unseres Lambda-Ausdrucks auch verändern, man spricht in diesem Fall von einer <strong>Projektion</strong> auf einen neuen Datentypen. Veranschaulichen wir das ebenfalls an einem kleinen Beispiel: </p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:3bca480e-1d37-475f-a556-a3e29e651721" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nocontrols">List&lt;Person&gt; Adressbuch = PersonFactory.CreateRandomPeople( 100 );
List&lt;string&gt; Ergebnis = Adressbuch.Select( p =&gt; p.FirstName + " " + p.LastName + " (" + p.Age + ")" );</pre></div>

<p>Wie man am Datentyp des Lambda-Ausdrucks bereits sieht erhalten wir dieses mal keine Liste mit Objekten des Typs <font face="Courier New">Person</font> sondern lediglich eine Liste mit Zeichenketten. Jeder Einzelne Eintrag besteht aus dem Vor- und Nachnamen einer Person und deren Alter dahinter in runden Klammern. Diese Liste mit Objekten vom Typ <font face="Courier New">string</font> tritt somit an die Stelle des eigentlich verwendeten Datentyps, die ursprünglichen Daten werden quasi auf einen neuen Typ <strong>projeziert</strong>.</p>

<p>Für das nächste Beispiel greife ich auf ein weiteres neues Feature von C# 3.0 zurück, die so genannten <strong>anonymen Datentypen</strong>. Es handelt sich hierbei analog zu den anonymen Methoden um einen Datentyp, den man beispielsweise nur an einer Stelle benötigt und für den man deshalb keine eigene Klasse schreiben möchte. Die Verwendung ergibt sich aus dem Beispiel, für nähere Informationen zu anonymen Datentypen empfehle ich den Artikel „<a href="http://msdn.microsoft.com/de-de/library/bb397696.aspx" target="_blank">Anonyme Typen</a>“ im C#-Programmierhandbuch. </p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:cc1062c1-d935-4977-bd5d-c9ac238ef593" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nocontrols">List&lt;Person&gt; Adressbuch = PersonFactory.CreateRandomPeople( 100 );
var Ergebnis = Adressbuch.Where( p =&gt; p.LastName.StartsWith( "P" ) )
                                  .Select( p =&gt; new {
                                    Vorname = p.FirstName;
                                    Nachname = p.LastName;
                                    Geburtsjahr = DateTime.Now.Year - p.Age;
                                    Weiblich = p.Title == "Frau";
                                  } );</pre></div>

<p>Der Zeilenumbruch und die Einrückung sind rein optischer Natur. Man könnte sie auch weglassen und den Ausdruck in eine einzige Zeile schreiben. Eine saubere Formatierung macht es allerdings einfacher den Überblick zu wahren und man erkennt die einzelnen Operatoren auf einen Blick. Die Berechnung des Geburtsjahres ist nicht ganz sauber da das genaue Datum außer acht gelassen wird. Die Eigenschaft soll hier lediglich als Beispiel für eine „<em>berechnete</em>“ Eigenschaft dienen.</p>

<p>Als Ergebnis des obigen Beispiels erhält man eine Variabel <font face="Courier New">Ergebnis</font> mit unbekanntem Datentyp, allerdings spielt dieser Datentyp auch keine große Rolle da wir mit diesem nun einfach arbeiten können. Visual Studio 2008 unterstützt uns hierbei mit Intellisense, so dass wir beispielsweise über <font face="Courier New">Ergebnis.Weiblich</font> abfragen können, ob es sich bei der aktuellen Person um eine Frau (<font face="Courier New">true</font>) oder einen Mann (<font face="Courier New">false</font>) handelt.</p>

<p>Wie man im letzten Beispiel sieht kann man die Erweiterungsmethoden natürlich auch kombinieren, im Beispiel die Bedingung (<font face="Courier New">Where</font>) mit einer Auswahl / Projektion (<font face="Courier New">Select</font>). Neben diesen beiden Erweiterungsmethoden gibt es noch zahlreiche andere, von denen ich im Folgenden ein paar wichtige kurz vorstellen möchte.</p>

<h3>Erweiterungsmethoden für λ-Ausdrücke im Namensraum System.Linq</h3>

<h4>Sortieren</h4>

<p>Mit Hilfe der Erweiterungsmethode <font face="Courier New">OrderBy()</font> können die einzelnen Elemente in eine neue Reihenfolge gebracht werden. Als Parameter übergibt man die Eigenschaft nach der die Sortierung erfolgen soll. Bei der Verwendung von <font face="Courier New">OrderBy()</font> wird immer aufsteigend (<em>ascending</em>) sortiert. Möchte man die Reihenfolge umdrehen, also absteigend (<em>descending</em>) sortieren, verwendet man stattdessen die Methode <font face="Courier New">OrderByDescending()</font>.</p>

<p>Für die Sortierung nach mehreren Kriterien, beispielsweise erst nach Alter und dann nach Nachname, gibt es weitere Erweiterungsmethoden: <font face="Courier New">ThenBy()</font> bzw. <font face="Courier New">ThenByDescending()</font>. </p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:a49f2adb-3206-44ca-b453-9ea6c38d4c6f" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nocontrols">List&lt;Person&gt; Adressbuch = PersonFactory.CreateRandomPeople( 100 );
var Ergebnis = Adressbuch.OrderByDescending( p =&gt; p.Age )
                         .ThenBy( p =&gt; p.LastName )
                         .ThenBy( p =&gt; p.FirstName );</pre></div>

<h4>Berechnungen</h4>

<p>Es gibt fünf vordefinierte Methoden um Berechnungen durchzuführen: <font face="Courier New">Count()</font>,<font face="Courier New"> Average()</font>, <font face="Courier New">Sum()</font>, <font face="Courier New">Min()</font> und <font face="Courier New">Max()</font>. Die Funktionsweise erschließt sich denke ich aus dem jeweiligen Namen, so dass wir direkt ein Beispiel einschieben bei dem man auch den Datentyp der Rückgabe sieht: </p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:6916f4ac-f16d-4ddb-a70f-83880744803f" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nocontrols">List&lt;Person&gt; Adressbuch = PersonFactory.CreateRandomPeople( 100 );
double Durchschnittsalter = Adressbuch.Average( p =&gt; p.Age );
int Gesamtalter = Adressbuch.Sum( p =&gt; p.Age );
int Hoechstalter = Adressbuch.Max( p =&gt; p.Age );
int JuengstesAlter = Adressbuch.Min( p =&gt; p.Age );
int AnzahlTeenager = Adressbuch.Count( p =&gt; p.Age &lt; 19 );</pre></div>

<p>Neben diesen vordefinierten Methoden gibt es allerdings auch noch eine allgemeine Aggregatfunktion die passenderweise<font face="Courier New"> Aggregate()</font> heißt und gleich mehrfach überladen ist. In einer einfachen Variante wird als erster Parameter ein Startwert erwartet, der für die folgenden Berechnungen herangezogen wird. Dementsprechend gibt diese Erweiterungsmethode auch den gleichen Datentyp zurück wie der dieses Startwertes. Als zweiten Parameter erwartet die Methode das jeweils nächste Element der Liste (in unserem Beispiel also vom Typ Person). Wir wollen nun in einem Beispiel die Methode Sum() nachbilden: </p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:5b48ae80-7cbe-4dce-b267-f73bc6ac228a" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nocontrols">List&lt;Person&gt; Adressbuch = PersonFactory.CreateRandomPeople( 100 );
int GesamtalterMitAggregat = Adressbuch.Aggregate( 0, ( ergebnis, naechster ) =&gt; ergebnis += naechster.Age );</pre></div>

<p>Der Startwert wurde hier auf 0 gesetzt, <font face="Courier New">ergebnis</font> ist folglich vom Datentyp <font face="Courier New">int</font>. Die Variabel <font face="Courier New">naechster</font> ist vom Typ <font face="Courier New">Person</font> und stellt jeweils das nächste Element der Liste da. Innerhalb unserer Lambda-Expression sind beliebige Berechnungen möglich so daß die Methode <font face="Courier New">Aggregat()</font> ein enormes Potential bietet.</p>

<h4>Wiederholungen löschen</h4>

<p>Bei einigen Abfragen gilt es redundante Informationen aus dem Ergebnis auszufiltern. Wenn wir beispielsweise alle Orte wissen wollen, in denen Personen aus unserem Adressbuch leben, dann würden viele Orte mehrfach auftauchen. Um die unnötigen Wiederholungen aus der Ergebnisliste zu löschen kann man die Methode <font face="Courier New">Distinct()</font> verwenden, die die meißten vermutlich auch aus dem Sprachrepertoire von SQL kennen. Um die doppelten Einträge rauszufinden verwendet die Erweiterungsmethode ohne Übergabeparameter den Standartvergleich, sofern ein solcher existiert. Alternativ kann man auch als Parameter ein Objekt übergeben, das das generische Interface <font face="Courier New">IEqualityComparer&lt;T&gt;</font> implementiert. Zu diesem gehören die beiden Methoden <font face="Courier New">Equals()</font> und <font face="Courier New">GetHashCode()</font>, die von <font face="Courier New">Distinct()</font> auch beide für den Vergleich herangezogen werden. Möchte man also nur eine der beiden Implementierungen verwenden, kann die jeweils andere Methode immer <font face="Courier New">true</font> (oder einen beliebigen anderen, aber immer identischen Wert) zurückgeben. Um nun also eine Liste mit allen Wohnorten zu erhalten müssen wir zuvor eine eigene Implementierung von <font face="Courier New">IEqualityComparer</font> schreiben. Dabei können wir natürlich auf bereits implementierte Vergleichsmethoden, beispielsweise von der Klasse <font face="Courier New">string</font>, zurückgreifen: </p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:120e1ca9-7f96-48a8-893f-15b8de5653e8" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nocontrols">class WohnortVergleich : IEqualityComparer&lt;Person&gt; {
  public bool Equals( Person a, Person b ) {
    return a.City.Equals( b.City );
  }

  public int GetHashCode( Person p ) {
    return Convert.ToInt32( p.ZIP );
    // Alternativ: return -1;
  }
}</pre></div>

<p>Die eigentliche Ausgabe unter Verwendung von <font face="Courier New">Distinct()</font> kann dann wiefolgt realisiert werden: </p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:a2a99bae-cfc1-4485-ac8d-a811cacfff01" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nocontrols">List&lt;Person&gt; Adressbuch = PersonFactory.CreateRandomPeople( 100 );
List&lt;string&gt; Wohnorte = Adressbuch.Distinct( new WohnortVergleich() )
                                  .Select( p =&gt; p.City );</pre></div>

<h4>Weitere Erweiterungsmethoden</h4>

<p>Mit den wenigen hier vorgestellten Erweiterungsmethoden aus dem Namensraum System.Linq hat man noch lange nicht alle Möglichkeiten ausgeschöpft. So gibt es beispielsweise noch Methoden zur Quantifizierung (<font face="Courier New">All()</font>, <font face="Courier New">Any()</font>, <font face="Courier New">Contains()</font>), zur Gruppierung von Abfragen (<font face="Courier New">GroupBy()</font>) und zur Verknüpfung mehrerer Listen (<font face="Courier New">Join()</font>) die ich hier aber nicht alle im Detail vorstellen kann. Hier verweise ich auf andere Artikel und die <a href="http://msdn.microsoft.com/de-de/library/system.linq.enumerable_methods.aspx" target="_blank">msdn C#-Sprachreferenz</a>.</p>

<h3>Fazit</h3>

<p>Das Prinzip, das hinter den Lambda-Ausdrücken steckt, ist nicht ganz neu. Auch in C# 2.0 kannte man Delegaten und konnte mit entsprechenden Aufwand Listen sortieren und filtern. Die Lambda-Ausdrücke reduzieren die notwendige Tipparbeit aber auf ein Minimum und sind vom Syntax mit den zahlreichen Erweiterungsmethoden deutlich vereinfacht worden. So muß man sich keine Gedanken mehr darum machen, wie man eine Sortierung für eine Liste implementiert sondern verwendet einfach Methoden die an die gängigen Bezeichnungen des SQL-Syntax angelehnt sind und dem Programmierer so das Leben ein gutes Stück einfacher machen.</p>

<p>In diesem zweiten Abschnitt wurde auch deutlich wieso die Einführung der Erweiterungsmethoden notwendig geworden ist. Erst in der Kombination von Erweiterungsmethode und der dazugehörigen anonymen Methode können die Lambda-Ausdrücke ihr volles Potential entfalten. Das heißt aber nicht, das sie auf diese Abfragen beschränkt sind. Überall wo ein Delegat zum Einsatz kommt, beispielsweise bei einem Event, lassen sich die anonymen Methoden auch mittels einer Lambda-Expression beschreiben. Sie sind deshalb eine Bereicherung für jeden Programmierer wenn man sich denn zuvor auf das Konzept, das dahinter steht, einlässt.</p>

<h2>Quellennachweise</h2>

<ul>
  <li><a title="" href="http://msdn.microsoft.com/de-de/library/bb311043.aspx" target="_blank">msdn C#-Sprachreferenz: where-Klausel</a> </li>

  <li><a href="http://www.addison-wesley.de/main/main.asp?page=aktionen/bookdetails&amp;ProductID=163410" target="_blank">Addison Wesley Buch: Visual C# 2008, Frank Eller (ISBN: 978-3-8273-2641-6)</a> </li>

  <li><a href="http://msdn.microsoft.com/de-de/library/bb383815.aspx" target="_blank">msdn Visual C# Developer Center: Neues bei Visual C#</a> </li>
</ul>
