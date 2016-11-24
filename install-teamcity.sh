#!/bin/bash

mkdir ~/Downloads

curl https://download-cf.jetbrains.com/teamcity/TeamCity-10.0.3.tar.gz > ~/Downloads/TeamCity-10.0.3.tar.gz

local_hash=$(sha256sum ~/Downloads/TeamCity-10.0.3.tar.gz  | awk '{print $1}' )
echo "hash: $local_hash"
if [ "81943dd664eff4fec6a38ebc6e5cf27155c9da7aa224ef0a142ee16e0dc42e03" == "$local_hash" ]; then
	echo "Hashes are equal!"
	tar xf ~/Downloads/TeamCity-10.0.3.tar.gz -C ~/Downloads
	mv -v ~/Downloads/TeamCity/* $TEAMCITY_DIST
#	rm ~/Downloads/TeamCity-10.0.3.tar.gz
fi

