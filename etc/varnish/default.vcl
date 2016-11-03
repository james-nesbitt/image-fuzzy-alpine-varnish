vcl 4.0;

# Default backend definition.
backend default {
    .host = "${VARNISH_BACKEND_HOST}";
    .port = "${VARNISH_BACKEND_PORT}";
}
