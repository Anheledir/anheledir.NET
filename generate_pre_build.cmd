@echo off
cd %DEPLOYMENT_SOURCE%

echo Clean-up old tag pages (%DEPLOYMENT_SOURCE%\tags\*.html) ...
del %DEPLOYMENT_SOURCE%\tags\*.html
ruby generate-tags

echo Clean-up old category pages (%DEPLOYMENT_SOURCE%\categories\*.html) ...
del %DEPLOYMENT_SOURCE%\categories\*.html
ruby generate-categories