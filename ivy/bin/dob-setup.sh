#!/bin/sh

ACTION=$1

clone(){
        GIT_REPO_URL=$REPO_URL
        GIT_USERNAME=$USERNAME
        GIT_PASSWORD=$PASSWORD
        echo $REPO_URL
        echo $USERNAME
        echo $PASSWORD
        echo $DOB_HOME
        if [ -z "$REPO_URL" ]; then
            echo "Kindly enter three params REPO_URL, USERNAME and PASSWORD. Command as ./filename.sh REPOURL=<repourl> USERNAME=<git-username> PASSWORD=<gitOrSshPassword>"
         	echo "kindly provide the git repourl"
         #elif [ -z "$USERNAME" ]; then
         #   echo "kindly provide the git username"
         else
            java -cp "$DOB_HOME\dotoolkit.jar;$DOB_HOME\lib\*" com.opt.dotoolkit.setup.AppSetup "$GIT_REPO_URL" "$GIT_USERNAME" "$GIT_PASSWORD"
        fi
}

case $ACTION in
        clone)
        		clone $2 $3 $4
                ;;
        *)
                echo "Kindly specify available options OPTIONS:- [clone]"
                ;;
esac
        	
