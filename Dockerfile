FROM node:22-alpine AS client
WORKDIR /app/client
COPY client/package*.json ./
RUN npm install
COPY client/ ./
RUN npm run build

FROM node:22-alpine
WORKDIR /app
COPY server/package*.json server/
RUN npm install --prefix server --omit=dev
COPY server/ server/
COPY db/ db/
COPY --from=client /app/client/dist client/dist
ENV NODE_ENV=production PORT=3000
EXPOSE 3000
CMD ["node", "server/src/index.js"]
