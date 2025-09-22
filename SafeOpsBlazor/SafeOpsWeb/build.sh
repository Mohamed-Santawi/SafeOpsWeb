#!/bin/bash

# Install .NET 8 SDK
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel 8.0

# Add .NET to PATH
export PATH="$HOME/.dotnet:$PATH"

# Verify .NET installation
dotnet --version

# Restore dependencies
dotnet restore

# Build and publish
dotnet publish -c Release -o dist
