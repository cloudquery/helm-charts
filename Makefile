.PHONY: lint
lint:
	ct lint --config=ct.yaml

.PHONY: lint-pr
lint-pr:
	ct lint --check-version-increment=false --config=ct.yaml

.PHONY: generate-docs
generate-docs:
	helm-docs
