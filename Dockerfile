# ===============================
# STAGE 1 — Build Angular App
# ===============================
FROM node:20 AS build

WORKDIR /app

# System-Tools für native Module
RUN apt-get update && apt-get install -y python3 g++ make && rm -rf /var/lib/apt/lists/*

# Paketdateien kopieren
COPY package*.json ./

# Sicheres Dependency-Install
RUN npm install

# Quellcode kopieren
COPY . .

# Angular-Build (lokale CLI wird automatisch verwendet)
RUN npm run build -- --configuration production

# ===============================
# STAGE 2 — Serve mit Nginx
# ===============================
FROM nginx:1.27-alpine

# Default-HTML löschen
RUN rm -rf /usr/share/nginx/html/*

# Build-Output kopieren
COPY --from=build /app/dist/sakai-ng/browser /usr/share/nginx/html

# Eigene Nginx-Konfiguration
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
