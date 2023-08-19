# Use an official Node.js runtime as the base image
FROM node

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Install NGINX
RUN apt-get update && apt-get install -y nginx

# Replace the default NGINX configuration
COPY nginx/default.conf /etc/nginx/sites-available/default

# Expose the ports for Node.js and NGINX
EXPOSE 3000 80

# Start both Node.js and NGINX
CMD ["sh", "-c", "service nginx start && node index.js"]


