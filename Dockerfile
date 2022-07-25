#FROM docker.io/node:fermium as builder
FROM ubi8/nodejs-14


#ARG BUILD_ENV

#ARG api 


#RUN echo $BUILD_ENV

# Possible Targets: production, staging, development
#ENV BUILD_ENV=${BUILD_ENV:-development}


#RUN apt-get update
#RUN apt-get install libnss3-dev -y
#RUN apt-get install -y gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget libgbm1


#WORKDIR /app

#COPY package.json package-lock.json ./

#RUN npm install 
#RUN npm install pm2 -g

#COPY . .

#RUN chown -R 1001:0 /tmp/

#RUN chmod -R 775 /app

#USER 0

#EXPOSE 8080


#CMD ["sh", "-c", "pm2-runtime --json config-start.json"]

USER 0
ADD . /tmp/src


COPY package.json package-lock.json ./

RUN chown -R 1001:0 /tmp/src

USER 1001

# Install the dependencies
RUN /usr/libexec/s2i/assemble

RUN npm install pm2 -g

COPY . .

RUN npm install

EXPOSE 3001

# Set the default command for the resulting image
CMD /usr/libexec/s2i/run

