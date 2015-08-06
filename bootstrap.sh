#!/bin/bash

salt-key -Ay
sleep 10
salt '*' state.highstate
