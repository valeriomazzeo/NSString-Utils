#!/bin/sh
set -e

xctool -project NSString+Utils.xcodeproj -scheme NSString+Utils -sdk iphonesimulator build test
