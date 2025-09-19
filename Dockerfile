FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy all project files
COPY ["Auth/AuthServer/AuthServer.csproj", "Auth/AuthServer/"]
COPY ["Auth/AuthShared/AuthShared.csproj", "Auth/AuthShared/"]
COPY ["SafeOpsBlazor/SafeOpsWeb/SafeOpsWeb.csproj", "SafeOpsBlazor/SafeOpsWeb/"]

# Create a clean NuGet.config
RUN echo '<?xml version="1.0" encoding="utf-8"?>' > NuGet.config && \
    echo '<configuration>' >> NuGet.config && \
    echo '  <packageSources>' >> NuGet.config && \
    echo '    <add key="nuget.org" value="https://api.nuget.org/v3/index.json" protocolVersion="3" />' >> NuGet.config && \
    echo '  </packageSources>' >> NuGet.config && \
    echo '</configuration>' >> NuGet.config

# Restore AuthServer dependencies
RUN dotnet restore "Auth/AuthServer/AuthServer.csproj" --configfile NuGet.config --force --no-cache

# Copy AuthServer source code
COPY Auth/AuthServer/Controllers Auth/AuthServer/Controllers
COPY Auth/AuthServer/Data Auth/AuthServer/Data
COPY Auth/AuthServer/Entity Auth/AuthServer/Entity
COPY Auth/AuthServer/Helper Auth/AuthServer/Helper
COPY Auth/AuthServer/Manager Auth/AuthServer/Manager
COPY Auth/AuthServer/Models Auth/AuthServer/Models
COPY Auth/AuthServer/Pages Auth/AuthServer/Pages
COPY Auth/AuthServer/Procedures Auth/AuthServer/Procedures
COPY Auth/AuthServer/Services Auth/AuthServer/Services
COPY Auth/AuthServer/wwwroot Auth/AuthServer/wwwroot
COPY Auth/AuthServer/Program.cs Auth/AuthServer/
COPY Auth/AuthServer/appsettings*.json Auth/AuthServer/

# Copy AuthShared source code
COPY Auth/AuthShared/DTOs Auth/AuthShared/DTOs
COPY Auth/AuthShared/Enums Auth/AuthShared/Enums
COPY Auth/AuthShared/Interfaces Auth/AuthShared/Interfaces
COPY Auth/AuthShared/Models Auth/AuthShared/Models
COPY Auth/AuthShared/Resources Auth/AuthShared/Resources

# Build AuthServer
RUN dotnet build "Auth/AuthServer/AuthServer.csproj" -c Release --no-restore
RUN dotnet publish "Auth/AuthServer/AuthServer.csproj" -c Release -o /app/publish --no-restore

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["dotnet", "AuthServer.dll"]
