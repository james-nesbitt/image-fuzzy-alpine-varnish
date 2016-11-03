# image-fuzzy-alpine-varnish

Fuzzy as in reference to the https://en.wikipedia.org/wiki/The_Mythical_Man-Month book where Fred describes the approach of "write one to throw away" as the best start.

Varnish on Alpine.

Maintained by: Aleksi Johansson <aleksi.johansson@wunder.io>

## Docker

### Image

This image is available publicly at:

- quay.io/wunder/fuzzy-alpine-varnish : [![Docker Repository on Quay](https://quay.io/repository/wunder/fuzzy-alpine-varnish/status "Docker Repository on Quay")](https://quay.io/repository/wunder/fuzzy-alpine-varnish)

### Base

This image is based on the fuzzy-alpine-base image https://github.com/wunderkraut/image-fuzzy-base.

### Modifications

This image adds the following files:

#### /etc/varnish/default.vlc

This is a custom varnish configuration:

1. Configured default backends.

## Using this Image

There is no point in running this container as an independent service. Map any needed services such as php-fpm backend and mount any source code volumes to whatever path needed. Also point the backend by setting the environment variable:

```
$/> docker run -d \
      -v "$(pwd):/app/web" \
      -l "my_running_fpm_container:fpm.app" \
      -e VARNISH_BACKEND_HOST=fpm.app \
      quay.io/wunder/fuzzy-alpine-varnish
```
