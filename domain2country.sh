#!/bin/bash
if [ -z "$1" ]; then
  echo "Use: ./domains2country.sh [domain]"
  exit 1
fi
filename='domains.txt'
while read d || [[ -n $d ]]; do
  ip=$(dig +short $1$d|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"|head -1)
  if [ -n "$ip" ]; then
    echo "$1$d ; $ip"
  else
    echo "$d => Fail resolving"
  fi
done < $filename
