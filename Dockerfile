# Build phase
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

# Run phase
FROM nginx
# /usr/share...etc is a specific nginx directory
COPY --from=builder ./app/build /usr/share/nginx/html
# Default command for nginx is start
