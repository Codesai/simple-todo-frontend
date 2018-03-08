FROM nginx:1.13.9-alpine

RUN apk update
RUN apk add nodejs
RUN apk add yarn
RUN yarn global add create-react-app

WORKDIR /www

COPY package.json .
RUN yarn install

COPY . .

RUN yarn build