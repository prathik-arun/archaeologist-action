FROM python:3.11-slim

# Install git and curl
RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

# Install archaeologist
RUN pip3 install archaeologist

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
