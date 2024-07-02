#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")";
cat .bash_profile >> ~/.bashrc
source ~/.bashrc
