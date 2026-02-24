FROM node:20-alpine

WORKDIR /app
COPY app/ ./app/
COPY public/ ./public/
COPY package.json package-lock.json ./
RUN npm install --omit=dev

EXPOSE 4000
ENTRYPOINT ["node", "app/app.js"]
