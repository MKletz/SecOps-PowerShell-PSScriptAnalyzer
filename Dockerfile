# Created following: https://docs.github.com/en/free-pro-team@latest/actions/creating-actions/creating-a-docker-container-action

# Container image that runs your code
FROM mcr.microsoft.com/powershell:latest as base

#Symlink to the version of PowerShell we're targeting
RUN ln -s /opt/microsoft/powershell/7/pwsh /bin/pwsh

#Create custom rules dir
RUN mkdir /custom_rules

#Install PSScriptAnalyzer from PSGallery
RUN pwsh -command "Install-Module -Name 'PSScriptAnalyzer' -Scope 'AllUsers' -Force"

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY run_psscriptanalyzer.ps1 /run_psscriptanalyzer.ps1
COPY custom_rules/* /custom_rules/

# Code file to execute when the docker container starts up (`run_psscriptanalyzer.ps1`)
ENTRYPOINT ["/run_psscriptanalyzer.ps1"]
