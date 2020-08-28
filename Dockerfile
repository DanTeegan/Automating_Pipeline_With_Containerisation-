# select base image to build our own customised node app microservice

#FROM node:alpine

# working directory inside the container

#WORKDIR /usr/src/app

# copy dependencies

#COPY package*.json ./

# Install npm

#RUN npm install

# copy everything from current location to default location inside the container

#COPY . .

# define the port

#EXPOSE 3000

# start the app with CMD

#CMD ["node","app.js"]


# Use the base image
FROM node AS app

# Define the working DIR inside the container
WORKDIR /usr/src/app

# Copy dependencies
COPY package*.json ./

# Install NPM

RUN npm install

# Copy everything rom os to container
COPY . .


# Second stage of our build for production - multi stage docker build

FROM node:alpine

# Copy only essential things to this layer
COPY --from=app /usr/src/app /usr/src/app
# This is the magic line that compresses the size and still provides full functionality
#Define the workdir in the second stage
WORKDIR /usr/src/app


# Expose the port

EXPOSE 3000

# Run the app with cmd
CMD ["node", "app.js"]
