# Nginx

## Introduction

Nginx is a web server which can also be used as a reverse proxy, load balancer, mail proxy and HTTP cache. The software was created by Igor Sysoev and first publicly released in 2004. A company of the same name was founded in 2011 to provide support and Nginx plus paid software. [Wikipedia](https://en.wikipedia.org/wiki/Nginx)

## Installation

Initial installation is relatively straightforward. Simply execute the following:

```bash
sudo apt update
sudo apt install nginx
```

Following completion of those commands, you should see the default Nginx welcome message when browsing your server's IP address within the browser.

**Source:** [How To Install Linux, Nginx, MySQL, PHP (LEMP stack) on Ubuntu 18.04](https://www.digitalocean.com/community/tutorials/how-to-install-linux-nginx-mysql-php-lemp-stack-ubuntu-18-04)

## Configuration

### Folder permissions

By default, all of the major Nginx folders are owned by the `root` user. I like to change ownership to the administrative user to allow edits without use of `sudo`.

```bash
sudo chown -R $USER:$USER /usr/share/nginx/html
sudo chown -R $USER:$USER /etc/nginx/sites-available
sudo chown -R $USER:$USER /etc/nginx/sites-enabled
```

### Directory structure

At this time, I typically use an Ubuntu server to host DEV, Stage, UAT, and Production environments for a website. (Clearly, I am not hosting sites that receive significant traffic.) I have a particular directory structure that I like to maintain.

```bash
mkdir -p /usr/share/nginx/html/server
mkdir -p /usr/share/nginx/html/dev
mkdir -p /usr/share/nginx/html/stage
mkdir -p /usr/share/nginx/html/prod
```

The `server/` folder that we just created serves as the new location for the default Nginx file. We will need to move that into place.

```bash
mv /usr/share/nginx/html/index.html /usr/share/nginx/html/server
```

And then we need to make a tweak to the default server configuration to make sure that takes affect:

```bash
sed -i 's/root \/var\/www\/html;/root \/usr\/share\/nginx\/html\/server\;/g' /etc/nginx/sites-available/default
sudo service nginx reload
```

## Basic HTTP Auth

* [Restricting Access with HTTP Basic Authentication](https://docs.nginx.com/nginx/admin-guide/security-controls/configuring-http-basic-authentication/) - Official Nginx docs
* [How To Set Up Basic HTTP Authentication With Nginx on Ubuntu 14.04](https://www.digitalocean.com/community/tutorials/how-to-set-up-basic-http-authentication-with-nginx-on-ubuntu-14-04) - DigitalOcean