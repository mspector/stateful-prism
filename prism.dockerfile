FROM node:19-alpine3.15
RUN npm install -g @stoplight/prism-cli
EXPOSE 4010
