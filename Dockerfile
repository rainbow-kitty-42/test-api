FROM registry.semaphoreci.com/node:14
RUN chown -R app:app /opt/app
RUN mkdir -p /opt/app
WORKDIR /opt/app
RUN useradd app
COPY addressbook/ .
RUN npm install
USER app
EXPOSE 3000
CMD [ "npm", "run", "pm2" ]