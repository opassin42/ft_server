####################################################################################################################################
#							PREREQUISITE							   	   #
####################################################################################################################################

#image source for the container
ARG VERSION=buster
FROM debian:$VERSION

#Developer info
LABEL maintainer="opassin"

####################################################################################################################################
#						     PACKAGES INSTALLATION						   	   #
####################################################################################################################################

RUN apt-get update 
RUN apt-get -y upgrade
RUN apt-get install -y wget
RUN apt-get install -y php7.3 php7.3-fpm php7.3-mbstring php7.3-cli php7.3-mysql
RUN apt-get install -y nginx
RUN apt-get install -y mariadb-server

####################################################################################################################################
#							SETTING UP							   	   #
####################################################################################################################################

#Copy all source's files to the container
COPY srcs/* ./

#Give rights to the initalisation script
RUN chmod 755 ./init.sh

#Open ports 80 and 443
EXPOSE 80 443

#Launch initialisation script
CMD bash ./init.sh
