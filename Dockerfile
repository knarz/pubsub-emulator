FROM java:jre-alpine

MAINTAINER Sascha Hanse <shanse@gmail.com>
LABEL app="pubsub-emulator"

ENV CLOUDSDK_CORE_DISABLE_PROMPTS 1
ENV DATA_DIR "/opt/pubsub"
ENV HOST_PORT 8085

RUN apk add --no-cache curl bash python

RUN curl https://sdk.cloud.google.com | bash && \
			/root/google-cloud-sdk/bin/gcloud config set disable_usage_reporting true && \
			/root/google-cloud-sdk/bin/gcloud components install -q pubsub-emulator beta

RUN mkdir -p ${DATA_DIR}
EXPOSE 8085

ADD start_pubsub_emu.sh /opt
RUN chmod +x /opt/start_pubsub_emu.sh

CMD ["/opt/start_pubsub_emu.sh"]
