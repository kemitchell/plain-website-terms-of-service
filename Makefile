COMMONMARK=node_modules/.bin/commonmark
MUSTACHE=node_modules/.bin/mustache

terms.html: terms.md.filled blanks.json | $(COMMONMARK)
	$(COMMONMARK) --smart $< > $@

.INTERMEDIATE: terms.md.filled

terms.md.filled: blanks.json terms.md | $(MUSTACHE)
	$(MUSTACHE) $^ > $@

$(COMMONMARK):
	npm install
