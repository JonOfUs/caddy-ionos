# Build stage
ARG CADDY_VERSION
FROM caddy:${CADDY_VERSION}-builder AS builder

# Build Caddy with the Ionos DNS module
RUN xcaddy build \
    --with github.com/caddy-dns/ionos

# Final stage
FROM caddy:${CADDY_VERSION}

# Copy the custom-built Caddy binary
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
