# Build Stage
FROM node:20 AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build -- --configuration production

# Serve Stage
FROM nginx:alpine
COPY --from=builder /usr/src/app/dist/itsec-sample /usr/share/nginx/html
EXPOSE 80
