# Use the custom base image from ECR
FROM 123456789012.dkr.ecr.us-east-1.amazonaws.com/nodejs-base:latest


# Copy app files
COPY . /app

WORKDIR /app

# Install dependencies
RUN npm install

# Expose the app port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
