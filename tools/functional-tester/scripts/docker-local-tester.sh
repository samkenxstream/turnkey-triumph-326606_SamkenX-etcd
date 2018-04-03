#!/usr/bin/env bash

if ! [[ "${0}" =~ "scripts/docker-local-tester.sh" ]]; then
  echo "must be run from tools/functional-tester"
  exit 255
fi

if [[ -z "${GO_VERSION}" ]]; then
  GO_VERSION=1.10.1
fi
echo "Running with GO_VERSION:" ${GO_VERSION}

docker run \
  --rm \
  --net=host \
  --name tester \
  gcr.io/etcd-development/etcd-functional-tester:go${GO_VERSION} \
  /bin/bash -c "./bin/etcd-tester --config ./local-test.yaml"