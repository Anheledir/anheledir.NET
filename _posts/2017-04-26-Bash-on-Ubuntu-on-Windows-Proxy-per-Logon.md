---
layout: post
section-type: post
title: Casually using a Proxy with Bash on Ubuntu on Windows
category: Win10
tags: [microsoft, canonical, windows, windows 10, bash, ubuntu, proxy, session, logon, enterprise, company, network]
---
With the **Microsoft Windows 10 Anniversary Update (1607)** we also got an integrated *Linux Subsystem* and the so called [Bash on Ubuntu on Windows], providing us with a familiar Bash shell and Linux environment in which you can run most Linux command-line tools, directly on Windows, **unmodified**, without needing an entire Linux virtual machine.

As I'm using my Surface Pro 4 within our company network as well as at home, I need to use a proxy-server only occasionally and wanted an easy method to switch it within the Bash.
This is a simple new method I'm using for this:

**/etc/bash.bashrc**
```bash
function proxy(){
echo -n "Proxy-Server:"
read -e proxyserver
echo -n "Proxy-Port:"
read -e proxyport
export http_proxy=http://$proxyserver:$proxyport
export https_proxy=http://$proxyserver:$proxyport
export ftp_proxy=http://$proxyserver:$proxyport
echo -e .\Set the Proxy environment variables for the current session. Log out to reset to reset them to null again..
}

function myproxy(){
export http_proxy=http://myproxy.company.tld:8080
export https_proxy=http://myproxy.company.tld:8080
export ftp_proxy=http://myproxy.company.tld:8080
echo -e .\Set the Proxy environment variables for the current session. Log out to reset to reset them to null again..
}
```

After the next start of the bash you have the new command *proxy* that will ask you for the server and the port, setting the environment variables accordingly.
I also added a second command to directly set those variables to our companies proxy so I don't have to type in the server and port everytime.

If you are using the bash as a normal user and use the *sudo* command to run something within the root-context (e.g. *sudo apt-get update*), you can also add the following snippet:

**/etc/sudoers.d/README**
```bash
Defaults env_keep = "http_proxy https_proxy ftp_proxy"
```

Now you can run the proxy command with your default user and the set environment variables are also available when using *sudo* for elevated root-rights.


[Bash on Ubuntu on Windows]:https://msdn.microsoft.com/en-us/commandline/wsl/about