# Use the base image
FROM devopsedu/webapp

# Maintainer information
MAINTAINER Shyam <psgreddy95@gmail.com>

# Update the repository
RUN yum update -y

# Install EPEL repository
RUN yum install -y epel-release

# Add Remi repository for the latest PHP
RUN yum install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm

# Enable Remi's PHP 8.0 repository
RUN yum module reset php -y
RUN yum module enable php:remi-8.0 -y

# Install Apache and PHP 8.0
RUN yum install -y httpd php php-cli php-common php-fpm php-json php-mbstring php-xml php-mysqlnd

# Remove default Apache files
RUN rm -rf /var/www/html/*

# Copy application files
COPY website /var/www/html/

# Expose port 8080
EXPOSE 8080

# Start Apache service
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

