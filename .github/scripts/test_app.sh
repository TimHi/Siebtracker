#!/bin/bash

set -eo pipefail

xcodebuild clean test | xcpretty