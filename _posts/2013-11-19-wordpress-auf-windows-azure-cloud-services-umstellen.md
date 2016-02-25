---
layout: post
title: WordPress auf Windows Azure Cloud-Services umstellen
date: 2013-11-19 19:38
author: Gordon Breuer
comments: true
category: Cloud, Werkzeugkiste, WWWahnsinn
---
<img class="size-full wp-image-6851 alignleft" style="margin-right: 10px; margin-bottom: 10px;" alt="Wordpress on Windows Azure" src="http://anheledirwp.blob.core.windows.net/wordpress/2013/11/Wordpress-on-Azure.png" width="180" height="180" />Der <a title="Blog und Piwik wieder erreichbar" href="http://gordon-breuer.de/2013/11/blog-und-piwik-wieder-erreichbar/">letzte Ausfall meines virtuellen Linux-Servers</a> auf dem unter anderem die Wordpress-Installation meines Blogs lief war schon etwas lästig und gab mir zu denken. Mir blieben die folgenden Handlungsmöglichkeiten:
<ol>
	<li>Nichts weiter unternehmen und hoffen, dass Linux in naher Zukunft nicht erneut rumzickt</li>
	<li>Meine Linux-Kenntnisse wieder soweit auffrischen, dass ich das Problem dort wo es entstand lösen kann</li>
	<li>Wordpress auf einen Windows-Server umziehen, den ich notfalls auch im schlaf administrieren kann</li>
	<li>Gar nicht mehr selber hosten sondern Webspace für das Blog anmieten</li>
</ol>
Normalerweise würde mich ja der Ehrgeiz packen um meine Linux-Kenntnisse wieder zu verbessern. Aber eigentlich habe ich dafür gar keine Zeit und im Grunde bin ich so in der Windows-Welt zu Hause, dass ich auch nicht zwingend einen Linux-Server benötige. Er war nur damals einfach die günstigste Alternative. Aber eigentlich fehlt mir auch die Zeit, mich um einen Server unter Windows zu kümmern - regelmäßige Updates, Backups, Wartung, das korrekte Einrichten, ... früher habe ich das ständig auch beruflich gemacht, da war ein eigener Server mehr oder weniger nicht so viel mehr Arbeit.

Bleibt im Grunde also nur das Fremd-Hosten übrig. Da ich noch ein kleines Azure-Abonement habe fiel mein Blick als erstes dorthin. Immerhin kann ein wenig mehr Erfahrung mit den Azure-Services nicht schaden, in Zukunft wird meiner Meinung nach immer stärker auf SaaS und PaaS gesetzt werden. Außerdem klingt es reizvoll wenn mein Blog hinterher voll skalierbar ist falls aus den 120 Besuchern pro Tag irgendwann mal 120.000 werden ;-)
<h2>Cloud-Services vs. Standard-Hosting</h2>
Als Grundlage sollen die Azure Websites dienen. Diese gibt es in den drei Varianten "kostenlos", "freigegeben" und "standard". Die kostenlose Variante entfällt für mich, da man hier keine eigenen Domains hinterlegen kann. Standard bietet einem am meisten Möglichkeiten, allerdings steckt hier ein eigener Server dahinter auf dem das Web betrieben wird. Das macht die Website recht teuer (&gt;50€ Monat). Fairerweise muss man dazu sagen, dass auf diesem Server auch noch weitere Websites laufen können. Bei der "freigegebenen" Variante teilt man sich den dahinter stehenden Webserver mit anderen Websites, die man nicht selbst beeinflussen kann. Dadurch gibt es einige Einschränkungen der Ressourcen, bsp. maximal 512MB Arbeitsspeicher pro Stunde. Überschreitet das Web einen Grenzwert, wird die Seite deaktiviert und man bekommt beim Aufrufen eine Standard-Seite von Windows Azure angezeigt. Die freigegebene Variante kostet immerhin noch knapp 12€ im Monat pro Instanz.

An den Preisen sieht man recht schnell: Das Betreiben einer Website in der Cloud ist alles andere als günstig. Was bekommt man also dafür: Eine sehr hohe Ausfallsicherheit, automatische Backups durch den Anbieter, Replikation auf geographisch günstige Rechenzentren und eine freie Skalierbarkeit mit wenigen Mausklicks, auf Wunsch auch automatisiert aufgrund der tatsächlichen Nutzlast. Solange also nur einige tausend Besucher pro Tag auf der Website vorbeischauen genügt eine einzelne Instanz. Wird dann bsp. durch eine virale Aktion oder durch das Posten eines Artikels auf Slashdot, Reddit, ... eine plötzlich deutlich höhere Nutzung festgestellt, schalten sich automatisch weitere Instanzen dazu und die Seite bleibt dennoch performant. Dabei wird auch nur für genau die Zeit, in der diese Instanzen notwendig und zugeschaltet sind, die zusätzliche Leistung berechnet. Sinkt die Last wieder schalten sich die Instanzen wieder ab bzw. man skaliert manuell wieder nach unten; Cloud-Services sind quasi das Stundenhotel des Webhostings, allerdings mit Luxus-Services und -Preisen.

