---
layout: post
section-type: post
title: Publish a website with Jekyll and Github on Windows Azure
category: Azure
tags: [azure, github, git, liquid, web app, cloud, jekyll, ruby, continuous deployment, english]
---
When coming down to create a website, you have to consider a few things ahead. Of course, there is the content and you also need some kind of Design. But at the latest when you want to finally want to start you have to decide what kind of technology you want to use: There is ASP .NET, ASP .NET MVC, PHP, more than a thousand CMS (like WordPress, Drupal, Umbraco, ...), and finally there is always *this guy* who uses classic VB or VB.NET. If you are not owning your own hosting-server there are further considerations: What technology is supported by my hosting environment or do you need a database?

For the last five years I always had some kind of Blog Software or Content Management System, hosted on my own virtual server. I like to play with my website and try new things, but slowly I started to get annoyed by all the maintaince I had to do just to keep my page up and running. There are so many updates you have to install regulary (Server OS, Webserver, Database, Plugin 1..n, Software A..Z and so on. For the last two years I was using WordPress and those software, theme and plugin updates are  quite annoying to just keep it running.

At one of the latest conferences I visited I talked with a bunch of people and I learned about a new way I didn't knew until then, namely [Jekyll]. So, what exactly is Jekyll?

> "Jekyll is a simple, blog-aware, static site generator. It takes a template directory containing raw text files in various formats, runs it through a converter (like Markdown) and our Liquid renderer, and spits out a complete, ready-to-publish static website suitable for serving with your favorite web server."

So, instead of using a software that creates my website / blog dynamically, this is basically a generator for static HTML files, generating the content from text-files based on rules and layout files. Fair enough, most websites don't really need to be dynamically generated and even the cheapest free-webspace is capable of serving static files like html, css and js. I was always the curious and adventurous kind of developer and finally this week I could busy myself with Jekyll. I searched for a nice theme (found [{ personal }]), created a new Github Repository for [my Blog] and started to experiment with it. As a hosting platform I tried [GitHub Pages] at first. Jekyll also happens to be the engine behind those, which basically means you can use Jekyll to host a blog or website from GitHub's servers for free. But I wanted some more customization so I finally decided to go along with [Microsoft Azure Web App Service]. Actually you can use the free plan for your website, so even with Azure you get your website for free.

> **Performance:** Compared to any dynamic website, CMS or especially Wordpress, a static website is incredible fast, very easy to scale and has a very-low footprint regarding to CPU and RAM.

Jekyll is based on [Ruby], so you need to enable PHP (it's already by default) in your Application settings. You can choose to install Jekyll all by yourself as a Ruby Gem into your Web App. But [Cory Fowler] has written an [extension] for your convenience to automate this task for you. To install and use the Extension you should at first add a new environment variable to your application, because installing Jekyll and all dependencies may take a while and you don't want to run into a timeout:
```
SCM_COMMAND_IDLE_TIMEOUT = 600
```
After setting the higher timeout you can install the extension via the Extension Manager, just take a look at the following screenshot:

![Add the Jekyll-Extension into your Azure Web App][Extension Manager - Jekyll]

Now it's time to push your new website into your new GitHub Repository. You can choose any repository that is supported by Azure or just upload your site via FTP. The way I'm demonstrating here is usefull because you can create and edit your Markdown files from the GitHub-Website and because my blog is public it doesn't matter when my repository is public, too. Even better, you can link your repository to your Azure Web App for "continuous integration", but I will get to this in a minute.

The easiest way to start is creating a new page directly with Jekyll, but you must have Ruby installed on your system to use this:
```bash
gem install jekyll
cd wherever/you/want/this/project/on/your/computer
jekyll new my-blog
```
If you don't have Ruby installed you can take a look at the [GitHub Help] for instructions or you can just use a [ready-to-use theme]. The most simple theme, almost the same you get when you create it with Jekyll, has been uploaded by [Chris Nunciato] and can be [found here]. Just commit the freshly created site - either the one created by Jekyll or the one downloaded - into your own Repository and push it to GitHub.

Now to the really cool part! One disadvantage to a CMS seems to be that you have to create your files everytime something changed. But you can automate this task thanks to Azures Continuous Integration feature. Go to your Azure Web App and under Settings you click on *Continuous deployment*. You get a list of all supported services:

![There are quite a lot of services to choose from when setting up continuous deployment with Microsoft Azure][Choose Source]

After selecting GitHub you have to authenticate via oAuth with your GitHub-Account. Also you have to select the repository and branch the continuous deployment task should use:

![Set up continuous deployment for your Microsoft Azure Web App][Continuous Deployment]

After saving your settings a new [Webhook] for your selected repository is created, that is Azure committed a service-uri to GitHub that should be called everytime the given repository has changed. When GitHub sends a ```POST``` request to this url, Azure automatically starts to check-out your repository and runs it's deploy-scripts (including running Jekyll). If everythings runs fine, the new content is mirrored to your ```wwwroot``` directory and your updated site is up-and-running. In case of an error, your currently running site is untouched and you can take a look at the log files generated during deployment on the Settings-Page for *Continuous deployment*.

I will show you in another post how to set up a pre-build and a post-build task to run a script during your site-deployment.
If you have any questions just leave a comment!


[Jekyll]:http://jekyllrb.com
[Ruby]:https://en.wikipedia.org/wiki/Ruby_(programming_language)
[{ personal }]:https://github.com/PanosSakkos/personal-jekyll-theme
[my Blog]:https://github.com/Anheledir/anheledir.NET
[GitHub Pages]:https://pages.github.com/
[Microsoft Azure Web App Service]:https://azure.microsoft.com/en-us/services/app-service/web/
[Cory Fowler]:http://blog.syntaxc4.net/
[extension]:https://github.com/SyntaxC4-MSFT/JekyllExtension
[ready-to-use theme]: http://lmbtfy.com/?q=jekyll+themes
[Chris Nunciato]: https://github.com/cnunciato
[found here]: https://github.com/cnunciato/jekyll-starter
[Webhook]: https://developer.github.com/webhooks/
[GitHub Help]: https://help.github.com/articles/setting-up-your-pages-site-locally-with-jekyll/#platform-windows

[Extension Manager - Jekyll]: https://anheledir.blob.core.windows.net/blog/2016-03-01-Choose-extension-Microsoft-Azure.png
[Choose Source]: https://anheledir.blob.core.windows.net/blog/2016-03-01-Choose-source-Microsoft-Azure.png
[Continuous Deployment]: https://anheledir.blob.core.windows.net/blog/2016-03-01-Continuous-Deployment-Microsoft-Azure.png