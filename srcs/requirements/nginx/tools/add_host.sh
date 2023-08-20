#!/bin/bash

set -e

# add domain in hosts file, if it doesn't exists
if ! grep "lgenevey.42.ch" /etc/hosts; then
	sudo -- sh -c -e "echo '127.0.0.1 lgenevey.42.ch' >> /etc/hosts"
	sudo -- sh -c -e "echo '127.0.0.1 www.lgenevey.42.ch' >> /etc/hosts"
	cat /etc/hosts
else
	echo "lgenevey.42.ch host does already exists in /etc/hosts"
fi
