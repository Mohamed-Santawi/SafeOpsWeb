FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy project files
COPY ["Backend-Only/AuthServer/AuthServer.csproj", "."]
COPY ["Backend-Only/AuthShared/AuthShared.csproj", "AuthShared/"]

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
COPY Backend-Only/AuthServer .
COPY Backend-Only/AuthShared AuthShared/

# Clean and build the project
RUN dotnet clean "AuthServer.csproj"
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
