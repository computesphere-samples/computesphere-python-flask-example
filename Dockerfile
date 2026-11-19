# Python 3.13.18 (current 3.13 release). Pinned by digest so a stale cached
# tag cannot bring back an older build.
FROM python:3.13.18-alpine@sha256:9ef1a599f863231c3d91e941389bfdc4a2d6070557243d54df1a4e57015b960e

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 5000

# The platform sets PORT to the service's port; 5000 when it isn't set.
CMD ["sh", "-c", "exec gunicorn --bind 0.0.0.0:${PORT:-5000} app:app"]