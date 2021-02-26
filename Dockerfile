FROM registry.semaphoreci.com/node:12
RUN mkdir -p /opt/app
WORKDIR /opt/app
RUN useradd app
COPY addressbook/ .
RUN npm install
RUN sudo chown -R app:app /opt/app
RUN sudo chown -R app:app opt/app/.pm2
USER app
EXPOSE 3000
CMD [ "npm", "run", "pm2" ]