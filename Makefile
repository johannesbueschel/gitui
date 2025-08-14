.EXPORT_ALL_VARIABLES:

define HELP_BODY
\033[1minstall\033[0m
	Installs gitui by copying the files to `~/.local/bin`.

\033[1minstall-links\033[0m
	Installs gitui by creating symbolic links of all files in `~/.local/bin`.

\033[1muninstall\033[0m
	Removes all files in `~/.local/bin` that match `gitui*`.
endef

INSTALL_FOLDER = ~/.local/bin/
SCRIPTS = $(wildcard gitui*)
SCRIPTS_AT_INSTALL_PATH = $(addprefix $(INSTALL_FOLDER), $(SCRIPTS))

.PHONY: help
help:
	@echo "$$HELP_BODY"


.PHONY: checkfzf
checkfzf:
    ifeq (, $(shell command -v fzf))
	    $(error fzf needs to be installed (https://junegunn.github.io/fzf).)
    endif

install: checkfzf $(SCRIPTS_AT_INSTALL_PATH)

~/.local/bin/%: %
	@echo Install $<
	@cp ./$< $@


install-links: checkfzf $(SCRIPTS_AT_INSTALL_PATH:=_ln)

~/.local/bin/%_ln: %
	@echo Install $< as link
	@ln -s $(CURDIR)/$< $(INSTALL_FOLDER)$<


.PHONY: uninstall
uninstall:
	@echo "Delete all gitui files in installation folder ..."
	@rm $(SCRIPTS_AT_INSTALL_PATH)

