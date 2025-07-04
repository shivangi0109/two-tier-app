# This Dockerfile is used to containerize your React frontend application so it can run consistently in any environment (e.g., local, CI/CD, Kubernetes).

# Use a lightweight Node.js image
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host"]