FROM node:latest

ENV APP_NAME="Simple Todo"

WORKDIR /app

COPY package-lock.json .
COPY package.json .
RUN npm install

COPY public ./public

COPY server.js .

EXPOSE 3000

CMD ["node","server.js"]