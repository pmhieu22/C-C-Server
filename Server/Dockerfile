FROM node:lts-buster-slim AS development
WORKDIR /usr/src/app

COPY package.json /usr/src/app/package.json
COPY package-lock.json /usr/src/app/package-lock.json
RUN npm i
RUN npm ci
COPY . /usr/src/app/
CMD [ "npm", "start" ]



