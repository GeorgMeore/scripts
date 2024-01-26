PREFIX = /usr/local
DATE = $(shell date +%Y.%m.%d)

SCRIPTS = sb tp brt clip shot ffrec pw mmv news bm

.PHONY: install
install: $(SCRIPTS)
	mkdir -p "$(PREFIX)/bin"
	cp -f $(SCRIPTS) "$(PREFIX)/bin"

.PHONY: uninstall
uninstall:
	rm -f $(addprefix $(PREFIX)/bin/,$(SCRIPTS))

.PHONY: dist
dist:
	mkdir -p scripts-$(DATE)
	cp $(SCRIPTS) Makefile scripts-$(DATE)
	tar -czf scripts-$(DATE).tar.gz scripts-$(DATE)
	rm -rf scripts-$(DATE)
