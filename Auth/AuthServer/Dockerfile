FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy AuthServer.csproj and AuthShared.csproj
COPY ["Auth/AuthServer/AuthServer.csproj", "."]
COPY ["Auth/AuthShared/AuthShared.csproj", "Auth/AuthShared/"]

# Create a clean NuGet.config to avoid DevExpress issues
RUN echo '<?xml version="1.0" encoding="utf-8"?>' > NuGet.config && \
    echo '<configuration>' >> NuGet.config && \
    echo '  <packageSources>' >> NuGet.config && \
    echo '    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" protocolVersion="3" />' >> NuGet.config && \
    echo '  </packageSources>' >> NuGet.config && \
    echo '</configuration>' >> NuGet.config

# Restore dependencies with clean configuration
RUN dotnet restore "AuthServer.csproj" --configfile NuGet.config --force --no-cache

# Copy the rest of the source code
COPY Auth/AuthServer .

# Build the project
RUN dotnet build "AuthServer.csproj" -c Release --no-restore

# Publish the project
RUN dotnet publish "AuthServer.csproj" -c Release -o /app/publish --no-restore

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["dotnet", "AuthServer.dll"]
