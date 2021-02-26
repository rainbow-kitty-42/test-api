FROM node:15.10.0-alpine3.10
RUN mkdir -p /opt/app
WORKDIR /opt/app
RUN addgroup app
RUN adduser -S app
COPY addressbook/ .
RUN npm install
RUN chown -R app:app /opt/app/
USER app
EXPOSE 3000
CMD [ "npm", "run", "pm2" ]