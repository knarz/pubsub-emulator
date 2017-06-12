# Google PubSub Emulator Docker Image

# Usage

```
$ docker pull knarz/pubsub-emulator:latest
$ docker run --rm -ti --name pubsub-emu pubsub
```

Or in a `docker-compose.yml`

```
pubsub:
  image: knarz/pubsub-emulator
worker:
  build: .
  environment:
    - PUBSUB_EMULATOR_HOST=pubsub:8085
  restart: always
  links:
    - pubsub
```
