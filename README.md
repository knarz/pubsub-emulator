# Google PubSub Emulator Docker Image

# Usage

```
$ docker pull us-docker.pkg.dev/peach-finance/peach-docker/pubsub-emulator:latest
$ docker run --rm -ti --name pubsub-emu pubsub
```

Or in a `docker-compose.yml`

```
pubsub:
  image: us-docker.pkg.dev/peach-finance/peach-docker/pubsub-emulator:latest
worker:
  build: .
  environment:
    - PUBSUB_EMULATOR_HOST=pubsub:8085
  restart: always
  links:
    - pubsub
```
