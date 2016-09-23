include $(shell git rev-parse --show-toplevel)/terraform.mk

.PHONY: default
default: hello

CONFIG_FILES := \
	config/worker-env-com \
	config/worker-env-org

.PHONY: .config
.config: $(CONFIG_FILES)

$(CONFIG_FILES):
	mkdir -p config
	trvs generate-config -p travis_worker -f env $(INFRA)-workers $(ENV_SHORT) \
		| sed 's/^/export /' >config/worker-env-org
	trvs generate-config --pro -p travis_worker -f env $(INFRA)-workers $(ENV_SHORT) \
		| sed 's/^/export /' >config/worker-env-com
