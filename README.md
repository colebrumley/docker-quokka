# Quokka Docker container

## Running

You'll need a MongoDB instance:

```sh
docker pull mongo:latest
docker run -d --name mongo mongo
docker inspect -f '{{ .NetworkSettings.IPAddress }}' mongo
```

Then you can start Quokka with any of the following environment variables.  There are defaults for everything except MONGODB_HOST.  Arguments will be passed through to manage.py.

```sh
docker run -d \
  --name quokka \
  -p 8000:8000 \
  -e MONGODB_HOST=your_mongo_host \
  -e MONGODB_PORT=your_mongo_port \
  -e POPULATE=true \
  -e ADMIN_USER=myuser \
  -e ADMIN_EMAIL=my@email.address \
  -e ADMIN_NAME="Dr. Zoidberg" \
  elcolio/quokka
```