Wenn keine dieser Möglichkeiten eine echte Praxisrelevanz hat - wie es für die meisten privaten bzw. nicht-kommerziellen Websites gelten dürfte - ist die Verwendung von Azure die sprichwörtliche Kanone mit der man auf die Spatzen schießt. Hier reicht das 08/15-Hosting bei einem der zahlreichen Provider.
<h2>Wordpress installieren</h2>
<a href="http://anheledirwp.blob.core.windows.net/wordpress/2013/11/Screenshot-24.png"><img class="alignright" style="margin-left: 10px; margin-bottom: 10px;" alt="Brandoo WordPress" src="http://anheledirwp.blob.core.windows.net/wordpress/2013/11/Screenshot-24-e1384889629883-300x197.png" width="300" height="197" /></a>Die eigentliche Arbeit beim Einrichten der Azure Website und der Wordpress-Installation wird uns von einem Assistenten abgenommen: Beim Neuanlegen einer Webseite wählen wir als Option den Katalog aus. Hier finden sich zahlreiche Software-Pakete, die für die automatisierte Installation unter Windows Azure vorbereitet wurden. Unter anderem ist hier auch Wordpress bei, jedoch sollte man nicht das Standard-Paket wählen: Hier wird eine MySQL-Datenbank für die Datenhaltung verwendet, die Azure von Haus aus nicht anbietet. Stattdessen erhält man eine 20MB große MySQL-Datenbank bei einem Drittanbieter kostenlos, die automatisch mit eingerichtet wird. Allerdings läuft dann die komplette Administration und auch Abrechnung unabhängig von Azure. Viel schöner wäre es doch, wenn man Wordpress überreden könnte, stattdessen eine Azure SQL-Datenbank zu verwenden, oder?

Genau das hat sich auch die Firma Brandoo gedacht und ein entsprechend angepasstes Installations-Paket in den Azure-Katalog bereitgestellt. Unter "Brandoo WordPress (MS SQL or Azure SQL)" ist es zu finden und die Einrichtung ist mit drei einfachen Konfigurationsschritten schnell abgeschlossen. Für den Anfang reicht es, wenn man die kostenlose 20MB Azure-SQL Datenbank verwendet. Wird der Platzbedarf später doch einmal größer kann man immernoch auf eine kostenpflichtige DB mit beispielsweise 1GB Platz buchen (etwa 8€ / Monat).

Nach der Einrichtung kann man direkt die zum Web dazugehörige Subdomain aufrufen und WordPress meldet sich mit einer weiteren Konfigurationsseite. Hier gibt man noch den Namen des Blogs sowie seine eigenen Zugangsdaten ein, und danach ist das WordPress-Blog unter Windows Azure auch schon fertig aufgesetzt! Es empfiehlt sich jetzt als erstes im WordPress-Dashboard die verfügbaren Updates zu installieren, vor allem das der WordPress-Installation. Das sowie alle weiteren Einstellungen sind nun Standard und im Grunde ist die Installation unter Azure auch schon fertig.
<h2>Medien in Azure speichern</h2>
Bisher läuft unsere Website und unsere Datenbank sauber getrennt in je eigenen Cloud-Diensten. Doch wenn wir jetzt Dateien wie Bilder und Dokumente in die Medienbibliothek von WordPress hochladen, landen diese im gewohnten Upload-Verzeichnis des Blogs. Das ist nicht ganz so schön, da die Dateien hier für jede Instanz unserer Website mit repliziert werden müssen. Auch geht es zu Lasten unseres Speicher-Quotas der Website. Eigentlich wäre es doch schön, die Medien-Dateien bzw. Attachments ebenfalls auszulagern wie auch schon die Datenbank.

Hierfür gibt es in Azure den so genannten Blob-Speicher, den wir ebenfalls replizieren und mit Hilfe eines CDN geographisch optimal in der Nähe unsere Besucher ausspielen können. Müssen wir WordPress also nur noch dazu überreden, dass es einen solchen Blob-Speicher verwendet statt dem lokalen Dateisystem. Zum Glück gibt es genau hierfür bereits ein Plugin:

