#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")";
cat .bash_profile >> ~/.bash_profile
source ~/.bash_profile
