FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy project files
COPY ["SafeOpsWeb/SafeOpsWeb.csproj", "SafeOpsWeb/"]
COPY ["AuthShared/AuthShared.csproj", "AuthShared/"]

# Restore dependencies
RUN dotnet restore "SafeOpsWeb/SafeOpsWeb.csproj"

# Copy source code
COPY SafeOpsWeb .
COPY AuthShared .

# Build and publish
RUN dotnet publish "SafeOpsWeb.csproj" -c Release -o /app/publish --no-restore

# Runtime stage with nginx
FROM nginx:alpine AS final
WORKDIR /usr/share/nginx/html
COPY --from=build /app/publish/wwwroot .
COPY ["SafeOpsWeb/default.conf", "/etc/nginx/conf.d/default.conf"]
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
