FROM node:24-trixie-slim
WORKDIR /app
ENV NODE_ENV=production
ENV PORT=20128
ENV DATA_DIR=/app/data
ENV OMNIROUTE_MEMORY_MB=1024
ENV NODE_OPTIONS=--max-old-space-size=1024
RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates libsecret-1-0 python3 make g++ \
  && rm -rf /var/lib/apt/lists/* \
  && npm install -g --no-audit --no-fund omniroute@latest \
  && mkdir -p /app/data
EXPOSE 20128
CMD ["omniroute", "serve", "--port", "20128", "--no-open", "--no-tray"]
