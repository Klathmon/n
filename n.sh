#!/usr/bin/env bash


npmCommand=""

uname=$(uname -a)
if [[ $uname == *"MINGW"* ]] ; then
  npmCommand="npm --msvs_version=2015"
elif [[ $uname == *"Darwin"* ]] ; then
  npmCommand="npm"
else
  if [[ $uname == *"el6"* ]] ; then
    # These exports are needed to have node-gyp compile things correctly on Centos 6 (our servers)
    export CC=/opt/centos/devtoolset-1.1/root/usr/bin/gcc
    export CPP=/opt/centos/devtoolset-1.1/root/usr/bin/cpp
    export CXX=/opt/centos/devtoolset-1.1/root/usr/bin/c++
    npmCommand="npm"
  else
    npmCommand="npm"
  fi
fi

$npmCommand $@
