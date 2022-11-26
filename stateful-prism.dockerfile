FROM node:19-alpine3.15
RUN apk add curl
COPY ./ ./
RUN npm install -g @stoplight/prism-cli
EXPOSE 3000
