# Stage 1: Builder
FROM node:23-alpine AS builder

WORKDIR /app

# Install dependencies
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

# Copy source code and build
COPY . .
RUN yarn build

# Stage 2: Runner
FROM cgr.dev/chainguard/nginx:latest AS runner

# Copy custom nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy built assets from the builder stage to Nginx's default serving directory
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose the port
EXPOSE 8080

# Command to run Nginx
CMD ["-g", "daemon off;"]
