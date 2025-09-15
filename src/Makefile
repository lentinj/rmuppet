# ADMB/muppet versions to bake into package
ADMB_VERSION=admb-13.2
MUPPET_VERSION=2a4ed80

# Work dirs to build sources
# Set to e.g. "/tmp/$(ADMB_VERSION)" to preserve sources between installs for development
ADMB_HOME=admb
MUPPET_HOME=Muppet_HCR

all: $(MUPPET_HOME)/Model/muppet

$(MUPPET_HOME)/Model/muppet: $(ADMB_HOME)/build/admb/admb
	[ -d "$(MUPPET_HOME)" ] || { mkdir -p "$(MUPPET_HOME)" && curl -sL "https://github.com/Hafro/Muppet_HCR/tarball/$(MUPPET_VERSION)" | tar -C "$(MUPPET_HOME)" --strip-components=1 -zxv; }
	$(ADMB_HOME)/build/admb/admb "$(MUPPET_HOME)/Model/muppet.tpl"

$(ADMB_HOME)/build/admb/admb:
	[ -d "$(ADMB_HOME)" ] || { mkdir -p "$(ADMB_HOME)" && curl -sL "https://github.com/admb-project/admb/tarball/$(ADMB_VERSION)" | tar -C "$(ADMB_HOME)" --strip-components=1 -zxv; }
	make -C "$(ADMB_HOME)"
