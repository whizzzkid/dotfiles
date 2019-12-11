#!/usr/bin/env bash
git clone --depth 1 "$1" temp-linecount-repo &&
  printf "('temp-linecount-repo' will be deleted automatically)\n\n\n" &&
  cloc temp-linecount-repo --csv --hide-rate --quiet | sed 1,2d  > report.csv &&
  rm -rf temp-linecount-repo
