FROM node:22-slim

ENV NODE_ENV=production
ENV HOSTNAME=0.0.0.0
ENV PORT=20128
ENV DATA_DIR=/data
ENV INITIAL_PASSWORD=Nr201105

RUN npm install -g omniroute@latest

EXPOSE 20128

CMD ["sh", "-lc", "mkdir -p /data && (printf 'Nr201105\nNr201105\n' | omniroute reset-password || true) && omniroute serve --port 20128 --no-open --no-tray"]
