# Error: Option empty
if [ $flagEmptyOption == 1 ];
then
  echo "[ERROR] You entered empty options."
fi

# Error: Deploy branch master and no option --force is set
if [ $flagSourceBranchNoForce == 1 ];
then
  echo "[ERROR] Are you crazy? No deployment of a branch to this server allowed. Shame on you! If you really want to deploy a branch to the server \"$server\" than you have to use the dark side of the --force!"
fi

exit 1
