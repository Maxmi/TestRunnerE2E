#!/bin/sh
#==========================================================================
GITHUB_ACCOUNT=Maxmi
WS_DIR=Workspace2
REPO_NAME=Title_Validation_E2E
APP_VERSION=1.1
MAIN_CLASS=core.Selenium
ARGS_01=
#=========================================================================
if ! which java >/dev/null 2>&1; then echo Java not installed; return; fi
if ! which mvn >/dev/null 2>&1; then echo Maven not installed; return; fi
if ! which git >/dev/null 2>&1; then echo Git not installed; return; fi
if [ -d "$HOME/$WS_DIR" ] ; then cd ~/$WS_DIR; else echo $WS_DIR directory does not exist; return; fi
if [ -d "$HOME/$WS_DIR/$REPO_NAME" ]; then rm -rf $HOME/$WS_DIR/$REPO_NAME; fi
git clone https://github.com/$GITHUB_ACCOUNT/$REPO_NAME.git
cd ./$REPO_NAME

mvn clean site test package -Dtest=AllTests -Dbuild.version="1.1"
 
echo "Executing Java program..."

java -jar ./target/$REPO_NAME-$APP_VERSION-jar-with-dependencies.jar $MAIN_CLASS $ARGS_01

