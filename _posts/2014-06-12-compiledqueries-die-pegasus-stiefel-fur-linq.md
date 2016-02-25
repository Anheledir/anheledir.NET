---
layout: post
title: CompiledQueries – Die Pegasus-Stiefel für LINQ
date: 2014-06-12 21:44
author: Gordon Breuer
comments: true
categories: [Development, Fachartikel, linq c#]
---
<strong>Der nachfolgende Artikel wurde vor zwei Jahren in der Visual Studio One veröffentlicht und ich habe zum Thema auch schon ein paar Vorträge gehalten. Da ich neulich erneut darauf angesprochen wurde, habe ich mich für eine Veröffentlichung hier im Blog entschlossen.</strong>

Mit der Einführung der Language Integrated Queries (kurz: LINQ) vor einigen Jahren hat Microsoft das .NET-Framework um eine universelle Abfragesprache für alle nur denkbaren Datenquellen bereichert. Zwar konnte man alles, was LINQ kann auch schon vorher – irgendwie – realisieren, aber jetzt ist es deutlich kompakter und gleichzeitig lesbarer geworden. Doch wo Licht ist, da ist auch Schatten: Vor allem bei der Verwendung von LINQ mit dem Entity Framework oder auch mit LINQ2SQL machen sich einige Probleme mit der Performance bemerkbar.
<h2><b>Woher der Engpass?</b></h2>
Um die Performance zu erhöhen muss zunächst geklärt werden, wo der Engpass entsteht. Dafür ist es notwendig, einen Blick unter die Motorhaube zu werfen und sich mit der Funktionsweise von LINQ in Verbindung mit dem Entity Framework auseinander zu setzen. Zunächst einmal werden die LINQ-Abfragen in Lambda-Ausdrücke umgewandelt, und diese werden wiederum als so genannte Ausdrucksbäume (engl: Expression-Trees) interpretiert. Erst als letzter Schritt wird hieraus dann beispielsweise eine SQL-Anweisung erzeugt und an die Datenbank geschickt. Diese Umwandlungen müssen bei jedem Aufruf der LINQ-Abfrage erneut durchgeführt werden, was schließlich zu dem beschriebenen Geschwindigkeitsproblemen führt.
<h2><b>Es geht auch schneller</b></h2>
Immer wenn Vorgänge unnötig oft wiederholt werden müssen, sollte ein Entwickler hellhörig werden. Wenn man in einer Schleife beispielsweise 10.000 LINQ-Abfragen gegen eine Datenbank schreibt, dann verändert sich das Query jedes Mal nur minimal. Dennoch muss die komplette Umwandlung bei jedem Durchlauf erneut vorgenommen werden. Wesentlich effizienter wäre es also, wenn man die LINQ-Abfrage nur einmal in die entsprechende SQL-Abfrage umwandelt, und dann in jeder Iteration nur noch den variablen Teil beispielsweise des WHERE-Schlüsselwortes anpasst. Die Klasse, die uns genau das im .NET-Framework seit Version 3.5 ermöglicht, heißt CompiledQuery und findet sich im Namensraum <strong>System.Data.Linq</strong>. Hier heißt die statische und einzige wirklich benötigte Methode <em>Compile&lt;TArg0, …, TResult&gt;(Expression&lt;Func&lt;TArg0, …, TResult&gt;&gt;)</em>.

Der erste Parameter ist der Objekt-Kontext für den Datenzugriff, bsp.vomEntity Framework oder von LINQ2SQL. Der letzte übergebene Parameter ist der Typ des Rückgabewertes. Alle weiteren Parameter dazwischen sind optional und können zum Beispiel innerhalb einer where-Abfrage verwendet werden. In Version 3.5 des .NET-Frameworks und in der Silverlight-Untermenge stehen hier noch bis zu drei weitere Parameter als überladene Methode zur Verfügung. Wenn man mehr benötigt, muss man auf eine einfache Helferklasse zurückgreifen, in der man zusätzliche Eigenschaften vorhält. Mit Version 4.0 des .NET-Frameworks hat sich die Anzahl der Überladungen deutlich erhöht, so dass nun sogar bis zu 15 weitere Parameter möglich sind.
<h2><b>Achtung: Statisch!</b></h2>
Ein häufiger Fehler beim Verwenden der vorkompilierten Abfragen ist die Verwendung analog zu den „einfachen“ Abfragen in einem instanziiertem Kontext. Der erste Aufruf eines Compiled Query dauert ein wenig länger als der direkte Aufruf, da der kompilierte Ausdruck erst noch zwischengespeichert wird. Verwendet man dies nun in einer nicht-statischen Klasse, kann der Vorteil des Zwischenspeicherns nicht greifen und die Abfragezeit verlängert sich dadurch sogar noch. Es empfiehlt sich deshalb, für die <em>CompiledQueries </em>eine eigene, statische Klasse anzulegen und hier die Abfragen als ebenso statische Delegaten.
<pre>public static class Queries {
    public static Func&lt;DataContext, id, IQueryable&lt;Personen&gt;&gt; PersonGeworbenVonId =
        CompiledQuery.Compile&lt;DataContext, id, IQueryable&lt;Personen&gt;&gt;(
        (dc, id) =&gt; from person in dc.Mitarbeiter
        where person.ReferrerId == id
        select person
    );
}</pre>
Der eigentliche Aufruf erfolgt dann über diese statische Klasse und der Übergabe aller benötigten Parameter:
<pre>var db = newMyDataContext();
for (inti = 0; i &lt; 20; i++) {
List&lt;Personen&gt; result = Queries.PersonGeworbenVonId(db, i).ToList();
/* ... arbeite hier mit result ... */
}</pre>
Beim ersten Durchlauf der Schleife wird unsere LINQ-Abfrage intern in sein entsprechendes SQL-Pendant umgewandelt und dieses anschließend als Funktion zwischengespeichert. Da der statische Kontext bis zur Beendigung der Anwendung (bei Websites bis zum Recyclen des App-Pools) erhalten bleibt, ist eine erneute Kompilierung des gleichen Queries danach nicht mehr notwendig. Für die folgenden 19 Durchläufe unserer Schleife ist die Verarbeitungsgeschwindigkeit also deutlich höher und kommt an die von der direkten Verwendung einer Abfrage mittels ADO.NET heran.

&nbsp;

[caption id="attachment_7146" align="aligncenter" width="606"]<a href="http://anheledirwp.blob.core.windows.net/wordpress/2014/06/ResReader.png"><img class="wp-image-7146 size-full" src="http://anheledirwp.blob.core.windows.net/wordpress/2014/06/ResReader.png" alt="CpmpiledQueries - Geschwindigkeitsvergleich" width="606" height="336" /></a> Abfragen von 3.000 Datensätzen aus einer Datenbank mit und ohne CompiledQueries[/caption]

<b></b><b>Einschränkungen</b>

Die größte Besonderheit des CompiledQuery ist sicherlich, dass man als Ergebnis eines Methodenaufrufes keinen Wert zurück bekommt sondern eine weitere Methode. Dem einen oder anderen ist diese Funktionsweise vielleicht auch schon aus Sprachen wie F# bekannt, im Umfeld von C# und VB.NET ist es jedoch eher selten zu sehen.

Das CompiledQuery sollte man jedoch nicht als Universalmittel verstehen. LINQ-Abfragen, die nur selten aufgerufen werden, profitieren nur wenig hiervon. Da der erste Aufruf länger dauert ist die Verwendung bei einmaligen Abfragen sogar kontraproduktiv. Auch relativieren die CompiledQueries die bessere Lesbarkeit von LINQ-Ausdrücken wieder, da man nun nur noch Aufrufe der statischen Queries-Klasse sieht. Erst wenn man die Definition des verwendeten Delegaten nachschlägt sieht man wieder den eigentlichen Abfrageausdruck. Da alle kompilierten Abfragen als statische Klasse zwischengespeichert werden, verbraucht die Anwendung natürlich auch mehr Arbeitsspeicher. Hier muss man also abwägen, ob der erreichbare Geschwindigkeitsvorteil groß genug ist, um dies in Kauf zu nehmen.

Der höhere Arbeitsspeicherverbrauch lässt sich am ehesten vermeiden, indem man aufwändige SQL-Abfragen direkt im Datenbankserver als Stored-Procedure abspeichert.Die CompiledQueries bieten sich aber immer dann an, wenn das Anlegen von Stored-Procedures im SQL-Server entweder nicht möglich oder auch nicht gewünscht ist, da mit ihnen die Anwendungslogik an völlig unterschiedlichen Stellen gepflegt werden muss. Kombinieren lassen sich beide Verfahren übrigens nicht: Der Aufruf einer Stored-Procedure innerhalb eines CompiledQueries führt zu einer Fehlermeldung.

Da die kompilierte Abfrage zwischengespeichert wird, muss man für alle weiteren Abfragen auf denselben Delegaten natürlich auch immer denselben Data-Kontext verwenden. Wird hier ein anderer Kontext übergeben, erhält man eine Fehlermeldung aufgrund der veränderten Instanz. Auch erhält man nach Aufruf des CompiledQueries ein one-time Enumerable zurück, da der Data-Kontext danach nicht länger zur Verfügung steht. Selbst das Verwenden der Count()-Methode sorgt in diesem Fall schon dafür, dass der nächste Aufruf fehlschlägt. Um das Problem zu umgehen empfiehlt es sich wie im obigen Beispiel angedeutet direkt nach dem Aufruf die ToList()-Methode auf das Ergebnis anzuwenden.
