#!/usr/bin/env bash

# Other versions found at https://go.dev/dl/
# Instructions found at https://go.dev/doc/install

# Vars
VERSION="1.20.5" # go version
ARCH="amd64" # go archicture
GO_TAR_FILE=go${VERSION}.linux-${ARCH}.tar.gz
INSTALL_PATH=/usr/local
GO_PATH=$INSTALL_PATH/go

echo "This script will install go $VERSION for linux at $INSTALL_PATH"

if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo "Error: This script only works for linux"
    exit 1
fi

To remove previous installations 
if [[ -f $GO_PATH ]]; then
    echo "Previous installation of go found. Removing it"
    rm -rf $GO_PATH
else
    echo "No previous installations of go found"
fi

echo "Downloading Go tarball"
curl -s https://dl.google.com/go/$GO_TAR_FILE -o $GO_TAR_FILE

echo "Untaring the tarball and copying into $INSTALL_PATH"
tar -C $INSTALL_PATH -xzf $GO_TAR_FILE

echo "Removing the tarball"
rm $GO_TAR_FILE

echo "\n GO is installed. Try running \`go version\`"
echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.bash_profile