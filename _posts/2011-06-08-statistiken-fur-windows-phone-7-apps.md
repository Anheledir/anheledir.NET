---
layout: post
section-type: post
title: Statistiken für Windows Phone 7 Apps
category: Unknown
tags: []
---
<p><img style="background-image: none; margin: 0px 0px 0px 10px; padding-left: 0px; padding-right: 0px; display: inline; float: right; padding-top: 0px; border: 0px;" title="5-SEM_Competitive_Analysis_2" src="http://anheledirwp.blob.core.windows.net/wordpress/2011/06/5-SEM_Competitive_Analysis_2.jpg" border="0" alt="5-SEM_Competitive_Analysis_2" width="183" height="137" align="right" />Wie jeder andere Entwickler auch m&ouml;chte nat&uuml;rlich auch der WP7-Entwickler gerne wissen, wie oft seine geschriebenen Anwendungen verwendet werden, von wem und von wo. Denn nur wer den Markt kennt, kann auch zielgerichtet f&uuml;r ihn entwickeln! Microsoft selber bietet hier nur eine sehr rudiment&auml;re Statistik im App-Hub an, die zudem auch nur zeitversetzt angezeigt wird. Die dort einsehbaren Nutzerzahlen sind bereits rund eine Woche alt und bilden zudem au&szlig;er der Info &ldquo;Free-App&rdquo;, &ldquo;Test-Version&rdquo; oder &ldquo;Gekauft&rdquo; nur noch das Land in dem es heruntergeladen wurde ab. Wer mehr wissen m&ouml;chte, oder auch einfach nur schneller, der muss folglich zu einer 3rd-Party L&ouml;sung greifen. Ein paar der wichtigsten sind:</p>
<ul>
<li>PreEmptive Solutions Runtime Intelligence Service (RIS)</li>
<li>Google Analytics</li>
<li>mtiks</li>
</ul>
<h2>PreEmptive Solutions RIS</h2>
<p><img style="background-image: none; padding-left: 0px; padding-right: 0px; display: block; float: none; margin-left: auto; margin-right: auto; padding-top: 0px; border: 0px;" title="ris_banner" src="http://anheledirwp.blob.core.windows.net/wordpress/2011/06/ris_banner.jpg" border="0" alt="ris_banner" width="405" height="81" />Dank einer Vereinbarung zwischen dem Hersteller PreEmptive Solutions und Microsoft steht das Analyse-Tool derzeit allen registrierten WP7-Entwicklern kostenlos zur Verf&uuml;gung. Zun&auml;chst zeitlich beschr&auml;nkt bis zum 31. M&auml;rz 2011 wurde zwischenzeitlich die Vereinbarung unbefristet verl&auml;ngert. Sollte der Service nicht mehr kostenlos zur Verf&uuml;gung stehen, werden die Entwickler 60 Tage vorher dar&uuml;ber in Kenntnis gesetzt. Dann jedoch w&uuml;rden selbst in der kleinsten &ldquo;Starter&rdquo;-Lizenz bereits 300$ / Monat f&auml;llig bei einer Beschr&auml;nkung auf maximal zwei Application IDs (eine pro App). Man muss also darauf hoffen, dass sich Microsoft und Preemptive Solutions noch lange gut vertragen.</p>
<p><a href="http://www.preemptive.com/know-more/windows-phone-7">Runtime Intelligence for Windows Phone 7</a></p>
<h2>Google Analytics</h2>
<p><img style="background-image: none; padding-left: 0px; padding-right: 0px; display: inline; float: left; padding-top: 0px; border: 0px;" title="google-analytics-logo" src="http://anheledirwp.blob.core.windows.net/wordpress/2011/06/google-analytics-logo.png" border="0" alt="google-analytics-logo" width="240" height="58" align="left" />Wer bereits eine Website mit Googles Analytics &uuml;berwacht, kennt die Oberfl&auml;che und die zur Verf&uuml;gung stehenden Werkzeuge vermutlich nur zu gut. Da liegt die Frage nat&uuml;rlich nahe, ob man nicht auch Infos seiner WP7-Apps hier verwalten kann. Und tats&auml;chlich: Ren&eacute; Schulte hat einen Artikel beschrieben, wie er genau das mit Hilfe des Silverlight Analytics Frameworks bewerkstelligt hat. Der Vorteil hier ist sicherlich die bekannte Oberfl&auml;che. Auch ist Google Analytics kostenlos und wird es auch mit an Sicherheit grenzender Wahrhscheinlichkeit dauerhaft bleiben. Der von Ren&eacute; gew&auml;hlte Ansatz ist ganz gut, f&uuml;r mich pers&ouml;nlich war er aber etwas zuviel Bastelei.</p>
<p>Googles Analysedienst ist nat&uuml;rlich nicht f&uuml;r native Mobile-Apps ausgelegt. Man hat hier aber selbstverst&auml;ndlich viele Freiheiten um die ben&ouml;tigte Informationen in beliebiger Form zusammen zu stellen und dann zu senden. Da das Silverlight Analytics Framework verwendet wird, ist das Protokollieren der Daten theoretisch nat&uuml;rlich nicht nur mit Google Analytics m&ouml;glich, sondern auch mit anderen unterst&uuml;tzten Services, derzeit:</p>
<ul>
<li>Google Analytics</li>
<li>Nedstat</li>
<li>Service Oriented Analytics</li>
<li>WebAnalysis.NET</li>
<li>Webtrends</li>
</ul>
<p><a href="http://kodierer.blogspot.com/2010/11/tracking-sales-statistics-with.html">Tracking Sales Statistics with the Silverlight Analytics Framework for WP7</a> <br /><a href="http://msaf.codeplex.com/">Microsoft Silverlight Analytics Framework</a></p>
<h2>mtiks</h2>
<p><img style="background-image: none; margin: 0px 10px 0px 0px; padding-left: 0px; padding-right: 0px; display: inline; float: left; padding-top: 0px; border: 0px;" title="logo_small" src="http://anheledirwp.blob.core.windows.net/wordpress/2011/06/logo_small.png" border="0" alt="logo_small" width="115" height="29" align="left" />Interessanterweise ist dieser Anbieter offenbar recht unbekannt, zumindest habe ich nur wenige Infos gefunden und die meisten mit denen ich &uuml;ber das Thema sprach kannten mtiks gar nicht, daher gebe ich hier ein paar ausf&uuml;hrlichere Informationen. Der Dienst ist f&uuml;r die reine Analyse kostenlos, und soll es auch bleiben. Lediglich f&uuml;r einige Zusatzdienste kann man bei Bedarf monatlich so genannte &ldquo;Premium-Pakete&rdquo; kaufen. Derzeit gibt es f&uuml;r Windows Phone 7 nur das Zusatzpaket &ldquo;WP7 Exceptions&rdquo;, mit dessen Hilfe man protokollierte Fehler in der Weboberfl&auml;che einsehen und analysieren kann. Das Feature ist derzeit noch in der Beta-Phase und solange auch kostenlos verwendbar.</p>
<p>Die Oberfl&auml;che ist eher schlicht gehalten und stellenweise l&auml;uft es manchmal auch nicht ganz rund. So kann man zwar beliebig viele Anwendungen anlegen und auch umbenennen, jedoch habe ich bisher keine M&ouml;glichkeit gefunden eine Anwendung auch wieder zu l&ouml;schen. Man kann f&uuml;r die Anzeige der Zeiten die eigene Zeitzone wohl einstellen, jedoch reagiert diese Option bei mir nicht. Beides sind aber jetzt keine wirklich schwerwiegenden Probleme, wenn auch gelegentlich ein wenig nervig. Das Einbinden des SDK geht mit wenigen Codezeilen in der App.xaml.cs schnell von der Hand, inklusive dem Protkollieren von unbehandelten Exceptions. M&ouml;chte man keine benutzerdefinierten Daten protokollieren, kann man nach dem ersten Starten der Anwendung die Ergebnisse in der Weboberfl&auml;che in Echtzeit verfolgen. Einige der abfragbaren Informationen sind:</p>
<ul>
<li>Total Sessions</li>
<li>Total Unique Devices</li>
<li>Sessions by App Version</li>
<li>User Loyalty</li>
<li>Sessions by Device Groups</li>
<li>Sessions by Device Models</li>
<li>Sessions by Countries</li>
<li>Sessions by OS Version</li>
</ul>
<p>Zus&auml;tzlich lassen sich beliebige zus&auml;tzliche Events protokollieren. Die hierdurch gesammelten Daten k&ouml;nnen sowohl grafisch als auch tabellarisch im Web angesehen oder als CSV exportiert werden. Neben dem reinen Auftreten eines Events lassen sich auch noch eigene Eigenschaften und Werte protokollieren.</p>
<p>L&auml;sst man aufgetretene Exceptions mitprotokollieren und hat das Zusatzpaket &ldquo;WP7 Exceptions&rdquo; gebucht, erh&auml;lt man auch eine grafische Auswertung, wieviele Ausnahmen wann aufgetreten sind. Auch kann man in einer tabellarischen Auflistung sehen, welche Art von Fehler wie oft auftrat. Auch die Details einzelner Fehler lassen sich abrufen sofern sie denn von der eigenen App &uuml;bermittelt wurden.</p>
<p><a href="http://www.mtiks.com/">mtiks</a> <br /><a href="http://cid-05e2b49731ef1d07.photos.live.com/play.aspx/MTIKS%20Sample%20Pics?ref=1">Bilder-Galerie mtiks-Dashboard</a> (App: XDA Wallpaper)</p>
<h2>Pers&ouml;nliches Fazit</h2>
<p>Da mir die Situation bei PreEmptive Solutions zu unsicher ist (<em>bleibt es nun kostenfrei oder wird man eines Tages, wenn eine Umstellung f&uuml;r die Entwickler erst mal zu komplex wird, bluten m&uuml;ssen?)</em> fiel deren L&ouml;sung f&uuml;r mich von Anfang an weg. Der Ansatz mit dem Silverlight Analytics Framework w&auml;re noch interessant, allerdings erst wenn auch &ldquo;Piwik&rdquo; unterst&uuml;tzt wird. Aber das mag auch nur meine pers&ouml;nliche, subjektive Abneigung gegen Google sein. <img class="wlEmoticon wlEmoticon-winkingsmile" style="border-style: none;" src="http://anheledirwp.blob.core.windows.net/wordpress/2011/06/wlEmoticon-winkingsmile.png" alt="Winking smile" /></p>
<p>Seit nunmehr einem halben Jahr arbeite ich mit mtiks und seit dem wurde die Weboberfl&auml;che und das SDK stetig weiter entwickelt. Selbst wenn es noch nicht &uuml;berall ganz rund aussieht verspricht die andauernde Entwicklung doch viel Gutes. Die sehr schnelle und einfache Implementierung in das eigene Projekt gef&auml;llt mir dabei ebenso gut wie das Einsehen der Daten in Echtzeit. Werden neben den schon recht umfangreichen Statiken noch app-spezifische Daten ben&ouml;tigt lassen diese sich auch problemlos mit einer Zeile Code schnell einbinden und ebenso bequem wie die Default-Daten auswerten.</p>
<p>Wer ohne viel Aufwand noch nach einer Analyse-M&ouml;glichkeit f&uuml;r seine Windows Phone 7 App sucht, sollte sich mal mtiks n&auml;her ansehen. Die jeweils aktuelle Version des SDK ist im &uuml;brigen auch &uuml;ber <a href="http://nuget.org/List/Packages/mtiks">NuGet verf&uuml;gbar</a>.</p>
