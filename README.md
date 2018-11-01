# Dockerfile for PWA Starter Kit

Based on [PWA Starter Kit](https://github.com/Polymer/pwa-starter-kit).

The Dockerfile contains three stages: `dev` `prpl` `caddy`

```bash
sudo docker build --target caddy --tag pwa-starter-kit-caddy .
sudo docker run -p 8080:8080 pwa-starter-kit-caddy
```

Open question:
> Does HTTP/2 Push really work wit this?
