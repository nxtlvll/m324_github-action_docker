FROM node:14 AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine

COPY --from=build /app/buld /usr/share/nxginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]