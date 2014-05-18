hangar-proxy leverage nginx reverse proxy and inotify to automatically update
and reload nginx configuration when the reference file is updated.

How to use it
=============

  $> docker run -d -p 80:80 enalean/hangar-proxy

It will expose all containers that will declared into /mnt/proxy

Why not use nginx-proxy ?
=========================

First, this work is is strongly inspired from https://github.com/jwilder/nginx-proxy.

However, having the docker socket mounted into the reverse proxy might be concern if an attacker can compromise the reverse proxy.

This is an attempt to decouple the service update and the reverse proxy thing.

Note: an alternative should probably to use skydns.
