# Dockerfile DEFINITIVO - basado en imagen oficial de n8n

FROM n8nio/n8n:latest

USER root

# Instalar Chromium y dependencias
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont

# Variables de entorno para Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Instalar Puppeteer en el directorio de n8n
RUN cd /usr/local/lib/node_modules/n8n && \
    npm install puppeteer@21.0.0

# Volver a usuario node
USER node

# El CMD ya está definido en la imagen base de n8n
