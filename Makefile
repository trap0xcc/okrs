.DEFAULT_GOAL := help
PODMAN ?= podman
IMAGE ?= localhost/okr-check:latest
QUARTER ?=
QUARTER_ARG = $(if $(QUARTER),--quarter "$(QUARTER)",)
RUN = $(PODMAN) run --rm --network=none --userns=keep-id \
	--security-opt label=disable -e HOME=/tmp \
	-v "$(CURDIR):/repo:ro" -w /repo

.PHONY: image check check-staged
image:
	@$(PODMAN) build --quiet -t "$(IMAGE)" -f Containerfile . >/dev/null

check: image
	@$(RUN) "$(IMAGE)" python scripts/check $(QUARTER_ARG)

check-staged: image
	@$(RUN) "$(IMAGE)" python scripts/check --staged $(QUARTER_ARG)

.PHONY: help
help:
	@printf '%s\n' 'Targets:' '  check         Validate OKR data' '  check-staged  Validate staged OKR data' '  image         Build the Podman image' '' 'Optional: QUARTER=2026-Q4'
