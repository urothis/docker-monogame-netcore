FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS builder
LABEL author="urothis@gmail.com"
RUN apt-get update \
  && apt install apt-transport-https dirmngr gnupg ca-certificates -y \
  && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
  && "deb https://download.mono-project.com/repo/debian stable-stretch main" | tee /etc/apt/sources.list.d/mono-official-stable.list \
  && apt update \
  && apt install mono-devel -y
WORKDIR /sln