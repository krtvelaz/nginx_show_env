FROM nginx:1.27-alpine

# Instala bash y fcgiwrap si es necesario
RUN apk update && apk add --no-cache bash fcgiwrap spawn-fcgi

# Copia el script de inicio
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080
ENTRYPOINT ["/docker-entrypoint.sh"]
