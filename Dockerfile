# Dockerfile for PO Processing Bot
# Extends the official n8n image with no additional dependencies needed
# (all logic runs inside n8n workflows)
#
# For most use cases, docker-compose.yml is sufficient.
# Use this Dockerfile if you need a custom build (e.g. adding npm packages for Code nodes).

FROM n8nio/n8n:latest

# Switch to root to install any additional tools if needed
USER root

# (Optional) Install additional system packages here
# RUN apk add --no-cache some-package

# Switch back to node user
USER node

# Expose n8n port
EXPOSE 5678

# Default command
CMD ["n8n", "start"]
