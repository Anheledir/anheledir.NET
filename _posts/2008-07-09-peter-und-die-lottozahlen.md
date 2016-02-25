---
layout: post
section-type: post
title: Peter und die Lottozahlen
category: Unknown
tags: []
---
<p>Vor ein paar Tagen hat eine <a href="http://www.wer-kennt-wen.de/person.php?id=krmes9ti" target="_blank">Arbeitskollegin</a> ein mathematisches Rätsel in mein Gästebuch bei <a href="http://www.wer-kennt-wen.de/person.php?id=wedw881b" target="_blank">wer-kennt-wen.de</a> geschrieben:</p>  <blockquote>   <p>Peter träumte wieder einmal vom großen Geld. Er stellte sich gerade vor, sechs richtige im Lotto zu haben, als es plötzlich hell aufblitzte. Eine Märchenfee stand vor ihm und sagte: &quot;<em>Du hast einen Wunsch frei.</em>&quot; Ohne zu zögern reichte Peter ihr ein Stück Papier und einen Stift. &quot;<em>Wie wär's, wenn du mir die Lottozahlen von nächster Woche hier aufnotierst?</em>&quot;, meinte er.       <br />&quot;<em>Alle sechs Lottozahlen.</em>&quot;, sagte die Fee erstaunt, &quot;<em>Das sind ja gleich sechs Wünsche auf einmal, also das geht nun wirklich nicht.</em>&quot;</p>    <p>Dennoch notierte die Fee eine Zahl auf dem Zettel und sagte: &quot;<em>Wenn du alle sechs Lottozahlen von nächster Woche zusammenaddierst, dann kommst du auf dieses Ergebnis!</em>&quot; Peter sah sich die Zahl an und überlegte. &quot;<em>Oh Gott, da gibt es sicher tausende Möglichkeiten mit sechs verschiedenen Zahlen zwischen 1 und 49 auf diese Summe zu kommen</em>&quot;, meinte er resigniert. &quot;<em>OK, ich geb' dir noch einen Tipp.</em>&quot;, sagte die Fee, &quot;<em>Rechne doch mal genau aus, wieviele Möglichkeiten es gibt, die diese Summe ergeben. Wenn du das Ergebnis dann mit der Zahl malnimmst, die ich dir eben aufgeschrieben habe, dann erhältst du eine sehr große Zahl von einigen Millionen, und diese Zahl kommt auch raus, wenn man alle sechs Lottozahlen miteinander malnimmt.</em>&quot;</p>    <p>Peter wollte sich gerade für den Tipp bedanken, als die Fee auch schon wieder verschwand. Nun begann er zu rechnen, und bei der nächsten Lottoziehung hatte er tatsächlich sechs Richtige. Welche sechs Zahlen wurden gezogen?</p> </blockquote>  <p>Jemand wie <a href="http://www.algorithman.de/" target="_blank">Algorithman</a> würde jetzt eventuell eine mathematische Formel bereitstellen können, mit der man das ganze hoch-wissenschaftlich und mathematisch-genau berechnen kann. Ich bin da ein wenig pragmatischer und verwende lieber die Holzhammermethode: Einfach alle möglichen Zahlenkombinationen durchgehen!</p>  <p>Da ich aber die nächsten Monate auch noch besseres zu tun habe hier ein kleines C#-Programm, dass einem diese Arbeit abnimmt:</p>  <div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:7ea5f7ba-b937-4584-b1ed-62d69ffafa60" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:collapse:showcolumns">using System;

namespace Anheledir {
  class Program {
    static void Main( string[] args ) {
      var possibilities = new int[280];
      int total, product;

      for ( var n1 = 1; n1 &lt;= 49; n1++ ) {
        for ( var n2 = n1 + 1; n2 &lt;= 49; n2++ ) {
          for ( var n3 = n2 + 1; n3 &lt;= 49; n3++ ) {
            for ( var n4 = n3 + 1; n4 &lt;= 49; n4++ ) {
              for ( var n5 = n4 + 1; n5 &lt;= 49; n5++ ) {
                for ( var n6 = n5 + 1; n6 &lt;= 49; n6++ ) {
                  total = n1 + n2 + n3 + n4 + n5 + n6;
                  possibilities[total]++;
                }
              }
            }
          }
        }
      }

      for ( var n1 = 1; n1 &lt;= 49; n1++ ) {
        for ( var n2 = n1 + 1; n2 &lt;= 49; n2++ ) {
          for ( var n3 = n2 + 1; n3 &lt;= 49; n3++ ) {
            for ( var n4 = n3 + 1; n4 &lt;= 49; n4++ ) {
              for ( var n5 = n4 + 1; n5 &lt;= 49; n5++ ) {
                for ( var n6 = n5 + 1; n6 &lt;= 49; n6++ ) {
                  total = n1 + n2 + n3 + n4 + n5 + n6;
                  product = n1 * n2 * n3 * n4 * n5 * n6;
                  if ( possibilities[total] * total == product ) {
                    Console.WriteLine( "=&gt; {0}, {1}, {2}, {3}, {4}, {5}", n1, n2, n3, n4, n5, n6 );
                    Console.WriteLine( "   total: {0}, product: {1}", total, product );
                  }
                }
              }
            }
          }
        }
      }

      Console.Write( Environment.NewLine + "Press any key to continue..." );
      Console.ReadKey();
    }
  }
}</pre></div>