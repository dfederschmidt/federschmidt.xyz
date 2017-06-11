---
layout: "single"
title:  "Setting up Hugo on Uberspace"
date:   2016-08-03
categories: hugo uberspace
---

This post will briefly explain how I set up a Hugo-generated page on my
uberspace. <a target="_blank" href="https://gohugo.io/">Hugo</a> is a static site generator written in Go which builds up web
pages from markup files.

<!--more-->

 It is an alternative to the popular <a target="_blank" href="http://jekyllrb.com/">Jekyll</a>, which is used for <a href="https://pages.github.com/" target="_blank">Github Pages</a>.


## Installation

You can get the latest releases of Hugo from <a href="https://github.com/spf13/hugo/releases" target="_blank">GitHub</a>. I'm currently running v0.14 which will also be installed here. Check for newer versions and
change the commands presented here accordingly. All of the uberspace servers are running CentOS 64-bit, so the appropriate package
would be the release named  ```linux_amd64.tar.gz```.

1. Download the package to your uberspace and extract it to a location of your choice and extract it.

        $ wget https://github.com/spf13/hugo/releases/download/v0.14/hugo_0.14_linux_amd64.tar.gz
        $ tar -xvzf hugo_0.14_linux_amd64.tar.gz && mv hugo_0.14_linux_amd64 hugo


2. Now, in order to be able to call the hugo-executable from everywhere, add the hugo folder to the $PATH variable in
your .bashrc. On my uberspace, my hugo folder is located in $HOME/apps, make sure to modify the command according to your installation location.

        $ echo "export PATH=\$HOME/apps/hugo:\$PATH" >> ~/.bashrc

3. Check if your $PATH variable is set correctly by invoking Hugo in your home folder.

        $ hugo
  Should print something along the following lines:

        ERROR: 2015/06/02 Unable to locate Config file.
        Perhaps you need to create a new site. Run `hugo help new` for details
        ERROR: 2015/06/02 No 'baseurl' set in configuration or as a
        flag. Features like page menus will not work without one.
        ERROR: 2015/06/02 Unable to find Static Directory: /home/$USER/static/
        CRITICAL: 2015/06/02 No source directory found, expecting to find it at /home/$USER/content

4. Now you are ready to create your site using Hugo! Look into their guides on their home page for instructions on
how to setup a hugo site. It is a very powerful tool with endless possibilities for configuration.

    * <a href="http://gohugo.io/overview/quickstart/" target="_blank">Quickstart Guide</a>
    * <a href="http://gohugo.io/overview/usage/" target="_blank">Usage Guide</a>
    * <a href="http://gohugo.io/overview/configuration/" target="_blank">Configuration Guide</a>


## Configuration
Make sure that the theme you are using for your Hugo page is specified in the ```config.toml``` file.

In order to make the page available to everyone, it needs to be served by a web server.
There are various possibilities on how to set up Hugo. Fortunately, Hugo comes with
it's own high-performance web server which we will be using here.

To make the server run automatically, we configure it as a [daemon](https://wiki.uberspace.de/system:daemontools) on our uberspace.
Additionally, we need to have an open, unused TCP-port. Just send a mail to hallo@uberspace.de and ask for an open port.

    $ uberspace-setup-service hugo-blog hugo server -p$PORT \
    --baseUrl=http://yourdomain.tld/ --appendPort=false

This will create all the necessary files and start the daemon. This won't work yet, because we will need to modify the run-script of
the daemon.

    $ cd ~/service/hugo-blog
    $ vim run

Just before the line starting with "exec ...", insert a directory change to switch to the
place where your hugo site is located on the server. In my case this is:

    cd /home/danielf/blog

Now restart the daemon using svc.

    svc -du ~/service/hugo-blog

Now your Hugo-generated page is available on the port you specified.
In order to make it available on your domain, put a .htaccess file in your DocumentRoot,
the html-folder, with the following contents:

    RewriteEngine On
    RewriteBase /
    RewriteRule (.*) http://localhost:$PORT/$1 [QSA,P]

Now the page should be available on http://yourdomain.tld/.
Congratulations and happy hacking!