# wunder/fuzzy-alpine-varnish
#
# VERSION v4.1.2-0
#
FROM quay.io/wunder/fuzzy-alpine-base:v3.4
MAINTAINER aleksi.johansson@wunder.io

# Add our start.sh script that starts varnish.
ADD start.sh /start.sh

# Update the package repository and install applications.
RUN apk --no-cache --update add varnish && \
    rm -rf /tmp/* && \
    rm -rf /var/cache/apk/* && \
    chmod 755 /start.sh

# Make our default VCL available on the container.
ADD etc/varnish/default.vcl /etc/varnish/default.vcl

# Configure the backend.
# @TODO: Add support for HTTPS.
ENV VARNISH_BACKEND_PORT 80
ENV VARNISH_BACKEND_HOST 192.168.1.1
ENV VARNISH_PORT 80
ENV VARNISH_MEMORY 100M

# Expose HTTP and HTTPS ports.
EXPOSE 80 443

#
CMD ["/start.sh"]
