# Use the custom base image from ECR
FROM 111376855663.dkr.ecr.ca-central-1.amazonaws.com/node-base:latest


# Copy app files
COPY . /app

WORKDIR /app

# Install dependencies
# Install dependencies including devDependencies
RUN npm install --include=dev

# Expose the app port
EXPOSE 3000

# Start the app
# CMD ["npm", "start"]
CMD ["node", "index.js"]
