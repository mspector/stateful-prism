FROM node:19-alpine3.15
COPY ./ ./
RUN npm install -g @stoplight/prism-cli
EXPOSE 3000
