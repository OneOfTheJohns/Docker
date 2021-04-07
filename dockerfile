FROM nginx:alpine AS builder

RUN apk add --update nodejs npm

RUN apk add --update npm

WORKDIR /usr/share/nginx/

COPY . .

RUN npm install

RUN npm run ng build -- --output-path=/usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]