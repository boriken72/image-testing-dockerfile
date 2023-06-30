# Build website for testing
FROM ubuntu 
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update 
RUN apt install apache2 -y
RUN apt install apache2-utils -y 
RUN apt clean 
EXPOSE 80
RUN mkdir -p /var/www/datascience.com/public_html
RUN chmod -R 755 /var/www
RUN chown -R www-data:www-data /var/www/datascience.com
COPY files/datascience.com.conf /etc/apache2/sites-available/datascience.com.conf
COPY files/index-com.html /var/www/datascience.com/public_html/index.html
RUN a2ensite datascience.com.conf
CMD ["apache2ctl", "-D", "FOREGROUND"]
