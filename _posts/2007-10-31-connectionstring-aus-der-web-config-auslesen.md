---
layout: post
title: ConnectionString aus der web.config auslesen
date: 2007-10-31 04:14
author: Gordon Breuer
comments: true
category: Development, WWWahnsinn
---
<p>Ein kleines Code-Snippet auch als Erinnerung für mich, da man das Auslesen aus der web.config bei sauberer Programmierung eigentlich immer wieder mal braucht. Und gerade heute fiel mir der Syntax beim Portieren einer classic ASP Anwendung nicht ein...</p> <p><u>Die ausführliche Version:</u></p><pre>ConnectionStringSettings settings = <span style="color: #0000ff">new</span> ConnectionStringSettings();
settings = System.Configuration.ConfigurationManager.<br />   ConnectionStrings["<span style="color: #8b0000">NameInWebConfig</span>"];
<span style="color: #0000ff">string</span> connectionString = settings.ConnectionString.ToString();
</pre>
<p>&nbsp;</p>
<p><u>Das kann man natürlich noch kürzen, so dass schliesslich nur eine Zeile übrig bleibt:</u></p><pre><span style="color: #0000ff">string</span> connectionString = System.Configuration.ConfigurationManager.<br />   ConnectionStrings["<span style="color: #8b0000">NameInWebConfig</span>"].ConnectionString.ToString();</pre>
