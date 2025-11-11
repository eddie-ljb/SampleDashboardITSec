# ===============================
# STAGE 1 — Build Angular App
# ===============================
FROM node:20-alpine AS build

WORKDIR /app

# Paketdateien kopieren und Abhängigkeiten installieren
COPY package*.json ./
RUN npm install -g @angular/cli && npm ci

# Projektdateien kopieren
COPY . .

# Angular App bauen (Production)
RUN npm run build -- --configuration production

# ===============================
# STAGE 2 — Run Nginx
# ===============================
FROM nginx:1.27-alpine

# Standardverzeichnis leeren
RUN rm -rf /usr/share/nginx/html/*

# Angular Build-Ergebnis kopieren
COPY --from=build /app/dist/sakai-ng/browser /usr/share/nginx/html

# Eigene Nginx-Konfiguration einspielen
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
