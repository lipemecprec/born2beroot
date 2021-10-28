#!/bin/bash

ufw allow ssh
ufw allow 8080
ufw allow 4242
ufw allow 80
ufw enable
ufw status
