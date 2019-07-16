#!/bin/bash

##########################################################################
##  Deploys an App Service Web App
##
##  Takes 3 parameters:
##
##  1- Name of resource group
##  2- Custom Domain Name
##  3- Front door name
##  4- Web App Name

rg=$1
customDomain=$2
frontDoorName=$3
webAppName=$4

echo "Resource group:  $rg"
echo "Custom Domain Name:  $customDomain"
echo "Front door host name:  $frontDoorName"
echo "Web App Name:  $webAppName"

echo
echo "Deploying ARM template"

az group deployment create -n "deploy-$(uuidgen)" -g $rg \
    --template-file deploy.json \
    --parameters \
    customDomain=$customDomain \
    frontDoorName=$frontDoorName \
    webAppName=$webAppName

