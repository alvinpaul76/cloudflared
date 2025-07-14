#!/bin/bash

cloudflared tunnel run --token ${CLOUDFLARED_TOKEN} > cloudflared.log 2>&1 &
