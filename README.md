# Google Authentication Plug-in for SonarQube #
[![Build Status](https://travis-ci.org/iamnavpreet/sonar-auth-google.svg?branch=master)](https://travis-ci.org/iamnavpreet/sonar-auth-google)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=iamnavpreet_sonar-auth-google&metric=alert_status)](https://sonarcloud.io/dashboard?id=iamnavpreet_sonar-auth-google)



## Description ##


This plugin enables user authentication and Single Sign-On via [Google](https://google.com/).
It is heavily based on the code by [Julien Lancelot](https://github.com/SonarQubeCommunity/sonar-auth-bitbucket)
Compatible with SonarQube version 5.6 and higher.

This pluging is updated to enable google single sign on for Google for Multiple domains. It was already in PR but original developer was not adding the same, so I cloned from the PR and updated this.


## Installation ##
1. Install the plugin through the [Update Center](http://docs.sonarqube.org/display/SONAR/Update+Center) or download it into the *SONARQUBE_HOME/extensions/plugins* directory
1. Restart the SonarQube server

## Usage ##
In the [Google Developers Console](https://console.developers.google.com/):
1. Go to "Credentials"
2. Click on the "Create credentials" drop-down, and select "OAuth client ID"
3. Set the "Application type" to "Web application"
4. Set the "Name" value to something which you will associated with SonarQube
5. Set the "Authorized JavaScript origins" to the base URL of your SonarQube server web application (no path allowed)
6. Set the "Authorized redirect URIs" to be:
   * ${sonarBaseURL}/oauth2/callback/googleoauth

In SonarQube settings :
1. Go to "Security" -> "Google"
2. Set the "Enabled" property to true
3. Set Google authentication URI: https://accounts.google.com/o/oauth2/v2/auth
4. Set the "OAuth client ID" from the value provided by the Google OAuth consumer
5. Set the "OAuth consumer Secret" from the value provided by the Google OAuth consumer

Go to the login form, a new button "Log in with Google" allow users to connect to SonarQube with their Google accounts.

> Note: Only HTTPS is supported
> * SonarQube must be publicly accessible through HTTPS only
> * The property 'sonar.core.serverBaseURL' must be set to this public HTTPS URL

## General Configuration ##

Property                                   | Description | Default value
-------------------------------------------| ----------- | -------------
sonar.auth.googleoauth.allowUsersToSignUp  |Allow new users to authenticate. When set to 'false', only existing users will be able to authenticate to the server|true
sonar.auth.googleoauth.clientId.secured    |Consumer Key provided by Google when registering the consumer|None
sonar.auth.googleoauth.clientSecret.secured|Consumer password provided by Google when registering the consumer|None
sonar.auth.googleoauth.enabled             |Enable Google users to login. Value is ignored if consumer Key and Secret are not defined|false
sonar.auth.googleoauth.loginStrategy       |When the login strategy is set to 'Unique', the user's login will be auto-generated the first time so that it is unique. When the login strategy is set to 'Same as Google login', the user's login will be the Google login. This last strategy allows, when changing the authentication provider, to keep existing users (if logins from new provider are the same than Google)|Unique
sonar.auth.googleoauth.limitOauthDomain    |When set with a GApps domain, only allow users from that domain to authenticate. Can be a list by separating domains with ","|None
