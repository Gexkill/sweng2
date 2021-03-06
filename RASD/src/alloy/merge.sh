#!/bin/bash

parsed=()
checks=()
runs=()

expand_file() {
  parsed+=($1)
  while read line; do
    if grep -qE '^\s*open\s+[a-z]+\s*$' <<<$line; then
      f="$(sed -E 's/^\s*open\s+//' <<<$line).als"
      if ! [[ ${parsed[*]} =~ $f ]]; then
        expand_file $f
      fi
    elif grep -qE '^\s*check\s+' <<<$line; then
      checks+=("$line")
    elif grep -qE '^\s*run\s+' <<<$line; then
      runs+=("$line")
    elif grep -qE '^\s*pred\s+show' <<<$line; then
      break
    else
      echo "$line"
    fi
  done < $1
}

get_predicates() {
  local found=false
  
  while read line; do
    if [ $found = true ]; then
      echo $line
    elif grep -qE "^\s*pred\s+" <<<$line; then
      found=true
      echo $line
    fi
  done < $1
}

print_checks() {
  for c in "${checks[@]}"; do echo $c; done
}

print_runs() {
  for r in "${runs[@]}"; do echo $r; done
}

expand_file world.als
get_predicates world.als
print_checks
print_runs