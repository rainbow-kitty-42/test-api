FROM registry.semaphoreci.com/node:14
RUN mkdir -p /opt/app
WORKDIR /opt/app
RUN useradd app
COPY addressbook/ .
RUN npm install
RUN chown -R app:app /opt/app
USER app
EXPOSE 3000
CMD [ "sudo", "npm", "run", "pm2" ]