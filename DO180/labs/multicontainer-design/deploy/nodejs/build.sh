#!/bin/bash
echo "Preparing build folder"
rm -fr build
mkdir -p build
cp -ap nodejs-source/* build
rm build/*.sh

# image build complains if he cannot read the database folder even if not needed for building the image
sudo rm -rf {linked,kubernetes}/work

sudo podman build --layers=false -t username-do180/todonodejs --build-arg NEXUS_BASE_URL=nexus-common.apps.ap46a.prod.ole.redhat.com .
