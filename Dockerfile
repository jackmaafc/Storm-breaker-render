FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install Nginx, PHP 8.2 & extensions, Python3 & Flask, Node.js, and Supervisor
RUN apt-get update && apt-get install -y \
    nginx \
    php8.2-fpm \
    php8.2-cli \
    php8.2-curl \
    php8.2-gd \
    php8.2-mbstring \
    php8.2-xml \
    python3 \
    python3-flask \
    python3-pip \
    nodejs \
    npm \
    supervisor \
    sed \
    && rm -rf /var/lib/apt/lists/*

# Configure PHP-FPM to listen on TCP 127.0.0.1:9000
RUN sed -i 's|listen = /run/php/php8.2-fpm.sock|listen = 127.0.0.1:9000|' /etc/php/8.2/fpm/pool.d/www.conf

# Setup configs and scripts
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY start.sh /start.sh
RUN sed -i -e 's/\r$//' /start.sh && chmod +x /start.sh

# Copy application directories
COPY ./public_html /var/www/html
COPY ./node-app /var/www/node-app
COPY ./python-app /var/www/python-app

# Install npm dependencies if package.json exists
WORKDIR /var/www/node-app
RUN if [ -f package.json ]; then npm install --omit=dev; fi

WORKDIR /

# Render uses port 10000 by default
EXPOSE 10000

CMD ["/start.sh"]
