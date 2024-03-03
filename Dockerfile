# Use official Node.js image as base for building
FROM node:20.9.0 as build

# Set working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the React app
RUN npm run build

# Use NGINX as the web server
FROM nginx:alpine

# Copy build files from the build stage to NGINX directory
COPY --from=build /usr/src/app/build /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Command to run NGINX
CMD ["nginx", "-g", "daemon off;"]
