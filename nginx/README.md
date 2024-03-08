# NGINX

This contains **nginx's _conf.d_ directory** which is being mount by docker compose on to frontend container's path: `/etc/nginx/conf.d`.

So, any servers defined in files with extension **.conf** inside `./nginx/conf.d` dir will be mounted on to frontend container and read by nginx when it's loading its configuration.
