server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /usr/local/var/www;
    index index.php index.html index.htm index.nginx-debian.html;

    server_name localhost;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {

        include        /usr/local/etc/nginx/fastcgi_params;
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME $document_root/$fastcgi_script_name;
    }

    location ~ /\.ht {
        deny all;
    }
}