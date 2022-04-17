.PHONY: lint
lint:
	ct lint --config=ct.yaml

.PHONY: generate-docs
generate-docs:
	helm-docs