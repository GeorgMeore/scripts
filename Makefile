PREFIX = /usr/local
DATE = $(shell date +%Y.%m.%d)

SCRIPTS = \
	sb sbupd tp brt vol \
	shot ffrec pw mmv\
	news bm howto \

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
