eval `ssh-agent -s`
ssh-add ~/.ssh/id_rsa

echo 'updating project...'

PROJECTS_PATH="/home/mykola/dotNetProjects"
PROJECTS_NAME="collections"

cd $PROJECTS_PATH

ssh -F ~/.ssh/config vm rm -rf $PROJECTS_PATH/$PROJECTS_NAME/*
scp -F ~/.ssh/config -r $PROJECTS_NAME/* vm:$PROJECTS_PATH/$PROJECTS_NAME/

ssh-agent -k