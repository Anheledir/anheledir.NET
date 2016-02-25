---
layout: post
title: Destruktor und IDisposable in C#
date: 2008-01-11 22:12
author: Gordon Breuer
comments: true
categories: [Development]
---
<p>Am Mittwoch und Donnerstag hat Hans-Peter Schelian in <a href="http://blog.schelian.de/">seinem Blog</a> die Verwendung des <a href="http://blog.schelian.de/2008/01/09/FinalizeC.aspx" target="_blank">Destruktors</a> (Finalizer in VB) und die <a href="http://blog.schelian.de/2008/01/10/usingKurzErlaumlutertC.aspx" target="_blank">using Anweisung</a> (nicht zu verwechseln mit der using Direktive, siehe Schelians Blogeintrag hierzu) kurz erl&#228;utert. Es stellt sich also bei der Konzeption einer eigenen Klasse die Frage, ob man einen Destruktor schreiben oder die Schnittstelle IDisposable implementieren sollte. Ersterer wird zwar auf jeden Fall aufgerufen aber &quot;<em>wann</em>&quot; ist nicht n&#228;her definiert, sp&#228;testens jedoch bei Programmbeendung. Bei der IDisposable-Schnittstelle ist zwar genau bekannt, wann der Aufruf mittels <strong>Dispose()</strong> stattfindet, doch muss man sich dann auf den Verwender der Klasse verlassen, dass er diese Methode auch verwendet - sie wird nicht zwangsl&#228;ufig automatisch aufgerufen. </p>  <p>Die Idee liegt nun also nahe, die Dispose-Methode einfach im Destruktor aufzurufen: Auch wenn man vergisst, die Methode Dispose() aufzurufen, ist gew&#228;hrleistet, dass sie sp&#228;testens am Ende des Programms aufgerufen wird. </p>  <p><strong>Beispiel:</strong>&#160; </p>  <div class="wlWriterSmartContent" id="scid:812469c5-0cb0-4c63-8c15-c81123a09de7:401209e7-b49c-4102-a304-5fea58f03477" style="padding-right: 0px; display: inline; padding-left: 0px; float: none; padding-bottom: 0px; margin: 0px; padding-top: 0px"><pre name="code" class="c#">public class BeispielKlasse : IDisposable {
  private bool disposed = false;

  ~BeispielKlasse() {
    Dispose();
  }

  public virtual void Dispose() {
    if ( !this.disposed ) {
      try {
        // Hier die knappe Ressource freigeben...    
      } finally {
        this.disposed = true;
        GC.SuppressFinalize( this );
      }
    }
  }

  private void checkIfDisposed() {
    if ( disposed ) {
      throw new ObjectDisposedException( "NurEinBeispiel" );
    }
  }
}</pre></div>

<p>Die Klasse implementiert die IDisposable-Schnittstelle und die Methode <strong>Dispose()</strong> l&#228;sst sich auch gefahrlos mehrfach aufrufen. Der Aufruf von <strong>GC.SuppressFinalize()</strong> h&#228;lt den GarbageCollector davon ab, den Destruktor auf diesem Object aufzurufen, weil das Objekt nun finalisiert wurde. </p>

<p>Jetzt muss man nur noch in allen Methoden der Klasse &#252;berpr&#252;fen, ob das Objekt mittlerweile schon bereinigt wurde (<strong>checkIfDisposed()</strong>). </p>
