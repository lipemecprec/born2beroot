#!/bin/bash

# for ssh
ufw allow 4242/tcp
# for lighttpd
ufw allow 80/tcp
ufw reload
ufw status
