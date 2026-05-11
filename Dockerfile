FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY . .
RUN dotnet restore SecurePipelineDemo.sln
RUN dotnet publish src/SecurePipelineDemo.Api/SecurePipelineDemo.Api.csproj -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:10.0
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "SecurePipelineDemo.Api.dll"]
