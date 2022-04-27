PREFIX = $(HOME)/.local
DATE = $(shell date +%Y.%m.%d)

SCRIPTS = bm chlt chbrt ffrec netdiff news plt sb shot tp howto dfo pw

install:
	mkdir -p "$(PREFIX)/bin"
	cp -f $(SCRIPTS) "$(PREFIX)/bin"

uninstall:
	for file in $(SCRIPTS); do rm -f "$(PREFIX)/bin/$$file"; done

dist:
	mkdir -p scripts-$(DATE)
	cp $(SCRIPTS) Makefile scripts-$(DATE)
	tar -cf scripts-$(DATE).tar scripts-$(DATE)
	gzip scripts-$(DATE).tar
	rm -rf scripts-$(DATE)

.PHONY: install uninstall
