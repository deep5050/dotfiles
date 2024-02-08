.PHONY: install

PACKAGES_FILE := default-packages

install: $(PACKAGES_FILE)
	@while read -r package; do \
		echo "Applying package: $$package"; \
		stow --target=$$HOME --restow $$package; \
	done < $<

remove: $(PACKAGES_FILE)
	@while read -r package; do \
		echo "Removing package: $$package"; \
		stow --target=$$HOME --delete $$package; \
	done < $<

