#!/bin/sh

PROFILE=default

if test -z "$1"
then
    PROFILE=default
else
    PROFILE="$1"
fi


aws --profile $PROFILE sts get-caller-identity
