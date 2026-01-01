#!/usr/bin/bash

echo "Installing YT-Downloader..."

if ! command -v python3 &> /dev/null; then
    echo "Error: python3 not installed"
    exit 1
fi

if ! python3 -m venv --help &> /dev/null; then
    echo "Error: python3-venv is missing"
    exit 1
fi

echo "Creating virtual environment..."
python3 -m venv .venv

echo "Activating virtual environment..."
source .venv/bin/activate

echo "Upgrading pip..."
pip install --upgrade pip &> /dev/null

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Setup nodeenv..."
nodeenv -p --node=lts

chmod +x yt-downloader

INSTALL_DIR="$HOME/.local/bin"
mkdir -p "INSTALL_DIR"

ln -sf "${pwd}/yt-downloader" "$INSTALL_DIR/yt-downloader"

if [ -n "$ZSH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_CONFIG="$HOME/.bashrc"
else
    SHELL_CONFIG="$HOME/.bashrc"
fi

if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$SHELL_CONFIG"
    echo "Added $HOME/.local/bin to PATH in $SHELL_CONFIG"
    echo "Run 'source $SHELL_CONFIG' or restart terminal"
fi

echo "YT-Downloader installed successfully"
echo "Run with: yt-downloader"
