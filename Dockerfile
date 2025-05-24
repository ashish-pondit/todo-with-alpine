FROM node:latest

ENV APP_NAME="Simple Todo"

WORKDIR /app

COPY package-lock.json .
COPY package.json .
RUN npm install

ARG APP_COMMIT_HASH
ARG APP_COMMIT_MESSAGE

ENV APP_COMMIT_HASH=$APP_COMMIT_HASH
ENV APP_COMMIT_MESSAGE=$APP_COMMIT_MESSAGE

COPY public ./public

COPY server.js .

EXPOSE 3000

CMD ["node","server.js"]