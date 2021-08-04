FROM ubuntu:20.04

WORKDIR /app

COPY package.json /app

RUN apt-get update
RUN apt-get -y install curl gnupg
RUN curl -sL https://deb.nodesource.com/setup_14.x  | bash -
RUN apt-get -y install nodejs

RUN npm install -D nodemon

RUN npm install

COPY . /app

EXPOSE 8000

VOLUME [ "/app/node_modules" ]

CMD [ "npm", "start" ]