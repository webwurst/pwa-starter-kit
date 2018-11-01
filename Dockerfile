FROM node:10-alpine as dev

WORKDIR /usr/src/app
COPY package.json /usr/src/app
COPY package-lock.json /usr/src/app
RUN npm install
COPY . /usr/src/app
# RUN npm run test

CMD ["npm", "start", "--", "--hostname=0.0.0.0", "--port=8080"]

# ---

FROM node:10-alpine as prpl
WORKDIR /usr/src/app
COPY --from=dev /usr/src/app /usr/src/app
RUN npm run build:prpl-server

CMD ["npm", "run", "serve:prpl-server", "--", "--host=0.0.0.0"]

# ---

FROM giantswarm/caddy:v0.11.0-test2-slim as caddy
COPY --from=prpl /usr/src/app/server/build/es5-bundled /var/www/es5-bundled

USER root
RUN cp /var/www/es5-bundled/index.html /var/www/

RUN echo $'\n\
:8080\n\
gzip\n\
log stdout\n\
errors stdout\n\
root /var/www\n\
tls self_signed\n\
push\n'\
> /etc/caddy/Caddyfile

# rewrite {
#     if {path} not_match ^/api
#     to {path} {path} /index.html
# }

USER caddy
