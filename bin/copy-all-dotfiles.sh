#!/bin/bash -e
ls -a | grep -Ev "README|bin|\.$|^\.git$" | while read f; do
  if [ $f = ".ssh_config"  ]; then
    cp $f $HOME/.ssh/config
  else
   cp $f $HOME/
  fi
done  
