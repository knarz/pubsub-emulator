#!/usr/bin/env bash

sudo apt update && sudo apt install -y lsb-release apt-transport-https

if which gcloud >/dev/null; then
  echo GCloud found, no need to install
else
  export GCLOUD_SDK_PATH=${HOME}/google-cloud-sdk
  export GCLOUD_FILENAME="google-cloud-sdk-380.0.0-linux-x86_64.tar.gz"
  curl --retry 3 -o ${HOME}/${GCLOUD_FILENAME} https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${GCLOUD_FILENAME}
  cd ${HOME}
  tar zxf ./${GCLOUD_FILENAME}

  echo "Listing the google-cloud-sdk directory"
  ls -la ${GCLOUD_SDK_PATH}

  chmod +x ${GCLOUD_SDK_PATH}/install.sh
  ${GCLOUD_SDK_PATH}/install.sh -q
  ${GCLOUD_SDK_PATH}/bin/gcloud components install beta pubsub-emulator kubectl -q  
  export PATH=${GCLOUD_SDK_PATH}/bin:${PATH}
fi

echo -n ${GCLOUD_SERVICE_KEY} | base64 --decode -i > ${HOME}/gcloud-service-key.json
gcloud auth activate-service-account --key-file=${HOME}/gcloud-service-key.json
gcloud --quiet config set project ${GOOGLE_PROJECT_ID}
gcloud auth configure-docker --quiet