FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy AuthServer.csproj and AuthShared.csproj
COPY ["Auth/AuthServer/AuthServer.csproj", "."]
COPY ["Auth/AuthShared/AuthShared.csproj", "Auth/AuthShared/"]

# Create a clean NuGet.config
RUN echo '<?xml version="1.0" encoding="utf-8"?>' > NuGet.config && \
    echo '<configuration>' >> NuGet.config && \
    echo '  <packageSources>' >> NuGet.config && \
    echo '    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" protocolVersion="3" />' >> NuGet.config && \
    echo '  </packageSources>' >> NuGet.config && \
    echo '</configuration>' >> NuGet.config

# Restore dependencies
RUN dotnet restore "AuthServer.csproj" --configfile NuGet.config --force --no-cache

# Copy source code excluding obj directories
COPY Auth/AuthServer/Controllers ./Controllers
COPY Auth/AuthServer/Data ./Data
COPY Auth/AuthServer/Entity ./Entity
COPY Auth/AuthServer/Helper ./Helper
COPY Auth/AuthServer/Manager ./Manager
COPY Auth/AuthServer/Models ./Models
COPY Auth/AuthServer/Pages ./Pages
COPY Auth/AuthServer/Procedures ./Procedures
COPY Auth/AuthServer/Services ./Services
COPY Auth/AuthServer/wwwroot ./wwwroot
COPY Auth/AuthServer/Program.cs .
COPY Auth/AuthServer/appsettings*.json .

# Build and publish
RUN dotnet build "AuthServer.csproj" -c Release --no-restore
RUN dotnet publish "AuthServer.csproj" -c Release -o /app/publish --no-restore

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["dotnet", "AuthServer.dll"]
