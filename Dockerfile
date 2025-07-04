# This Dockerfile is used to containerize your React frontend application so it can run consistently in any environment (e.g., local, CI/CD, Kubernetes).

# Use a lightweight Node.js image
FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine

COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]