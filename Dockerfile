# Dockerfile para n8n con Puppeteer en Railway

FROM n8nio/n8n:latest

USER root

# Instalar dependencias de Chromium
RUN apk add --no-cache \
    chromium \
    chromium-chromedriver \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nodejs \
    npm

# Variables de entorno para Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Crear directorio para n8n
WORKDIR /data

# Instalar Puppeteer globalmente
RUN npm install -g puppeteer@21.0.0 --unsafe-perm=true --allow-root

# Dar permisos
RUN chmod -R 755 /usr/lib/node_modules/puppeteer/.local-chromium

# Volver a usuario node
USER node

# Exponer puerto
EXPOSE 5678

# Comando de inicio
CMD ["n8n"]
