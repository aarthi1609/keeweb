# Ubuntu as base image
FROM ubuntu:latest

# Update package lists and install packages
RUN apt-get update && \
    apt-get install -y apache2 wget unzip

#Download keeweb
RUN wget -O keeweb.zip https://github.com/keeweb/keeweb/archive/refs/tags/v1.18.7.zip && \
    unzip keeweb.zip -d /var/www/html/ && \
    mv /var/www/html/keeweb-1.18.7/* /var/www/html/ && \
    chown -R www-data:www-data /var/www/html/

# Expose port 
EXPOSE 80
EXPOSE 443

# Start Apache service
CMD ["apache2ctl", "-D", "FOREGROUND"]