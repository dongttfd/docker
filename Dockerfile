#===========================================
# DOCKERFILE
# Centos7
# Apache 2.4 / PHP 7.4 / MariaDB: 10.4.11
#===========================================
# Build Images: docker build . --rm -t teawork
# Run image: docker run -it -v ${PWD}:/source_code [tag]
FROM centos:7

# Apache
RUN yum -y update \
    # php installation
    && yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm yum-utils \
    && yum-config-manager --disable remi-php54 \
    && yum-config-manager --enable remi-php74 \
    && yum -y install php php-cli php-fpm php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json php-mysql \
    && yum -y install --setopt=tsflags=nodocs bind-utils pwgen psmisc hostname dos2unix