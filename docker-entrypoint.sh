#!/bin/bash

# Función para generar el archivo HTML con las variables de entorno
generate_html() {
    cat <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Variables de Entorno</title>
</head>
<body>
    <h1>Variables de Entorno</h1>
    <ul>
EOF

    # Genera cada variable de entorno como un elemento de lista HTML
    env | while IFS= read -r line; do
        echo "        <li>$line</li>"
    done

    cat <<EOF
    </ul>
</body>
</html>
EOF
}

# Genera el archivo HTML
generate_html > /usr/share/nginx/html/index.html

# Inicia fcgiwrap en el fondo si es necesario
spawn-fcgi -s /var/run/fcgiwrap.socket -M 766 /usr/sbin/fcgiwrap

# Inicia Nginx en primer plano
nginx -g "daemon off;"
