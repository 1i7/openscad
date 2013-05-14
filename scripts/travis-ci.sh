#!/bin/bash

qmake && make -j4
if [[ $? != 0 ]]; then
  echo "Error building OpenSCAD executable"
  exit 1
fi
cd tests
cmake . 
if [[ $? != 0 ]]; then
  echo "Error configuring test suite"
  exit 1
fi
make -j4
if [[ $? != 0 ]]; then
  echo "Error building test suite"
  exit 1
fi
ctest -j8
if [[ $? != 0 ]]; then
  echo "Test failure"
  exit 1
fi
