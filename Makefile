PREFIX = $(HOME)/.local
DATE = $(shell date +%Y.%m.%d)

SCRIPTS = bm chlt chbrt ffrec netdiff news sb shot tp howto dfo pw sponge

install:
	mkdir -p "$(PREFIX)/bin"
	cp -f $(SCRIPTS) "$(PREFIX)/bin"

uninstall:
	for file in $(SCRIPTS); do rm -f "$(PREFIX)/bin/$$file"; done

dist:
	mkdir -p scripts-$(DATE)
	cp $(SCRIPTS) Makefile scripts-$(DATE)
	tar -czf scripts-$(DATE).tar.gz scripts-$(DATE)
	rm -rf scripts-$(DATE)

.PHONY: install uninstall
