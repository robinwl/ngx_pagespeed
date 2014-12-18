#!/bin/bash

# add nginx repo
wget -O - http://nginx.org/keys/nginx_signing.key | apt-key add -

cat > /etc/apt/sources.list.d/nginx.list <<'EOF'
deb http://nginx.org/packages/mainline/ubuntu/ CODENAME nginx
deb-src http://nginx.org/packages/mainline/ubuntu/ CODENAME nginx
EOF

sed -i "s/CODENAME/$CODENAME/g" /etc/apt/sources.list.d/nginx.list
if [ $CODENAME == "wheezy" ]
then
	sed -i "s/ubuntu/debian/g" /etc/apt/sources.list.d/nginx.list
fi

apt-get update

# enter stageing area
cd $STAGE_PATH

# grab source code
apt-get source nginx

# locate source code
SC_PATH=$(find $STAGE_PATH -maxdepth 1 -type d |grep nginx)

# set wget args, workaround for broken tls in precise
WGET_ARGS="wget --no-check-certificate"

# download ngx_pagespeed 
cd $STAGE_PATH
${WGET_ARGS} https://github.com/pagespeed/ngx_pagespeed/archive/release-${NPS_VERSION}-beta.zip
unzip release-${NPS_VERSION}-beta.zip

# download psol
cd ngx_pagespeed-release-${NPS_VERSION}-beta/
${WGET_ARGS} https://dl.google.com/dl/page-speed/psol/${NPS_VERSION}.tar.gz
tar -xzvf ${NPS_VERSION}.tar.gz

# modify compile arguments
cd ${SC_PATH}/debian
sed -i "/.\/configure/a --add-module=${STAGE_PATH}/ngx_pagespeed-release-${NPS_VERSION}-beta \\\\" rules

# build package
cd ${SC_PATH}
dpkg-buildpackage

# remove sources
cd ${STAGE_PATH}
rm -fr ${SC_PATH}
rm ${STAGE_PATH}/*.zip

# copy to shared location
cp ${STAGE_PATH}/* ${DEB_PATH}/${CODENAME}