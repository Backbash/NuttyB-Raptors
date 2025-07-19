FROM node:23-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --break-system-packages luaparser

# Install Bun globally (optional if using npm is okay)
RUN npm install -g bun

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json ./
RUN bun install

# Copy scripts and source directories
COPY scripts/ ./scripts/
COPY lua/ ./lua/
COPY base64url/ ./base64url/

# Set default command
ENTRYPOINT ["bun", "run", "./scripts/converter.ts"]
