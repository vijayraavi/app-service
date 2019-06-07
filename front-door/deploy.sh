#!/bin/bash

##########################################################################
##  Deploys an App Service Web App
##
##  Takes 3 parameters:
##
##  1- Name of resource group
##  2- Front door host prefix
##  3- Web App Name

rg=$1
frontDoorHostPrefix=$2
webAppName=$3

echo "Resource group:  $rg"
echo "Front door host name:  $frontDoorHostPrefix"
echo "Web App Name:  $webAppName"

echo
echo "Deploying ARM template"

az group deployment create -n "deploy-$(uuidgen)" -g $rg \
    --template-file deploy.json \
    --parameters \
    frontDoorHostPrefix=$frontDoorHostPrefix \
    webAppName=$webAppName

