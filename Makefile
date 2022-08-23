PREFIX = $(HOME)/.local
DATE = $(shell date +%Y.%m.%d)

SCRIPTS = \
	sb tp chlt chbrt \
	shot ffrec pw mmv\
	news bm howto \

install:
	mkdir -p "$(PREFIX)/bin"
	cp -f $(SCRIPTS) "$(PREFIX)/bin"

uninstall:
	rm -f $(addprefix $(PREFIX)/bin/,$(SCRIPTS))

dist:
	mkdir -p scripts-$(DATE)
	cp $(SCRIPTS) Makefile scripts-$(DATE)
	tar -czf scripts-$(DATE).tar.gz scripts-$(DATE)
	rm -rf scripts-$(DATE)

.PHONY: install uninstall
