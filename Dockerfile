FROM node:23-alpine3.20 AS builder
WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node:23-alpine3.20 AS server
RUN npm install -g serve
EXPOSE 3000
COPY --from=builder /app/dist/ /dist
ENTRYPOINT ["serve", "dist"]


