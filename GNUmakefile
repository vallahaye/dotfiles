SHELL:=/bin/bash
PACKAGES?=$(wildcard pkgs/*)
PACKAGES:=$(notdir $(PACKAGES))

.PHONY: install
install:
	@- for pkg in $(PACKAGES); do \
		$(MAKE) -C pkgs/$$pkg pre-install; \
		stow -v -d pkgs/ -t ~/ --no-folding $$pkg; \
		$(MAKE) -C pkgs/$$pkg post-install; \
	done

.PHONY: uninstall
uninstall:
	@- for pkg in $(PACKAGES); do \
		$(MAKE) -C pkgs/$$pkg pre-uninstall; \
		stow -v -d pkgs/ -t ~/ -D $$pkg; \
		$(MAKE) -C pkgs/$$pkg post-uninstall; \
	done
