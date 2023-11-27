# Use an official Node.js runtime as a parent image
# -alpine voor meer optimalizatie
FROM node:18.18.0 

# Set the working directory in the container to /app
WORKDIR /app

# Copy only package.json and yarn.lock to the container
COPY package.json yarn.lock ./

# Install application dependencies in a separate layer
RUN yarn install --frozen-lockfile

# Copy the rest of the application code to the container
COPY . .

# Expose port 3000 to the outside world
EXPOSE 3000

# Command to run the application when the container is started
CMD ["yarn", "start"]