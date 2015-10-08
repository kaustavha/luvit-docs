NODE = node
UNAME_S := $(shell uname -s)

apidoc_sources = $(wildcard doc/api/*.markdown)
apidocs = $(addprefix out/,$(apidoc_sources:.markdown=.html)) \
		$(addprefix out/,$(apidoc_sources:.markdown=.json))

apidoc_dirs = out/doc out/doc/api/ out/doc/api/assets

apiassets = $(subst api_assets,api/assets,$(addprefix out/,$(wildcard doc/api_assets/*)))

docclean:
	-rm -rf out/doc

doc: docclean $(apidoc_dirs) $(apiassets) $(apidocs) tools/doc/

$(apidoc_dirs):
	mkdir -p $@

out/doc/api/assets/%: doc/api_assets/% out/doc/api/assets/
	cp $< $@

out/doc/%: doc/%
	cp -r $< $@

out/doc/api/%.json: doc/api/%.markdown $(NODE_EXE)
	$(NODE) tools/doc/generate.js --format=json $< > $@

out/doc/api/%.html: doc/api/%.markdown $(NODE_EXE)
	$(NODE) tools/doc/generate.js --format=html --template=doc/template.html $< > $@

docopen: out/doc/api/all.html
ifeq ($(UNAME_S), Darwin)
	open -a "Google Chrome" out/doc/api/all.html
else
	-google-chrome out/doc/api/all.html
endif
