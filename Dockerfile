FROM node:16
EXPOSE 8080
WORKDIR /app
COPY / /app
LABEL authors="volodymyr"

ENTRYPOINT ["node", "dist/app.js"]