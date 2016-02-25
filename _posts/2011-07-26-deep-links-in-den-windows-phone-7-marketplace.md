---
layout: post
title: Deep-Links in den Windows Phone 7 Marketplace
date: 2011-07-26 10:12
author: Gordon Breuer
comments: true
categories: [Development, English, Mobile]
---
<p><img style="background-image: none; border-bottom: 0px; border-left: 0px; margin: 0px auto; padding-left: 0px; padding-right: 0px; display: block; float: none; border-top: 0px; border-right: 0px; padding-top: 0px" title="Windows_Phone_7_4" border="0" alt="Windows_Phone_7_4" src="http://anheledirwp.blob.core.windows.net/wordpress/2011/07/Windows_Phone_7_4.jpg" width="240" height="171" />Eine Kleinigkeit, die mich bei eigentlich allen RSS-Readern unter Windows Phone 7 stört, sind die Links auf den Zune- bzw. Windows Phone 7 Marketplace. Programme wie der <a href="http://www.windowsphonegeek.com/AppHub/Application/c9ccc9fc-8ce7-df11-9524-00237de2dca0">Wonder Reader</a> lassen sich so einstellen, dass automatisch Videos in Postings erkannt (bsp. auf YouTube) und diese mit einem Klick in der ApplicationBar angesehen werden können statt sich durch diverse Mobile-Websites klicken zu müssen. Ähnliches würde ich mir auch für Links auf den Marketplace wünschen. Vor allem wenn man standartmäßig einen Dienst wie <a href="http://www.instapaper.com/">Instapaper</a> o.ä. eingestellt hat muss man hier einige unnötige Klicks machen um endlich den eigentlichen Deep-Link auf die Zune-Seite im Internet Explorer zu öffnen der einen dann erst auf die Marketplace-App weiterleitet. Benutzerfreundlicher wäre auch hier ein kleiner Button der direkt auf den Marketplace zeigt.</p>  <p>Nachdem mich das jetzt schon einige Monate lang geärgert hat, habe ich gestern Nacht einfach mal eine eigene Helferklasse geschrieben die entsprechende Zune-Links aus HTML-Code herausfiltert so dass man diese mit dem MarketplaceDetailTask() direkt aufrufen kann. Den Quellcode mit Dokumentation und Beispiel findet ihr am Ende des Postings. Außerdem habe ich einen Fork der <a href="http://phoney.codeplex.com/">Phoney-Bibliothek</a> von <a href="http://wildermuth.com/">Shawn Wildermuth</a> erstellt und auf Codeplex eingereicht. Mal schauen ob es akzeptiert wird. :-)</p> <a target="_blank" href="http://dotnet-kicks.de/kick/?url=http://old.gordon-breuer.de/post/2011/07/26/Find-Deep-Links-To-Windows-Phone-7-Marketplace.aspx&amp;title=Deep-Links in den Windows Phone 7 Marketplace&amp;description=Das Verlinken auf Anwendungen für Windows Phone 7 ist nicht wirklich elegant gelöst: Entsprechende URLs rufen immer die Zune-Software auf, da ein Web-Marketplace bis dato noch nicht existiert. Das macht es allerdings auch für WP7-Apps schwierig, die solche HTML-Texte anzeigen auf entsprechende Apps zu verlinken. Obwohl hier eigentlich eine entsprechende Funktion existiert um den Marketplace direkt aufzurufen.">
                    <img src="http://dotnet-kicks.de/Services/Images/KickItImageGenerator.ashx?url=http://old.gordon-breuer.de/post/2011/07/26/Find-Deep-Links-To-Windows-Phone-7-Marketplace.aspx" border="0" alt="Artikel empfehlen auf .NET-Kicks Deutschland" />
                  </a> [addlang]   <p>There is one small disadvantage of all mobile rss feed readers I have tried on my Windows Phone 7: They do not interpret links to the Zune- / WP7-Marketplace! One of my favorite apps is <a href="http://www.windowsphonegeek.com/AppHub/Application/c9ccc9fc-8ce7-df11-9524-00237de2dca0">Wonder Reader</a>. It detects videos embedded in the postings and gives you the ability to play them directly via a button in the ApplicationBar. I also have configured the app to open webpages mobilized with <a href="http://www.instapaper.com/">Instapaper</a>. When clicking on a deep-link for an App it first opens it in Instapaper, giving me the message that this page cannot be shown with the service. So I have to click on the link to view the original page. But now the redirection isn’t working and I have to open the URL with the Internet Explorer – and now it’s finally redirecting me to the Marketplace-App. That is a lot of clicking and not a very good user experience. I like the idea that I have an additional button that opens the link to the app directly.</p>  <p>This is nagging me for months now so I sit down last night and wrote a little helper class to analyse a given html code and returns the GUID of an app if there is any. This GUID can than be used to open the Marketplace directly with the MarketplaceDetailTask(). You can find the sourcecode of this helper beneath with some code-comments and examples. Also I created a fork of <a href="http://wildermuth.com/">Shawn Wildermuth</a> <a href="http://phoney.codeplex.com/">Phoney-Library</a> with this helper class included on codeplex. Perhaps it will be accepted. :-)</p>  <pre class="brush:csharp;">	/// &lt;summary&gt;
	/// Provides helper methods to work with the Windows Phone 7 Marketplace
	/// &lt;/summary&gt;
	public static class MarketplaceHelper {
		private static readonly Regex ZuneRegEx = new Regex(@&quot;(?:microsoft.com/windowsphone/|zune://navigate/|windowsphone.com/s|redirect.zune.net/redirect/preferences/askclient|social.zune.net/external/launchzuneprotocol).*(?:appid=|phoneapp%26id%3d)(?&lt;guid&gt;[a-z0-9]{8}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{4}-[a-z0-9]{12})&quot;);
 
		/// &lt;summary&gt;
		/// Determines whether the specified HTML code has any deep-links to a specific application in the Windows Phone 7 Marketplace.
		/// &lt;/summary&gt;
		/// &lt;param name=&quot;htmlCode&quot;&gt;The HTML code to scan for links.&lt;/param&gt;
		/// &lt;returns&gt;
		///&#160; &lt;c&gt;true&lt;/c&gt; if the specified HTML code contains at least one deep-link to an Windows Phone 7 application; otherwise, &lt;c&gt;false&lt;/c&gt;.
		/// &lt;/returns&gt;
		public static bool HasMarketplaceLink(string htmlCode) {
			return ZuneRegEx.IsMatch(htmlCode.ToLowerInvariant());
		}
 
		/// &lt;summary&gt;
		/// The Exception that is thrown when no application guid could be found in the submitted html code.
		/// &lt;/summary&gt;
		public class InvalidMarketplaceAppId : Exception {
			public InvalidMarketplaceAppId() { }
			public InvalidMarketplaceAppId(string message) : base(message) { }
			public InvalidMarketplaceAppId(string message, Exception inner) : base(message, inner) { }
		}
 
		/// &lt;summary&gt;
		/// Search the submitted html code for a deep-link to the Windows Phone 7 Marketplace and returns the application id
		/// &lt;/summary&gt;
		/// &lt;param name=&quot;htmlCode&quot;&gt;The HTML code to scan for application links.&lt;/param&gt;
		/// &lt;returns&gt;GUID of the Windows Phone 7 application&lt;/returns&gt;
		/// &lt;exception cref=&quot;InvalidMarketplaceAppId&quot;&gt;Is thrown when no valid link to the Windows Phone 7 Marketplace is found.&lt;/exception&gt;
		/// &lt;example&gt;if (MarketplaceHelper.HasMarketplaceLink(yourHtmlCode)) {
		///		MarketplaceDetailTask marketplaceDetailTask = new MarketplaceDetailTask();&#160; ///		marketplaceDetailTask.ContentIdentifier = MarketplaceHelper.GetMarketplaceLink(yourHtmlCode);&#160; ///		marketplaceDetailTask.Show();
		/// }&lt;/example&gt;
		public static Guid GetMarketplaceLink(string htmlCode) {
			return GetMarketplaceLinks(htmlCode).First();
		}
 
		/// &lt;summary&gt;
		/// Search the submitted html code for deep-links to the Windows Phone 7 Marketplace and returns all found application ids.
		/// &lt;/summary&gt;
		/// &lt;param name=&quot;htmlCode&quot;&gt;The HTML code to scan for application links.&lt;/param&gt;
		/// &lt;returns&gt;An IEnumerable with all GUIDs for Windows Phone 7 applications&lt;/returns&gt;
		/// &lt;exception cref=&quot;InvalidMarketplaceAppId&quot;&gt;Is thrown when no valid link to the Windows Phone 7 Marketplace is found.&lt;/exception&gt;
		/// &lt;example&gt;if (MarketplaceHelper.HasMarketplaceLink(yourHtmlCode)) {
		///		MarketplaceDetailTask marketplaceDetailTask = new MarketplaceDetailTask();&#160; ///		marketplaceDetailTask.ContentIdentifier = MarketplaceHelper.GetMarketplaceLinks(yourHtmlCode).First();
		///		marketplaceDetailTask.Show();
		/// }&lt;/example&gt;
		public static IEnumerable&lt;Guid&gt; GetMarketplaceLinks(string htmlCode) {
			if (!HasMarketplaceLink(htmlCode))
				throw new InvalidMarketplaceAppId(&quot;No application id for the windows phone marketplace found in the submitted html code.&quot;);
			var matches = ZuneRegEx.Matches(htmlCode.ToLowerInvariant());
			return from object id in matches&#160; select new Guid(id.ToString());
		}
	}</pre>
