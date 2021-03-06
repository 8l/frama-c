##########################################################################
#                                                                        #
#  This file is part of WP plug-in of Frama-C.                           #
#                                                                        #
#  Copyright (C) 2007-2016                                               #
#    CEA (Commissariat a l'energie atomique et aux energies              #
#         alternatives)                                                  #
#                                                                        #
#  All rights reserved.                                                  #
#  Contact CEA LIST for licensing.                                       #
##########################################################################


# --------------------------------------------------------------------------
# ---  Coq Compilation
# --------------------------------------------------------------------------

.PHONY: all why3compile coqwpcompile clean depend

WPLSHARE=$(Wp_DIR)/share

clean::
	find $(WPLSHARE) \( -name "*.vo" -or -name "*.glob" \) -print -delete
	rm -f $(WPLSHARE)/coqwp/.depend $(WPLSHARE)/why3/.depend

#########################
## For why3 directory ##

ifeq ($(WP_WHY3COQC_ENABLED),yes)

byte:: why3compile
opt:: why3compile

why3compile: $(addprefix $(WPLSHARE)/why3/, $(addsuffix o, $(COQ_LIBS_CEA)))

WHY3LIB:=$(shell why3 --print-libdir)
WHY3INCLUDES= -R $(WHY3LIB)/coq Why3 -R $(WPLSHARE)/why3 ''

$(WPLSHARE)/why3/%.vo: $(WPLSHARE)/why3/%.v
	echo "Coqc         $@"
	@coqc $(WHY3INCLUDES) $<

$(WPLSHARE)/why3/.depend: $(addprefix $(WPLSHARE)/, $(WHY3_COQ_SOURCES))
	echo "Coqdep for $(WPLSHARE)/why3"
	@coqdep $(WHY3INCLUDES) -slash $(WPLSHARE)/why3/*.v $(WPLSHARE)/why3/**/*.v > $@

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(MAKECMDGOALS),distclean)
ifneq ($(MAKECMDGOALS),smartclean)
sinclude $(WPLSHARE)/why3/.depend
endif
endif
endif

endif # ($(WP_WHY3COQC_ENABLED),yes)

#########################
## For coqwp directory ##

ifeq ($(WP_COQC_ENABLED),yes)

byte:: coqwpcompile
opt:: coqwpcompile


coqwpcompile: $(addprefix $(WPLSHARE)/coqwp/, $(addsuffix o, $(COQ_LIBS_CEA) $(COQ_LIBS_INRIA)))

COQWPINCLUDES= -R $(WPLSHARE)/coqwp ''

$(WPLSHARE)/coqwp/%.vo: $(WPLSHARE)/coqwp/%.v
	echo "Coqc         $<"
	@coqc $(COQWPINCLUDES) $<

$(WPLSHARE)/coqwp/.depend: $(addprefix $(WPLSHARE)/, $(WP_COQ_SOURCES))
	echo "Coqdep for $(WPLSHARE)/coqwp"
	@coqdep $(COQWPINCLUDES) -slash $(WPLSHARE)/coqwp/*.v $(WPLSHARE)/coqwp/**/*.v > $@

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(MAKECMDGOALS),distclean)
ifneq ($(MAKECMDGOALS),smartclean)
sinclude $(WPLSHARE)/coqwp/.depend
endif
endif
endif

endif #($(WP_COQC_ENABLED),yes)

# End of file

##########################################################################
# Local Variables:
# mode: makefile
# End:
