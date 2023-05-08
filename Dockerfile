FROM node:18-alpine as phase1
WORKDIR /app
COPY package.json ./
RUN npm i
COPY . .
RUN npm run build 


FROM nginx
COPY --from=phase1 ./app/build /usr/share/nginx/html
