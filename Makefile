.EXPORT_ALL_VARIABLES:

define HELP_BODY
\033[1minstall\033[0m
	Installs gitui by copying the files to `~/.local/bin`.
	The folder will be created and added to your PATH if it doesn't exist.

\033[1minstall-links\033[0m
	Installs gitui by creating symbolic links of all files in `~/.local/bin`.
	The folder will be created and added to your PATH if it doesn't exist.

\033[1muninstall\033[0m
	Removes all files in `~/.local/bin` that match `gitui*`.
endef

INSTALL_FOLDER = ~/.local/bin/
SCRIPTS = $(wildcard gitui*)
SCRIPTS_AT_INSTALL_PATH = $(addprefix $(INSTALL_FOLDER), $(SCRIPTS))

.PHONY: help
help:
	@echo "$$HELP_BODY"


ifeq (, $(shell command -v fzf))
	$(error fzf needs to be installed (https://junegunn.github.io/fzf).)
endif

.PHONY: preinstallchecks
preinstallchecks:
	@mkdir -p "$(HOME)/.local/bin"
	@if echo "$$PATH" | grep -q "$$HOME/.local/bin"; then \
		echo "~/.local/bin is already in PATH"; \
	else \
		echo "~/.local/bin is NOT in PATH"; \
		if echo "$$SHELL" | grep -q "zsh"; then \
			echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc; \
			echo "Please restart your shell or run: source ~/.zshrc"; \
		elif echo "$$SHELL" | grep -q "bash"; then \
			echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc; \
			echo "Please restart your shell or run: source ~/.bashrc"; \
		else \
			echo "Unknown shell. Please add $$HOME/.local/bin to your PATH manually."; \
		fi \
	fi

install: preinstallchecks $(SCRIPTS_AT_INSTALL_PATH)

~/.local/bin/%: %
	@echo Install $<
	@cp ./$< $@


install-links: preinstallchecks $(SCRIPTS_AT_INSTALL_PATH:=_ln)

~/.local/bin/%_ln: %
	@echo Install $< as link
	@ln -s $(CURDIR)/$< $(INSTALL_FOLDER)$<


.PHONY: uninstall
uninstall:
	@echo "Delete all gitui files in installation folder ..."
	@rm $(SCRIPTS_AT_INSTALL_PATH)

