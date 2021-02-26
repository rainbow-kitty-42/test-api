FROM registry.semaphoreci.com/node:12
RUN mkdir -p /opt/app
WORKDIR /opt/app
RUN useradd app
COPY addressbook/ .
RUN chown -R app:app ~/.pm2.
RUN chown -R app:app /opt/app
RUN npm install
USER app
EXPOSE 3000
CMD [ "npm", "run", "pm2" ]