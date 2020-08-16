#!/bin/bash
#. /Users/vimalkumarsharma/IdeaProjects/learnScripting/my-scripts/common.sh
. common.sh

container=$(getContainer $1)
echo "Container Name " $container

namespace=$(currentNamespace)
echo "Namespace" $namespace
kubectl logs -f -n $namespace $2 -c $container --tail=200

