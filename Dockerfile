FROM node:12.18.1 as build-deps
WORKDIR /usr/src/app

COPY package.json package-lock.json ./
RUN rm -rf node_modules
RUN npm i && \
  chown -Rh node:node /usr/src/app/node_modules

COPY . ./

RUN npm run build

EXPOSE 8080

CMD [ "node", "dist/main.js" ]