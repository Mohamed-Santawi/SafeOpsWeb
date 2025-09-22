# Use the official .NET 8 SDK image for building
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

# Set working directory
WORKDIR /app

# Copy project files
COPY ["SafeOpsWeb.csproj", "."]
COPY ["../../Backend-Only/AuthShared/AuthShared.csproj", "AuthShared/"]

# Restore dependencies
RUN dotnet restore "SafeOpsWeb.csproj"

# Copy source code
COPY . .
COPY ["../../Backend-Only/AuthShared", "AuthShared/"]

# Build and publish the Blazor WebAssembly app
RUN dotnet publish "SafeOpsWeb.csproj" -c Release -o /app/publish --no-restore

# Use nginx to serve the static files
FROM nginx:alpine AS final

# Copy the published files to nginx html directory
COPY --from=build /app/publish/wwwroot /usr/share/nginx/html

# Copy nginx configuration
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
