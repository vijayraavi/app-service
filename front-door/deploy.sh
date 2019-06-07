#!/bin/bash

##########################################################################
##  Deploys an App Service Web App
##
##  Takes 3 parameters:
##
##  1- Name of resource group
##  2- Web App Name

rg=$1
webAppName=$2

echo "Resource group:  $rg"
echo "Web App Name:  $webAppName"

echo
echo "Deploying ARM template"

az group deployment create -n "deploy-$(uuidgen)" -g $rg \
    --template-file deploy.json \
    --parameters \
    webAppName=$webAppName

