# rails-chef-solo-boostrap

Playing around with chef-solo to bootstrap new machines with rails barebones

## Caveat

![I have no idea what I'm doing](http://farm8.staticflickr.com/7392/11079402145_15ac409a0e_o.jpg)

## I'd like this to install

* imagemagick
* nginx
* mysql
* redis
* rvm

## Steps (on an Ubuntu 12.04 x32 Digital Ocean Droplet)

1. ssh onto the newly created machine as root
2. apt-get -y update && sudo apt-get install gcc
3. Install the bare-minimum ruby and chef...if you want to use rbenv or rvm, do it later.

    #!/usr/bin/env bash
    apt-get -y update
    apt-get -y install build-essential zlib1g-dev libssl-dev libreadline-gplv2-dev libyaml-dev
    cd /tmp
    wget ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.gz
    tar -xvzf ruby-1.9.3-p125.tar.gz
    cd ruby-1.9.3-p125/
    ./configure --prefix=/usr/local
    make
    make install
    gem install chef ruby-shadow --no-ri --no-rdoc
4. Change the password in node.json
5. scp -r . root@xxx.xxx.xxx.x:/var/chef/
6. From the new machine run `chef-solo -c /var/chef/solo.rb`