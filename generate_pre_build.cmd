@echo off
cd %DEPLOYMENT_SOURCE%

ruby generate-tags
echo Clean-up old tag pages (%DEPLOYMENT_TARGET%\tags\*.html) ...
del %DEPLOYMENT_TARGET%\tags\*.html

ruby generate-categories
echo Clean-up old category pages (%DEPLOYMENT_TARGET%\categories\*.html) ...
del %DEPLOYMENT_TARGET%\categories\*.html
