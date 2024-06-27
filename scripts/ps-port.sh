#!/bin/bash
# netstat -nlp | grep :$1
lsof -n -i :$1 | grep LISTEN