[appbox wordpress windows-azure-storage]

Die Installation und Einrichtung ist recht simpel und dank der Beschreibung auch schnell gemacht.
<h2>Beiträge und Bilder importieren</h2>
Nach dem die neue WordPress-Installation fertig eingerichtet war konnte ich also anfangen den eigentlichen Inhalt vom ursprünglichen Blog zu kopieren. Zunächst wollte ich es mit einem der zahlreichen Backup-Plugins versuchen, doch die meisten scheiterten beim Wiederherstellung der Sicherung und viele zerschossen dabei die Einträge in der Datenbank so sehr, dass ich diese nur durch eine erneute Installation von WordPress reparieren konnte.

Das Problem liegt in der Art und Weise, wie WordPress zur Zusammenarbeit mit Azure-SQL überredet wurde::

[appbox wordpress wordpress-database-abstraction]

Durch diese neue Abstraktionsschicht werden die Befehle, die WordPress an MySQL senden möchte, in ihr entsprechendes MS-SQL Äquivalent transformiert. Die Basis von beidem ist zwar TSQL, aber jeder Hersteller hat für die optimale Unterstützung "seiner" Features seit jeher einen ganz eigenen Dialekt, der sich vor allem in vielen kleinen Details bemerkbar macht. Durch die DB-Abstraktionsschicht werden zwar die meisten Standardbefehle korrekt umgewandelt und übersetzt, jedoch eben nicht alle Besonderheiten. Greift ein Plugin / Script zudem direkt auf die Datenbank zu, ohne die hierfür von WordPress bereitgestellten Schnittstellen, scheitert die Kommunikation in der Regel komplett da eben diese Transformation nicht durchgeführt wird.

[caption id="attachment_6858" align="alignright" width="300"]<a href="http://anheledirwp.blob.core.windows.net/wordpress/2013/11/Screenshot-25-e1384892148588.png"><img class="size-medium wp-image-6858 " style="margin-left: 10px; margin-bottom: 10px;" alt="Visual Studio Online &quot;Monaco&quot; mit geöffneter .user.ini für das Erhöhen der erlaubten Upload-Größe" src="http://anheledirwp.blob.core.windows.net/wordpress/2013/11/Screenshot-25-e1384892148588-300x136.png" width="300" height="136" /></a> Visual Studio Online "Monaco" mit geöffneter .user.ini für das Erhöhen der erlaubten Upload-Größe[/caption]

Die Lösung war dann - verglichen mit dem Problem - zunächst recht einfach: Alle Daten mit den WordPress eigenen Werkzeugen exportieren und dann einfach auf der neuen Installation wieder importieren. Aber das ist unter Umständen einfacher gesagt als getan: Mein Export war beinahe 4MB groß. Eigentlich nicht viel, aber die Website von Windows Azure hat standardmäßig eine Begrenzung von 2MB für den PHP-Upload! Unter Linux (da isses wieder!) würde ich eine entsprechend angepasste Konfiguration in Form einer php.ini in das Root-Verzeichnis von WordPress erstellen und so die Upload-Größe erhöhen. Aber mein Versuch das auch hier zu machen brachte ... nichts.

Jetzt könnte ich einfach den Export in mehrere kleine Dateien machen und diese nacheinander hochladen, aber ich brauche für Plugins und das Hochladen von Anhängen trotzdem mehr als die eher mickrigen 2MB. Einiges an Recherche später habe ich dann die Lösung gefunden: Die Datei muss unter Azure ".user.php" heißen (wichtig: mit vorangestelltem Punkt!).

Was bei mir jedoch weiterhin nicht ordentlich funktionierte war das Importieren der Medien, vor allem der in den Beiträgen eingebettete Bilder. Diese wurden zwar importiert und auch dank dem oben genannten Plugin in den Azure Blob-Speicher abgelegt, jedoch wurden die Beiträge nicht angepasst - die Bild-URLs zeigten also noch auf das alte Upload-Verzeichnis. Auch hier folgte wieder mehrmaliges Probieren und Experimentieren, was einige an den Twitter- und Facebook-Meldungen mit "neuen Blog-Artikeln" gemerkt haben dürften. Tipp an alle: Deaktiviert eventuelle Services wie IFTTT, die Neuigkeiten aus eurem RSS-Feed in die Socal-Services posten. ;-)

Mein Lösungsweg war schließlich, beim eigentlichen Import der Daten die Medien außen vor zu lassen. Die Bild-URLs in den Beiträgen zeigten nun weiterhin auf die ursprüngliche URL. Danach bemühte ich ein weiteres Plugin:

