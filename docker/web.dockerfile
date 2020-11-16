FROM teawork

ADD /conf/vhosts.conf /etc/httpd/conf.d/teawork.conf
ADD /conf/php.ini /etc/php.ini

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    # Node
    && yum install -y nodejs \
    && yum -y update && yum clean all \
    && yum -y install httpd \
    && systemctl enable httpd.service \
    && dos2unix /etc/httpd/conf.d/teawork.conf \
    && dos2unix /etc/php.ini \
    && echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf \ 
    && systemctl enable httpd.service \
    # Check
    && httpd -v \
    && php -v \
    && composer -v \
    && node -v \
    && npm -v

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
