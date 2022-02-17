# Base image for the container
FROM node:15.6.0-alpine3.11 
# Setting the working directory of the container
WORKDIR /app
# Copy all package files
COPY nodejs/package*.json /app/
# Run npm install
RUN npm install
# Copy server.js
COPY nodejs/server.js .
# Expose 3000 port of the container
EXPOSE 3000
# Starting the application
CMD [ "node", "server.js" ]