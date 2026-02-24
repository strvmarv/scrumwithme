FROM node:20-alpine AS builder

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install

COPY . .
RUN npx grunt build

FROM node:20-alpine

WORKDIR /app
COPY --from=builder /app/build/ ./
RUN npm install --omit=dev

EXPOSE 4000
ENTRYPOINT ["node", "app/app.js"]
