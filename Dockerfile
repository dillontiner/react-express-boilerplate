FROM node:carbon

COPY client/ /client/
COPY server/ /server/
COPY package.json /

EXPOSE 5000

ENTRYPOINT npm install && npm start