[appbox wordpress media-tools]

Die Media Tools können u.a. alle Beiträge nach Bild-URLs überprüfen, und diese dann in die eigene Medienbibliothek importieren. Anschließend wird die URL des Bildes im Beitrag noch angepasst.

Soweit so gut, jedoch konnte das Plugin nicht in einem Durchgang alle Beiträge bearbeiten. Vermutlich gab es intern einen Timeout. Da vor dem Herunterladen und Importieren in die Medienbibliothek überprüft wird, ob das Bild schon lokal vorhanden ist, sollte es kein Problem sein das Script mehrfach hintereinander zu starten bis es fertig ist. Doch natürlich sollte es nicht ganz so einfach sein: Die Überprüfung, ob das Bild schon importiert und im Beitrag ausgetauscht wurde, verlässt sich darauf, dass die Bild-URL den gleichen Host hat wie die Seite. Dummerweise ist das bei den Bildern, die im Blob-Speicher liegen, nicht der Fall wenn man keinen CNAME mit der eigenen Domain verwendet hat. Das Script hat also alle Bilder brav erneut heruntergeladen - dieses mal von Azure statt vom alten Blog - und sie dann ein weiteres mal importiert. Mir blieb also nichts anderes übrig, als das Plugin ein wenig anzupassen: In der Liste der installierten Plugins geht man auf den "Bearbeiten"-Link des Media Tool-Plugins. In der Methode "extract_multi" habe ich dann unter die Definition von $path noch eine weitere Variabel eingefügt: "<strong>$pathcdn = 'core.windows.net';</strong>". Unter die if-Abfrage, ob der Pfad des Bildes mit dem lokalen Host identisch ist, kommt dann noch die zweite Abfrage:

<strong>if (  stripos( $img, $pathcdn ) !== false ) {
$response .= 'Img already in media library and CDN&lt;br&gt;';
continue;
}</strong>

Vielleicht nicht die eleganteste Lösung, aber genau wie meine praktische Erfahrung mit Linux schon einige Jahre alt ist habe ich zuletzt vor über 10 Jahren PHP selbst gecoded. Es funktioniert, und genau das hat mir hier gereicht. ;-)

So modifiziert erkannte das Script die bereits im Blob-Speicher abgelegten Bilder und nach zwei Durchläufen waren alle Beitrags-Bilder nicht nur wieder in meiner Medienbibliothek, sondern auch gleichzeitig mit den richtigen Beiträgen verknüpft. Und das wichtigste: Alle diese unhandlichen Daten liegen im Azure Blob-Speicher und sind korrekt in den Beiträgen verlinkt.
<h2>Besonderheiten / Einschränkungen</h2>
Wie schon erwähnt sorgt eine Abstraktionsschicht für die Übersetzung der MySQL-Befehle in MS-SQL und somit für Azure-SQL verständliche. Daher rate ich von der Verwendung von Plugins ab, die sehr komplexe Datenbank-Operationen durchführen wie beispielsweise Optimierungen. Im günstigsten Fall funktionieren sie einfach nicht mit einer Fehlermeldung, im schlimmsten Fall sorgen sie für einen nicht so schnell zu reparierenden Schaden in der Datenstruktur die WordPress nachhaltig ins stolpern geraten lässt!

In dem Zusammenhang möchte ich auf einen gelegentlich im Dashboard auftretenden Fehler hinweisen:

<strong>MySQL Error occurred: 42S02 : [Microsoft][SQL Server Native Client 11.0][SQL Server]Invalid object name 'wp_dprv_posts'. on "SELECT * FROM wp_dprv_posts WHERE id = 2861"</strong>

Die ID des Eintrages variiert dabei, jedoch geht es immer um das Objekt "wp_dprv_posts". Ich habe mich noch nicht intensiv damit beschäftigt, jedoch tritt der Hinweis nur gelegentlich auf und scheint auch ansonsten keine Auswirkungen zu haben. Wer weiß, was es mit diesem WordPress-Objekt auf sich hat darf gerne einen Kommentar hinterlassen!

Und natürlich können einige Plugins Probleme mit dem externen Speicherort der Anhänge haben, hier muss man dann im Einzelfall ausprobieren ob man das Script entsprechend anpassen kann / muss.

Soweit meine eigenen Erfahrungen und Lösungsideen. Natürlich wie immer ohne Anspruch auf Vollständigkeit und ganz wichtig: <strong>Works on my machine!</strong> :-)

Jetzt fehlt nur noch Piwik, und ich kann meinen Linux V-Server endlich komplett löschen. ;-)
