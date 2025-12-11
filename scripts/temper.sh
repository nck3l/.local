#! /etc/zsh

temp="$(sensors | grep CPU | awk '{print $2}')"

echo "${temp}"
