#!/bin/bash

cat /var/log/apache2/access.log | python3 -c "import sys; from urllib.parse import unquote; print(unquote(sys.stdin.read()));"
