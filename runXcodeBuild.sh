#!/bin/sh


xcodebuild clean

xcodebuild test -project $1 -scheme $2 -destination 'platform=iOS Simulator,name=iPad 2' | /usr/local/bin/xcpretty --report html --output $3/test_output/test_Report-$4.html