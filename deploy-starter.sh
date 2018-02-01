#! /bin/bash

#! /bin/bash

#load basic config
. './config/global.cfg'

if [ $# = 0 ];
then
  printf "You are missing arguments. Use like:\n"
  printf "=> ./HOW TO USE \n"
  printf "Get more help by using arugment --help:\n"
  printf "=> ./deploy-starter.sh --help"
fi

while [[ $# -gt 0 ]]
do
	key="$1"

  case $key in
    --help)
      . './tasks/help.sh'
      exit 1
  		;;
    --source=*)
      if [ -z "${key#*=}" ];
      then
        flagEmptyOption=1
        . "./tasks/error.sh"
      fi
      env_source=${key#*=}
      shift
      ;;
    --task=*)
      if [ -z "${key#*=}" ];
      then
        flagEmptyOption=1
        . "./tasks/error.sh"
      fi
      TASK=${key#*=}
      shift
      ;;
    --server=*)
      if [ -z "${key#*=}" ];
      then
        flagEmptyOption=1
        . "./tasks/error.sh"
      fi
      server=${key#*=}
      . "./config/server/${key#*=}.cfg"
      shift
      ;;
    --force)
      flagForce=1
      shift
      ;;
    --enable-deployment-helper)
      flagDeployHelper=1
      shift
      ;;
    \?)
      echo "Unknown option: -$OPTARG" >&2;
      exit 1
      ;;
    :)
      echo "Missing option argument for -$OPTARG" >&2;
      exit 1
      ;;
  	*)
  		echo "Unimplemented option: -$OPTARG" >&2;
  		exit 1
  		;;
  esac
done

if [ ! -z "$env_source" ] && [ ! -z "$TASK" ];
then
  # Execute option --force
  if [ $flagNoBranchAllowed == 1 ] && [ $flagForce == 0 ];
  then
    flagSourceBranchNoForce=1
    . "./tasks/error.sh"
  fi

  # Let the --force be confirmed
  if [ $flagForce == 1 ];
  then
    . "./tasks/confirm.sh"
  fi

  # Execute Deployment helper
  if [ $flagDeployHelper == 1 ];
  then
    echo "--enable-deployment-helper set to 1"
  fi

  # Deploy
  DEPLOYMENT_SOURCE=$env_source surf $TASK $DEPLOY_NAME

else
  echo "You are missing option(s) --source and/or --task"
  exit 1
fi

exit
