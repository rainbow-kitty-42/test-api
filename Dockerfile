FROM registry.semaphoreci.com/node:12
RUN addgroup -g 9999 app && adduser -u 9999 -G app -D app -s /bin/bash \
    && apk upgrade --update \
    && apk add --no-cache \
        bash bash-completion \
        git

COPY ./bash/.bash* /home/app/

USER app
ENV HOME=/home/app/
WORKDIR $HOME

RUN mkdir -p /home/app/.npm-global/bin \
    && npm config set prefix '/home/app/.npm-global' \
    && npm install -g pm2

ENV PATH=/home/app/.npm-global/bin:${PATH}

RUN mkdir -p /opt/app/
WORKDIR /opt/app
# RUN useradd app
COPY addressbook/ .
RUN npm install
RUN chown -R app:app /opt/app
# USER app
EXPOSE 3000
CMD [ "npm", "run", "pm2" ]