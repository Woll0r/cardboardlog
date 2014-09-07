#!/bin/bash
#######################################
# Execute upon the webhook triggering.
# Pull the commit from git and reload uwsgi
#######################################

git pull

touch ../reload