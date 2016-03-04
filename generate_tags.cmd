@echo off
cd %DEPLOYMENT_SOURCE%
ruby generate-tags
echo Clean-up old tag pages (%DEPLOYMENT_TARGET%\tags\*.html) ...
del %DEPLOYMENT_TARGET%\tags\*.html
