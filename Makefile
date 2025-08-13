.EXPORT_ALL_VARIABLES:

define HELP_BODY
\033[1minstall\033[0m
	Installs gitui by copying the files to `~/.local/bin`.

\033[1minstall-links\033[0m
	Installs gitui by creating symbolic links of all files in `~/.local/bin`.

\033[1muninstall\033[0m
	Removes the copied files (matching gitui*).
endef

INSTALL_FOLDER = ~/.local/bin/
SCRIPTS = $(wildcard gitui*)
SCRIPTS_AT_INSTALL_PATH = $(addprefix $(INSTALL_FOLDER), $(SCRIPTS))

.PHONY: help
help:
	@echo "$$HELP_BODY"


install: $(SCRIPTS_AT_INSTALL_PATH)

~/.local/bin/%: %
	@echo Install $<
	@cp ./$< $@


install-links: $(SCRIPTS_AT_INSTALL_PATH:=_ln)

~/.local/bin/%_ln: %
	@echo Install $< as link
	@ln -s $(CURDIR)/$< $(INSTALL_FOLDER)$<


.PHONY: uninstall
uninstall:
	@echo "Delete all gitui files in installation folder ..."
	@rm $(SCRIPTS_AT_INSTALL_PATH)

