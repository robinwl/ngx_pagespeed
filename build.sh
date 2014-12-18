#!/bin/bash

source NPS_VERSION

#cp common/run.sh /vagrant/trusty/run.sh
#cd /vagrant/trusty && docker build -t ngx_pagespeed:trusty . && docker run -a stdin -a stdout -i -t -v /vagrant/deb/:/deb/ -e NPS_VERSION=${NPS_VERSION} -e CODENAME=trusty ngx_pagespeed:trusty
#rm /vagrant/trusty/run.sh
#echo "Completed build for trusty"
#printf "\n\n"

#cp common/run.sh /vagrant/precise/run.sh
#cd /vagrant/precise && docker build -t ngx_pagespeed:precise . && docker run -a stdin -a stdout -i -t -v /vagrant/deb/:/deb/ -e NPS_VERSION=${NPS_VERSION} -e CODENAME=precise ngx_pagespeed:precise
#rm /vagrant/precise/run.sh
#echo "Completed build for precise"
#printf "\n\n"

cp common/run.sh /vagrant/wheezy/run.sh
cd /vagrant/wheezy && docker build -t ngx_pagespeed:wheezy . && docker run -a stdin -a stdout -i -t -v /vagrant/deb/:/deb/ -e NPS_VERSION=${NPS_VERSION} -e CODENAME=wheezy ngx_pagespeed:wheezy
rm /vagrant/wheezy/run.sh
echo "Completed build for wheezy"
printf "\n\n"