---
layout: post
title: XAML Behavior for playing only one sound-clip simultaneously
date: 2014-10-03 16:00
author: Gordon Breuer
comments: true
categories: [Development, English]
---
<img class="alignright wp-image-7182 size-full" style="margin-right: 12px;" src="http://anheledirwp.blob.core.windows.net/wordpress/2014/10/Sound-listening.png" alt="Sound-listening" width="158" height="201" />I'm working on a Universal App for Windows and Windows Phone 8.1 where you have a list of available sounds. Each entry has a preview button to listen to that sound before adding it to your project. So there were quite a few challenges:
<ul>
	<li>those entries are coming from a binding</li>
	<li>using the MVVM pattern I don't want to use code-behind or other dirty tricks</li>
	<li>the preview button should have a "play" icon on idle, and a "stop" icon while it's associated sound is playing</li>
	<li>when pressing the button a second time while the sound is playing, it should stop</li>
	<li>there should be only one sound playing simultaneously, starting a new one should stop the previously playing</li>
</ul>
There are a few approaches that didn't worked as expected. For example I saved the currently playing sound in a ViewModel-Property and informed all preview-buttons when it changed so each one decided what icon to display or if they should start/stop playing their sound.

My final solution now works quite well and is also flexible enough for similiar scenarios, so I want to share it with you. I created an <strong>Action</strong>, containing most of the logic. It is executed in my case by the <strong>EventTriggerBehavior</strong> from Microsofts <strong>Xaml.Interactions.Core</strong> Namespace.

<strong>You can get the sourcecode of my </strong><a href="http://pastebin.com/bxLbgkRG"><strong>SoundPreviewAction </strong></a><strong>here:</strong> <a href="http://pastebin.com/download.php?i=bxLbgkRG">Download SoundPreviewAction.cs</a>

<strong>Example how to use it:</strong>
<pre>// xmlns:interactivity="using:Microsoft.Xaml.Interactivity"
// xmlns:core="using:Microsoft.Xaml.Interactions.Core"

&lt;Button Content="&amp;#xE102;" FontFamily="Segoe UI Symbol" FontSize="22" BorderThickness="0"&gt;
  &lt;interactivity:Interaction.Behaviors&gt;
    &lt;core:EventTriggerBehavior EventName="Click"&gt;
      <strong>&lt;utilities:SoundPreviewAction Source="{Binding Filename}" PlayContent="&amp;#xE102;" StopContent="&amp;#xE15B;" Volume="0.8" /&gt;
</strong>    &lt;/core:EventTriggerBehavior&gt;
  &lt;/interactivity:Interaction.Behaviors&gt;
&lt;/Button&gt;</pre>
