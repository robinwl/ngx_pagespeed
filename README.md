# robinwl/ngx_pagespeed

Source code for Docker-container that builds DEB packages for [nginx](http://nginx.org) and [pagespeed](https://github.com/pagespeed/ngx_pagespeed).

## Build and run

```
vagrant up
vagrant ssh
sudo -i 
cd /vagrant
./build.sh

```

## Delete all container and images
```
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
```

## Repo

Builds are available as APT-repo. Read more at [pagespeed.naas.io](http://pagespeed.naas.io/).