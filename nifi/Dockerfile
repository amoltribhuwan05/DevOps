# Use the official NiFi image as the base image
FROM apache/nifi:latest

# Switch to root user
USER root
 
# Install Os level Requirments
RUN apt-get update && \
    apt-get install -y build-essential libpq-dev python3-dev python3 libssl-dev libffi-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
# Switch back to nifi user
USER nifi

#add python path
ENV PATH=/opt/myenv/bin:$PATH

# Expose NiFi web UI port
EXPOSE 8080 8443

# Default command to run NiFi
CMD ["./scripts/start.sh"]
