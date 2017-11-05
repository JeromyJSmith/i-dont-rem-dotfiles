# Use master makefile to build subdirectories recursive makefiles, drop output in root
CURR=$(PWD)

.PHONY: force

all: gitcheck

gitcheck: force
	$(MAKE) -C gitcheck/

#color: force
#	$(MAKE) -C color/

# figure out how to loop and clean them all
clean:
	$(MAKE) -C $(CURR)/gitcheck/ clean
