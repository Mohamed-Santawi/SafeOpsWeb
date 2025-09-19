FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy AuthServer.csproj and AuthShared.csproj
COPY ["Auth/AuthServer/AuthServer.csproj", "."]
COPY ["Auth/AuthShared/AuthShared.csproj", "Auth/AuthShared/"]

# Restore dependencies
RUN dotnet restore "AuthServer.csproj"

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
