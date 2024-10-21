FROM node:18

# Set working directory
WORKDIR /usr/src/app

# Install netcat-openbsd
RUN apt-get update && apt-get install -y netcat-openbsd

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of your application code
COPY . .

# Copy the wait-for-it script
COPY wait-for-it.sh /usr/local/bin/wait-for-it
RUN chmod +x /usr/local/bin/wait-for-it

# Start the application with wait-for-it
CMD /usr/local/bin/wait-for-it mysql:3306 -- node app.js
