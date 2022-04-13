#!/bin/bash

set -eo pipefail

cd Siebtracker-package; swift test --parallel; cd ..