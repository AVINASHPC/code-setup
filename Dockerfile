FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the code
COPY . .

# Run the linter, formatter, and tests
RUN npm run lint && npm run test

# Build the application
RUN npm run build

# Expose the port that the app will be running on
EXPOSE 8080

# Start the app
CMD ["npm", "start"]

