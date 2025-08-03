FROM node:18.20.6-buster

COPY graphserver.js .
COPY package.json .
COPY UScities.json .

RUN apt-get update && \
    apt-get upgrade -y && \
    npm install && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 4000

CMD ["node", "graphserver.js"]
