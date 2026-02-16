# Dockerfile para n8n oficial (Debian) con Puppeteer

FROM n8nio/n8n:latest

USER root

# Actualizar e instalar Chromium y dependencias (Debian/Ubuntu)
RUN apt-get update && \
    apt-get install -y \
    chromium \
    chromium-driver \
    fonts-liberation \
    libnss3 \
    libxss1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libx11-xcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Variables de entorno para Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Instalar Puppeteer en el directorio de n8n
RUN cd /usr/local/lib/node_modules/n8n && \
    npm install puppeteer@21.0.0

# Volver a usuario node
USER node

# El CMD ya está definido en la imagen base
