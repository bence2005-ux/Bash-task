#!/bin/bash


echo -n "Enter your birthdate (yyyy.mm.dd): "
read bd


if [[ $bd =~ ^[0-9]{4}\.[0-9]{2}\.[0-9]{2}$ ]]; then
  
bd=$(echo "bd" | sed 's/\./-/g')
  
  if ! date -d "$bd" &> /dev/null; then
    echo "Invalid date. Please try again."
    exit 1
  fi
else
  echo "Invalid format. Please use yyyy.mm.dd."
  exit 1
fi


year=$(date -d "$bd" +%Y)
month=$(date -d "$bd" +%m)
day=$(date -d "$bd" +%d)

cyear=$(date +%Y)
cmonth=$(date +%m)
cday=$(date +%d)

age=$((cyear - year))

if ((cmonth < month || (cmonth == month && cday < day))); then
  age=$((age - 1))
fi


echo "You are $age years old."
