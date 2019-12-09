.PHONY: project
project:
	@xcodegen -q
	@./bazel/setup-xcworkspace.sh
