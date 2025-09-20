FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy project files
COPY ["Backend-Only/AuthServer/AuthServer.csproj", "."]
COPY ["Backend-Only/AuthShared/AuthShared.csproj", "AuthShared/"]

# Restore dependencies
RUN dotnet restore "AuthServer.csproj"

# Copy source code
COPY Backend-Only/AuthServer .
COPY Backend-Only/AuthShared AuthShared/

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
