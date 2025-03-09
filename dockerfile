FROM node:18-alpine AS image-node

WORKDIR /app

COPY package*.json ./

RUN npm install

copy . .

RUN npm run build

FROM nginx:alpine AS production

COPY --from=image-node /app/dist /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]