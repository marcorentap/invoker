#!/bin/bash

# Load environment variables
source .env

# Substitute environment variables in the Nginx template
envsubst '${WEBUI_PORT} ${BACKEND_PORT} ${NGINX_PORT}' <nginx.conf.template >nginx.conf

# Test the Nginx configuration
nginx -t -c $(pwd)/nginx.conf

# Start Nginx with the generated configuration
nginx -c $(pwd)/nginx.conf
