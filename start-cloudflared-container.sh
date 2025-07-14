#!/bin/bash

sudo docker run -d cloudflare/cloudflared:latest tunnel --no-autoupdate run --token ${CLOUDFLARED_TOKEN}