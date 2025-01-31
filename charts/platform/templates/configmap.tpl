kind: ConfigMap
apiVersion: v1
metadata:
  name: {{ include "platform.fullName" . }}-nginx-conf
data:
  nginx.conf: |
    worker_processes auto;

    pid /tmp/platform/nginx.pid;

    error_log /tmp/platform/nginx.error_log info;

    events {
        worker_connections 2000;
        use epoll;
        multi_accept on;
    }

    http {
        resolver 127.0.0.11 ipv6=off;

        client_body_temp_path /tmp/platform/client_body;
        proxy_temp_path /tmp/platform/proxy;
        fastcgi_temp_path /tmp/platform/fastcgi;
        uwsgi_temp_path /tmp/platform/uwsgi;
        scgi_temp_path /tmp/platform/scgi;

        # Increased buffer sizes
        client_header_buffer_size 64k;
        large_client_header_buffers 8 64k;
        client_body_buffer_size 128k;
        client_max_body_size 10m;

        # Logging configuration
        log_format main '$remote_addr - $remote_user [$time_local] '
                      '"$request" $status $bytes_sent '
                      '"$http_referer" "$http_user_agent" '
                      '"$gzip_ratio"';

        # Client timeout configuration
        client_header_timeout 3m;
        client_body_timeout 3m;
        send_timeout 3m;
        keepalive_timeout 75s;
        keepalive_requests 100;

        # Compression configuration
        gzip on;
        gzip_min_length 1100;
        gzip_buffers 4 8k;
        gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

        # Performance optimization
        output_buffers 1 32k;
        postpone_output 1460;
        sendfile on;
        tcp_nopush on;
        tcp_nodelay on;

        # Upstream definitions for backend services - using Docker service names
        upstream frontend_upstream {
            server localhost:3001;  # Platform service frontend - corrected port
            keepalive 32;
        }

        upstream api_upstream {
            zone api_upstream 64k;
            server localhost:4444;  # Platform service API
            keepalive 32;
        }

        upstream storage_upstream {
            server localhost:4445;  # Platform service storage
            keepalive 32;
        }

        server {
            listen 3000;
            access_log /tmp/platform/nginx.access_log main;

            # Frontend proxy
            location / {
                proxy_pass http://frontend_upstream/;
                proxy_redirect off;
                proxy_http_version 1.1;
                proxy_set_header Connection "";
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;

                # Increased buffer sizes for headers
                proxy_buffer_size 64k;
                proxy_buffers 8 64k;
                proxy_busy_buffers_size 128k;

                proxy_connect_timeout 70s;
                proxy_send_timeout 90s;
                proxy_read_timeout 90s;

                # Error handling
                proxy_next_upstream error timeout http_502 http_503 http_504;
                proxy_next_upstream_tries 2;
            }

            # API proxy
            location /api/ {
                proxy_pass http://api_upstream/;
                proxy_redirect off;
                proxy_http_version 1.1;
                proxy_set_header Connection "";
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;

                # Increased buffer sizes for headers
                proxy_buffer_size 64k;
                proxy_buffers 8 64k;
                proxy_busy_buffers_size 128k;

                proxy_connect_timeout 70s;
                proxy_send_timeout 90s;
                proxy_read_timeout 90s;

                # Error handling
                proxy_next_upstream error timeout http_502 http_503 http_504;
                proxy_next_upstream_tries 2;
            }

            # Public health check endpoint
            location = /api/health {
                access_log off;
                proxy_pass http://api_upstream/healthcheck;
                proxy_redirect off;

                # Increased buffer sizes for headers
                proxy_buffer_size 64k;
                proxy_buffers 8 64k;
                proxy_busy_buffers_size 128k;
            }

            # SAML proxy
            location /saml/ {
                proxy_pass http://api_upstream/saml/;
                proxy_redirect off;
                proxy_http_version 1.1;
                proxy_set_header Connection "";
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;

                # Increased buffer sizes for headers
                proxy_buffer_size 64k;
                proxy_buffers 8 64k;
                proxy_busy_buffers_size 128k;

                proxy_connect_timeout 70s;
                proxy_send_timeout 90s;
                proxy_read_timeout 90s;

                # Error handling
                proxy_next_upstream error timeout http_502 http_503 http_504;
                proxy_next_upstream_tries 2;
            }

            # Storage proxy
            location /storage/ {
                proxy_pass http://storage_upstream/;
                proxy_redirect off;
                proxy_http_version 1.1;
                proxy_set_header Connection "";
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;

                # Increased buffer sizes for headers
                proxy_buffer_size 64k;
                proxy_buffers 8 64k;
                proxy_busy_buffers_size 128k;

                proxy_connect_timeout 70s;
                proxy_send_timeout 90s;
                proxy_read_timeout 90s;

                # Error handling
                proxy_next_upstream error timeout http_502 http_503 http_504;
                proxy_next_upstream_tries 2;
            }
        }
    }
---
{{- if .Values.otelCollector.enabled }}
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "platform.fullName" . }}-otel-collector-config
  labels:
    {{- include "platform.labels" . | nindent 4 }}
data:
  collector.yaml: |-
    {{ .Files.Get "config/otel-config.yaml" | nindent 4 }}
{{- end }}