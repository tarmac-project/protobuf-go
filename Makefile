PROTO_DEFINITIONS_DIR ?= ../protobuf-definitions
MODULE_PATH := github.com/tarmac-project/protobuf-go
GENERATED_DIR := $(PROTO_DEFINITIONS_DIR)/build/go/$(MODULE_PATH)
GENERATED_SDK_DIR := $(GENERATED_DIR)/sdk

.PHONY: build generate clean test verify

build: generate

generate:
	@echo "Generating protobuf Go packages from $(PROTO_DEFINITIONS_DIR)..."
	@test -d "$(PROTO_DEFINITIONS_DIR)" || (echo "missing PROTO_DEFINITIONS_DIR: $(PROTO_DEFINITIONS_DIR)" && exit 1)
	@$(MAKE) -C "$(PROTO_DEFINITIONS_DIR)" build
	@test -d "$(GENERATED_SDK_DIR)" || (echo "missing generated output: $(GENERATED_SDK_DIR)" && exit 1)
	rsync -a --delete "$(GENERATED_SDK_DIR)/" ./sdk/

test:
	go test ./...

verify: generate test
	git diff --exit-code

clean:
	@echo "Cleaning local protobuf-go artifacts..."
	find . -type f -name "*.test" -delete
	find . -type f -name "coverage.out" -delete
