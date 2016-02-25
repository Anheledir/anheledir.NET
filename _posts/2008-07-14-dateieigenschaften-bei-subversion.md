---
layout: post
title: Dateieigenschaften bei Subversion
category: .*
tags: []
---
<p>Die Versionsverwaltung Subversion hat eine interessante Funktion, auf die mich ein Kollege aufmerksam gemacht hat. Man kann einzelnen Dateien des Repositories bekanntlich verschiedene Eigenschaften zuweisen. Einige waren mir durchaus schon bekannt, wie der Mime-Type (<em>svn:mime-type</em>) oder eine Lock-Markierung (<em>svn:needs-lock</em>). Bisher nicht bekannt war mir die Eigenschaft <strong>svn:keywords</strong> bzw. dessen Anwendungszweck.</p>  <p>Für diese Eigenschaft gibt es verschiedene Werte die man setzen kann:</p>  <ul>   <li>Date </li>    <li>Revision </li>    <li>Author </li>    <li>HeadURL </li>    <li>Id </li> </ul>  <p>Man kann auch mehrere dieser Werte kombinieren indem man sie mit einem Leerzeichen trennt. Was aber bringt einem das jetzt genau?</p>  <p>Nehmen wir an, wir hätten eine Codebehind-Datei mit folgendem Header:</p>  <div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:082c777c-fe57-493f-91b3-e5d1e10cac53" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nogutter:nocontrols">/*******************************************************************
 *               Google Analytics ASP.NET Server Control
 *******************************************************************
 * 
 * $LastChangedDate$
 * $LastChangedRevision$
 * $LastChangedBy$
 * 
 *******************************************************************/</pre></div>

<p>Ein solcher Kommentar hat den Vorteil, dass man auf Anhieb sieht wozu die betreffende Datei gehört, wann sie zuletzt verändert wurde und von wem. Es ist allerdings etwas mühsam, die Angaben zum Datum, der Dateirevision oder dem letzten Editor manuell immer auf dem aktuellen Stand zu halten. Und genau hier greift nun die Subversion-Eigenschaft <em>svn:keywords</em>.</p>

<p>Wird eine Datei aus dem Repository geladen oder aktualisiert, so geht Subversion bei Vorhandensein der entsprechenden Eigenschaft die Datei durch und ersetzt die angegebenen Platzhalter durch entsprechende Informationen. Für das Beispiel oben müsste also zumindest der Wert „<strong>Date Revision Author</strong>“ gesetzt sein, damit alle drei Platzhalter erkannt und ersetzt werden. Im Ergebnis sieht das dann beispielsweise so aus:</p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:7b5b4f4a-8814-4207-b2b8-6f6a6bab66fc" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nogutter:nocontrols">/*******************************************************************
 *               Google Analytics ASP.NET Server Control
 *******************************************************************
 * 
 * $LastChangedDate: 2008-07-06 13:33:56 +0200 (So, 06 Jul 2008) $
 * $LastChangedRevision: 21 $
 * $LastChangedBy: pheine $
 * 
 *******************************************************************/</pre></div>

<p>Die Revisionsnummer entspricht dabei der Revision, in der diese Datei tatsächlich geändert wurde und nicht der aktuellen Revision des Repositories. In der folgenden Tabelle stehen alle Platzhalter und der dazugehörige Wert der Eigenschaft svn:keywords. In der Regel sind die Namen selbsterklärend, im Zweifelsfall hilft ein kurzer Blick in die (englische) <a href="http://durak.org/sean/pubs/software/version-control-with-subversion-1.5/svn.advanced.props.special.keywords.html" target="_blank">Dokumentation</a> oder auch einfach Ausprobieren.</p>

<table style="border-right: #000 1px solid; border-top: #000 1px solid; border-left: #000 1px solid; border-bottom: #000 1px solid" cellspacing="0" cellpadding="2" width="436" border="0"><thead>
    <tr>
      <th valign="top" width="126"><strong>Eigenschaftswert</strong></th>

      <th valign="top" width="196"><strong>Zu ersetzende Zeichenfolge in der Datei</strong></th>

      <th valign="top" width="112"><strong>Alternative Zeichenfolge</strong></th>
    </tr>
  </thead><tbody>
    <tr>
      <td valign="top" width="126">Date</td>

      <td valign="top" width="196">$LastChangedDate$</td>

      <td valign="top" width="112">$Date$</td>
    </tr>

    <tr>
      <td valign="top" width="126">Revision</td>

      <td valign="top" width="196">$LastChangedRevision$</td>

      <td valign="top" width="112">$Revision$</td>
    </tr>

    <tr>
      <td valign="top" width="126">Author</td>

      <td valign="top" width="196">$LastChangedBy$</td>

      <td valign="top" width="112">$Author$</td>
    </tr>

    <tr>
      <td valign="top" width="126">Id</td>

      <td valign="top" width="196">$Id$</td>

      <td valign="top" width="112">&#160;</td>
    </tr>

    <tr>
      <td valign="top" width="126">HeadURL</td>

      <td valign="top" width="196">$HeadURL$</td>

      <td valign="top" width="112">$URL$</td>
    </tr>
  </tbody></table>

<p>Wie setzte ich nun so eine Eigenschaft für eine Datei? Auf der Kommandozeile funktioniert das mit dem folgenden Aufruf von Subversion:</p>

<p><strong>svn propset svn:keywords &quot;Date Revision Author&quot; GAControl.cs</strong></p>

<p>Ein wenig bequemer geht es unter Windows mit der Explorer-Erweiterung <a href="http://tortoisesvn.tigris.org/" target="_blank">TortoiseSVN</a>. Hier klicken wir die entsprechende Datei einfach mit der rechten Maustaste an, wählen aus dem Kontextmenü „Properties“ und im sich öffnenden Dialog den Karteireiter „Subversion“. Hier gibt es unter anderem auch den Button „Properties…“. Klickt man diesen kann, kann man die neue Eigenschaft <em>svn:keywords</em> bequem über den Button „New…“ hinzufügen.</p>

<p><a href="http://static.gordon-breuer.de/img/DateieigenschaftenbeiSubversion_BE46/image_2.png" rel="lightbox[svn:keywords]"><img title="image" style="border-top-width: 0px; border-left-width: 0px; border-bottom-width: 0px; margin: 0px 0px 0px 10px; border-right-width: 0px" height="84" alt="image" src="http://anheledirwp.blob.core.windows.net/wordpress/2008/07/image_thumb.png" width="126" align="right" border="0" /></a>Eine weitere Möglichkeit besteht außerdem darin, die Konfiguration von Subversion soweit anzupassen, dass bestimmte Dateitypen automatisch die entsprechende Dateieigenschaft gesetzt bekommen, wenn man sie dem Repository hinzufügt. Hierfür gibt es einen eigenen Konfigurationsabschnitt: </p>

<div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:9cb794f6-fb00-4f97-a753-2fe6aada31e0" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#:nogutter:nocontrols">[auto-props]
*.asp = svn:eol-style=native;svn:keywords=Id Date Revision Author URL
*.aspx = svn:eol-style=native;svn:keywords=Id Date Revision Author URL
*.cs = svn:eol-style=native;svn:keywords=Id Date Revision Author URL
*.html = svn:eol-style=native;svn:keywords=Id Date Revision Author URL
</pre></div>

<p>Diese Möglichkeit gibt es natürlich auch bei Verwendung von TortoiseSVN. Dafür muss man in den Settings lediglich auf den Button „Edit“ bei „Subversion configuration file“ gehen.</p>
