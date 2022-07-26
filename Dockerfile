#FROM docker.io/node:fermium as builder
FROM registry.access.redhat.com/rhscl/nodejs-8-rhel7:1-11

#WORKDIR /opt/app-root
#WORKDIR /app
ARG NPMRC_CUSTOM
USER 1001
RUN bash -c "npm install pm2 -g" && \
#bash -c "pm2 install typescript" && \
fix-permissions /app
#fix-permissions /opt/app-root

ARG BUILD_ENV

ARG api 

# Possible Targets: production, staging, development
ENV BUILD_ENV=${BUILD_ENV:-development}


#RUN apt-get update
#RUN apt-get install libnss3-dev -y
#RUN apt-get install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget libgbm1

COPY package.json package-lock.json ./

#RUN npm install 
#RUN npm install pm2 -g

COPY . .

#RUN chown -R 1001:0 /tmp/

#RUN chmod -R 775 /app

#USER 1000

EXPOSE 8080

#RUN echo $NPMRC_CUSTOM > ~/.npmrc
#CMD ["sh", "-c", "pm2-runtime --json config-start.json"]
#CMD ["sh", "-c", "pm2-runtime"]
