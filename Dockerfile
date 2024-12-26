# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .
          
# Expose the port the app runs on
EXPOSE 3000

# Define the health check
HEALTHCHECK --interval=1m --timeout=5s CMD curl -f http://localhost:3000/ || exit 1

# Define the command to run the app
CMD [ "node", "app.js" ]
