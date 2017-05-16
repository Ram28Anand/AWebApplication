FROM node:6-alpine

MAINTAINER ram28anand@gmail.com

RUN apk add --no-cache \
                   git \
                   openssh \
    && mkdir -p /myapp/ \
    && mkdir -p /root/.ssh/ \
    && mkdir -p /home/app

ADD deploy_key /root/.ssh/deploy_key
RUN chmod 700 /root/.ssh/deploy_key
RUN chown -R root:root /root/.ssh

RUN touch /root/.ssh/known_hosts


RUN git clone https://github.com/Ram28Anand/HelloWorld.git /myapp/
RUN cp -R /myapp/* /home/app/

WORKDIR /home/app
RUN npm install

EXPOSE 3000

ENTRYPOINT ["node","index.js"]
