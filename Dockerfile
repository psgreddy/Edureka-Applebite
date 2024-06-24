# Use the base image

FROM devopsedu/webapp



# Maintainer information

MAINTAINER shyam <psgreddy95@gmail.com>



# Update the repository

RUN apt-get update -y



# Install Apache

RUN apt-get install -y apache2



# Install PHP Modules

RUN apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-cli php7.0-common



# Remove default Apache files

RUN rm -rf /var/www/html/*



# Copy application files

COPY website /var/www/html/



# Expose port 8080

EXPOSE 8080



# Start Apache service

CMD ["/usr/bin/apachectl", "-D", "FOREGROUND"]





