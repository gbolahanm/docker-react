
#Build Phase
FROM node:16-alpine as builder 
WORKDIR /app
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

#Run Phase Note: The From statements specify the beginning of a new block
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
