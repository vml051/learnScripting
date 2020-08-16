#!/bin/bash
#. /Users/vimalkumarsharma/IdeaProjects/learnScripting/my-scripts/common.sh
. common.sh

namespace=$(getNamespace $1)
context=$(getContext $namespace)

if [ ! -z $1 ]
then
  switch_context_if_needed $context
  if [ ! -z $2 ]
  then
     kubectl get pods -n $namespace | grep $2
  else
     kubectl get pods -n $namespace
  fi
else
   kubectl get pods -n development
fi




