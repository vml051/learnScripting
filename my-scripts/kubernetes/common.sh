#!/bin/bash
function getNamespace() {
  if [[ $1 = prod* ]]
	then
		echo production;
	elif [[ $1 = r* ]]
	then
	  echo regression;
	elif  [[ $1 = m* ]]
	then
	  echo mock;
	elif [[ $1 = pp* ]]
	then
	  echo pre-production
	else
		echo development
	fi
}

function getContext() {
  if [[ $1 = production ]]
	then
		echo production;
	elif [[ $1 = pre-production ]]
	then
	  echo pre-production;
	elif  [[ $1 = development ]]
	then
	  echo staging;
	else
		echo staging;
	fi
}

function getContainer() {
  podname=$1
  charToRemove=17
  echo $podname | sed "s/\(.*\).\{$charToRemove\}/\1/"
}

function currentNamespace() {
  echo $(kubectl config view --minify --output 'jsonpath={..namespace}')
}

function current_context() {
  echo $(kubectl config current-context)
}

function switch_context_if_needed() {
  current_context=$(current_context);
  if [[ $1 != $current_context ]]
	then
	  echo "Context is not same.. switching to :" $1
		kubectl config use-context $1
	else
		echo "No need to Swtich context "
	fi
}

