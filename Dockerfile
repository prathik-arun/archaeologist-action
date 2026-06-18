FROM python:3.11-slim

# Install git (needed for git history analysis)
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Install archaeologist
RUN pip3 install archaeologist

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
