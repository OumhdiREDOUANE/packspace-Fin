FROM node:20-alpine

WORKDIR /app

COPY package.json package-lock.json ./

RUN --mount=type=cache,target=/root/.npm \
    npm ci --prefer-offline

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["sh", "-c", "npm run build && npm start"]