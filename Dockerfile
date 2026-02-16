FROM node:18-alpine

# Instalar dependencias del sistema
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    freetype-dev \
    harfbuzz \
    ca-certificates \
    ttf-freefont

# Variables de entorno para Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Instalar n8n globalmente
RUN npm install -g n8n

# Instalar Puppeteer
RUN npm install -g puppeteer@21.0.0

# Directorio de trabajo
WORKDIR /data

# Usuario
USER node

# Puerto
EXPOSE 5678

# Comando
CMD ["n8n"]
