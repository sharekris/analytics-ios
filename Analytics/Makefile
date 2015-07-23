XCPRETTY := xcpretty -c && exit ${PIPESTATUS[0]}

SDK ?= "iphonesimulator8.4"
DESTINATION ?= "platform=iOS Simulator,name=iPhone 5"
XC_ARGS := -scheme Analytics -workspace Analytics.xcworkspace -sdk $(SDK) -destination $(DESTINATION)

clean:
	xcodebuild $(XC_ARGS) clean | $(XCPRETTY)

build:
	xcodebuild $(XC_ARGS) | $(XCPRETTY)

test:
	xcodebuild $(XC_ARGS) test | $(XCPRETTY)

.PHONY: test build clean
.SILENT:
