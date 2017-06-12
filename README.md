# Google PubSub Emulator Docker Image

# Usage

```
$ docker pull knarz/pubsub-emulator:latest
$ docker run --rm -ti --name pubsub-emu pubsub
```

Or in a `docker-compose.yml`

```
pubsub:
  build: knarz/pubsub-emulator
  ports:
    - "8085"
  restart: always
worker:
  build: .
  environment:
    - PUBSUB_EMULATOR_HOST=pubsub:8085
  restart: always
  links:
    - pubsub
```
