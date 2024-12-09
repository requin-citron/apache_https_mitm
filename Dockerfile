FROM debian:latest


RUN mkdir -p /certs
RUN apt update -y && apt install -y \
apache2 && \
a2enmod ssl proxy proxy_http headers dump_io

COPY ./website.conf /etc/apache2/sites-available/website.conf
RUN a2ensite website

COPY ./entry.sh /entry.sh
RUN chmod +x /entry.sh

EXPOSE 443
CMD ["/entry.sh"]