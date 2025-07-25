# Build stage
FROM debian:latest AS build-env

# Install necessary build dependencies
# RUN sudo apt-get update && apt-get install -y curl git unzip xz-utils zip  libglu1-mesa openjdk-11-jdk

# carpeta flutter
RUN mkdir /usr/local/flutter

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git 
ENV PATH="/flutter/bin:${PATH}"
RUN flutter doctor -v
RUN flutter channel stable
RUN flutter upgrade

# Set up the app
WORKDIR /app
COPY . .

# Get app dependencies
RUN flutter pub get

# Build the app for the web
RUN flutter build web --wasm

# Production stage
FROM nginx:1.21.1-alpine

# Copy the built web app to the nginx html directory
COPY --from=build-env /app/build/web /usr/share/nginx/html

# Copy custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"] 