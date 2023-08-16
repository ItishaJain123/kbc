# Base image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm install --force

RUN npm install -g serve

# Copy the entire project to the container
COPY . .

# Build the React app
RUN npm run build

WORKDIR /app/build

# Set the command to start the React app
CMD serve -p 3000