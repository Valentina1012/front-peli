FROM node:18-alpine AS image-node

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine AS production
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=image-node /app/dist /usr/share/nginx/html/unahur-front/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]