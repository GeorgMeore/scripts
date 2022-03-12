PREFIX = $(HOME)/.local

SCRIPTS = bm chlt ffrec fzfeed fztm netdiff news plt sb shot tp

install:
	mkdir -p "$(PREFIX)/bin"
	cp -f $(SCRIPTS) "$(PREFIX)/bin"

uninstall:
	for file in $(SCRIPTS); do rm -f "$(PREFIX)/bin/$$file"; done

.PHONY: install uninstall
