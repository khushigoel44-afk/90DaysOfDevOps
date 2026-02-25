#!/bin/bash

set -euo pipefail
cat Non-Existant | wc -l
ls /folder_that_does_not_exist
echo "Hello, $name"