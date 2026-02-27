FROM node:18 AS build

WORKDIR /app

COPY /frontend/package*.json  ./

RUN npm install

COPY /frontend/  .

RUN npm run build -- --configuration production


FROM nginx:alpine

COPY /nginx/default.conf  /etc/nginx/conf.d/default.conf

COPY --from=build  /app/dist/angular-15-crud/ /usr/share/nginx/html/

