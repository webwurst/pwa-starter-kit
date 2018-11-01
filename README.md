# Dockerfile for PWA Starter Kit

Based on [PWA Starter Kit](https://github.com/Polymer/pwa-starter-kit).

The Dockerfile contains three stages: `dev` `prpl` `caddy`

```bash
sudo docker-compose up --build
```

`HTTP/1.1`
- [dev](http://localhost:8080/)
- [prpl](http://localhost:8081/)

`HTTP/2.0`
- [prpl-caddy](https://localhost:8082/)
- [caddy](https://localhost:8083/)
