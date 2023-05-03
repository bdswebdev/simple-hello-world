FROM node:20-alpine3.16

WORKDIR /usr/src/app
COPY package*.json ./

RUN npm install -g npm@9.6.5
RUN npm install

COPY ./src/ .

EXPOSE 8080

CMD [ "node", "server.js" ]