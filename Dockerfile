FROM node:alpine as builder

WORKDIR /app
COPY package.json .
RUN npm i
COPY . .
RUN npm run build
# all the stuff will be in /app/build

# next step
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html