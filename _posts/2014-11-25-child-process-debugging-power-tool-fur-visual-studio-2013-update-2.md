---
layout: post
title: Child Process Debugging Power Tool für Visual Studio 2013.2
category: .*
tags: []
---
Schon seit einiger Zeit gab es seitens der Entwickler den Wunsch, dass Unterprozesse die vom Hauptprozess erzeugt wurden automatisch von Visual Studio an den Debugger angehängt werden, um hier ebenfalls eine einfache Fehleranalyse durchführen zu können. Vor fast zwei Jahren wurde der Wunsch dann auch bei <a href="http://visualstudio.uservoice.com/forums/121579-visual-studio/suggestions/3549376-attach-child-process-to-debugger-automatically" target="_blank">UserVoice eingereicht</a>, und jetzt wurde er tatsächlich umgesetzt. :-)

In der <a href="https://visualstudiogallery.msdn.microsoft.com" target="_blank">Visual Studio Galerie </a>gibt es jetzt den<a href="https://visualstudiogallery.msdn.microsoft.com/a1141bff-463f-465f-9b6d-d29b7b503d7a" target="_blank"> Child Process Debugging Power Tool </a>zum Herunterladen. Voraussetzung ist hierfür mindestens Visual Studio 2013 mit installiertem Update 2 oder höher (<em>inkl. der aktuellen Beta von Visual Studio 2015</em>). Außerdem wird der native Debugger bei der Ausführung benötigt, den man zum Debuggen von .NET Code in der Regel erst in den Projekteigenschaften aktivieren muss:

[caption id="attachment_7189" align="aligncenter" width="723"]<img class="wp-image-7189 size-full" src="http://anheledirwp.blob.core.windows.net/wordpress/2014/11/Mixed-Mode-Debugging.png" alt="Project Settings &gt; Debug &gt; Application process &gt; Mixed (Managed and Native)" width="723" height="345" /> Mixed-Debugger für managed und native Code aktivieren[/caption]

Möchte man nun das automatische Child Debugging aktivieren, verwendet man nach der Installation des Plug-Ins den neuen Menüeintrag unter Debug und aktiviert im sich öffnenden Reiter die entsprechende Option. Klickt man anschließend auf speichern ist das Debuggen für alle neuen Sub-Prozesse automatisch aktiviert.

[caption id="attachment_7187" align="aligncenter" width="628"]<img class="wp-image-7187 size-full" src="http://anheledirwp.blob.core.windows.net/wordpress/2014/11/1738_clip_image002_thumb_09CF98FC.png" alt="Debug &gt; Other Debug Targets &gt; Child Process Debugging Setting..." width="628" height="161" /> Schritt 1: Öffnen der Debugger-Einstellungen[/caption]

[caption id="attachment_7188" align="aligncenter" width="603"]<a href="http://anheledirwp.blob.core.windows.net/wordpress/2014/11/3302_clip_image004_thumb_5B78A3FF.jpg"><img class="wp-image-7188 size-full" src="http://anheledirwp.blob.core.windows.net/wordpress/2014/11/3302_clip_image004_thumb_5B78A3FF.jpg" alt="Enable child process debugging" width="603" height="244" /></a> Schritt 2: Das Child Process Debugging für alle Prozesse aktivieren[/caption]

In den Einstellung hat man außerdem auch noch weitere Möglichkeiten der Konfiguration. Statt beispielsweise den gleichen Debugger wie für den Haupt-Prozess zu verwenden, kann man hier auch einen bestimmten fest einstellen (<em>Managed oder Native</em>). Auch können anhand der Prozessnamen weitere Ausnahmen definiert werden um beispielsweise einzelne Prozesse gezielt vom Debuggen auszuschließen, oder umgekehrt den Debugger nur an bestimmte Prozesse automatisch anzuhängen:

<img class="aligncenter size-full wp-image-7190" src="http://anheledirwp.blob.core.windows.net/wordpress/2014/11/2671_clip_image006_thumb_048342FC.jpg" alt="2671_clip_image006_thumb_048342FC" width="628" height="288" />

Mit den <strong>Persist settings to</strong>-Einstellungen kann man außerdem noch einstellen, wie die Konfiguration gespeichert wird. Standard ist hier die <strong>SUO-Datei</strong> der Solution, alternativ kann man sie aber auch als<strong> XML-Datei exportieren</strong> um sie so bsp. in die Versionsverwaltung zu integrieren und anderen Kollegen zugänglich zu machen ohne die eigenen User-Options zu teilen.

Das Plug-In wird nicht offiziell von Microsoft unterstützt, Feedback könnt ihr jedoch in den Kommentaren des <a href="http://blogs.msdn.com/b/visualstudioalm/archive/2014/11/24/introducing-the-child-process-debugging-power-tool.aspx" target="_blank">Original-Artikels</a> hinterlassen, oder mit Hilfe des<a href="http://msdn.microsoft.com/en-us/library/zzszcehe.aspx" target="_blank"> Send a Smile </a>Features direkt innerhalb von Visual Studio.

<strong>Übrigens</strong>: Wenn ihr bisher nur die Express-Version von Visual Studio verwendet hat, die keine Plug-In Unterstützung bietet, kann übrigens ab sofort auf die neue Edition <a href="http://www.visualstudio.com/news/vs2013-community-vs" target="_blank">Visual Studio Community 2013 </a>zurückgreifen. Einfach gesagt erhalten hiermit Open-Source Entwickler und Teams bis 5 Personen kostenlos eine<strong> im Umfang dem Visual Studio Professional</strong> entsprechende Entwicklungsumgebung; und somit auch unter anderem <strong>Unterstützung für Plug-Ins</strong>. Die neue Community-Edition wird in Zukunft damit die bisherigen Express-Versionen von Visual Studio ablösen.
