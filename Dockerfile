# ===============================
# STAGE 1 — Build Angular App
# ===============================
FROM node:20-alpine AS build

WORKDIR /app

# 1. Nur package-Dateien kopieren
COPY package*.json ./

# 2. Dependencies installieren (sicherer als mit global Angular CLI)
RUN if [ -f package-lock.json ]; then npm ci; else npm install; fi

# 3. Quellcode kopieren
COPY . .

# 4. Angular App bauen
RUN npx ng build --configuration production

# ===============================
# STAGE 2 — Serve mit Nginx
# ===============================
FROM nginx:1.27-alpine

# Build-Ergebnis kopieren
COPY --from=build /app/dist/sakai-ng/browser /usr/share/nginx/html

# Eigene Nginx-Konfiguration
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
