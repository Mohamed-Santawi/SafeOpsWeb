FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy project files
COPY ["SafeOpsWeb.csproj", "."]

# Copy AuthShared project reference
COPY ["../../Auth/AuthShared/AuthShared.csproj", "../../Auth/AuthShared/"]

# Restore dependencies
RUN dotnet restore "SafeOpsWeb.csproj"

# Copy AuthShared source
COPY ["../../Auth/AuthShared/", "../../Auth/AuthShared/"]

# Copy the rest of the source code
COPY . .

# Publish the Blazor WebAssembly app
RUN dotnet publish "SafeOpsWeb.csproj" -c Release -o /app/publish --no-restore

# Stage 2: Serve the app with Nginx
FROM nginx:alpine AS final
WORKDIR /usr/share/nginx/html

# Copy the published wwwroot content
COPY --from=build /app/publish/wwwroot .

# Add a basic Nginx configuration for Blazor client-side routing
COPY default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
