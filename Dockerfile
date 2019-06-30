FROM alpine

RUN apk update && apk upgrade
RUN apk add --update nodejs nodejs-npm
RUN apk add php7 php7-fpm php7-opcache
RUN apk add php7-gd php7-mysqli php7-zlib php7-curl php7-json php7-iconv php7-mbstring
RUN apk add php7-phar php7-ctype php7-tokenizer php7-dom php7-fileinfo
RUN apk add php7-simplexml php7-xml php7-xmlreader php7-xmlwriter php7-zip

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
