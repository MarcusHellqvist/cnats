#!/bin/sh
set -ex
# check to see if nats-server folder is empty
if [ ! "$(ls -A $HOME/nats-server)" ]; then
  mkdir -p $HOME/nats-server
  cd $HOME/nats-server
  wget https://github.com/nats-io/nats-server/releases/download/v2.0.2/nats-server-v2.0.2-linux-amd64.zip -O nats-server.zip
  unzip nats-server.zip
  mv nats-server-v2.0.2-linux-amd64/nats-server .
else
  echo 'Using cached directory.';
fi

cd $HOME
# check to see if nats-streaming-server folder is empty
if [ ! "$(ls -A $HOME/nats-streaming-server)" ]; then
  mkdir -p $HOME/nats-streaming-server
  cd $HOME/nats-streaming-server
  wget https://github.com/nats-io/nats-streaming-server/releases/download/v0.15.1/nats-streaming-server-v0.15.1-linux-amd64.zip -O nats-streaming-server.zip
  unzip nats-streaming-server.zip
  mv nats-streaming-server-v0.15.1-linux-amd64/nats-streaming-server .
else
  echo 'Using cached directory.';
fi

# check to see if pbuf folder is empty
if [ ! "$(ls -A $HOME/pbuf)" ]; then
  sudo echo "deb http://archive.ubuntu.com/ubuntu disco main restricted universe multiverse" >> /etc/apt/sources.list
  sudo apt-get update
  sudo apt-get install libprotobuf-c-dev
  mkdir -p $HOME/pbuf
  cp -pr /usr/include/protobuf-c $HOME/pbuf/
  cp /usr/lib/x86_64-linux-gnu/libprotobuf-c.so* $HOME/pbuf
  sudo rm /usr/lib/x86_64-linux-gnu/libprotobuf-c.*
else
  echo 'Using cached directory.';
fi
cd $HOME