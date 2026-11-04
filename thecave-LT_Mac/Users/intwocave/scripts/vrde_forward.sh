#!/bin/bash

: "${vrde_username:?vrde_username에 사용자명을 지정하세요}"

exec ssh -N \
  -o ExitOnForwardFailure=yes \
  -L 127.0.0.1:5100:127.0.0.1:5100 \
  "${vrde_username}@192.168.0.102"
