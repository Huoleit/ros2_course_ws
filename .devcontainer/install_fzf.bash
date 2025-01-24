#!/usr/bin/env bash
set -e

FZF_VERSION=${1:-"none"}

if [ "${FZF_VERSION}" = "none" ]; then
    echo "No version specified, skipping fzf installation"
    exit 0
fi

echo "Installing fzf..."
apt-get -y purge --auto-remove fzf || true
mkdir -p /opt/fzf

architecture=$(dpkg --print-architecture)

FZF_BINARY_TAR="fzf-${FZF_VERSION}-linux_${architecture}.tar.gz"
echo "Downloading ${FZF_BINARY_TAR}..."
curl -sSL "https://github.com/junegunn/fzf/releases/download/v${FZF_VERSION}/${FZF_BINARY_TAR}" | tar xz -C /opt/fzf
ln -s /opt/fzf/fzf /usr/local/bin/fzf