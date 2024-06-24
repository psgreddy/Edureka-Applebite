# Use the base image

FROM devopsedu/webapp



# Maintainer information

MAINTAINER shyam <psgreddy95@gmail.com>



# Update the repository

RUN apt-get update -y



# Install Apache

RUN apt-get install -y apache2



# Install PHP 8.2 and necessary modules

RUN apt-get install -y php8.2 libapache2-mod-php8.2 php8.2-cli php8.2-common



# Remove default Apache files

RUN rm -rf /var/www/html/*



# Copy application files

COPY website /var/www/html/



# Expose port 80

EXPOSE 80



# Start Apache service

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]


