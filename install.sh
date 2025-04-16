sudo curl -o /etc/apt/trusted.gpg.d/angie-signing.gpg \
            https://angie.software/keys/angie-signing.gpg
echo "deb https://download.angie.software/angie/$(. /etc/os-release && echo "$ID/$VERSION_ID $VERSION_CODENAME") main" \
    | sudo tee /etc/apt/sources.list.d/angie.list > /dev/null
sudo apt update
sudo apt install -y angie angie-module-{jwt,zip,brotli,zstd,dynamic-limit-req,echo,enhanced-memcached,geoip2,eval,headers-more,subs,testcookie,upload,xslt,cache-purge,auth-jwt}
sudo service angie stop
sudo cp -r angie/* /etc/angie/
sudo ln -s -t /etc/angie /usr/lib/angie/modules
sudo angie -t
sudo service angie start
sudo mkdir -p /var/log_old/angie/
sudo mkdir -p /var/www
