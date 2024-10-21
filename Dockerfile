# Use the official Node.js image
FROM node:18

# Create and set the working directory inside the container
WORKDIR /usr/src/app

RUN apt-get update && apt-get install -y netcat-openbsd

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

COPY wait-for-it.sh /usr/local/bin/wait-for-it
RUN chmod +x /usr/local/bin/wait-for-it

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["wait-for-it", "mysql:3306", "--", "node", "app.js"]

