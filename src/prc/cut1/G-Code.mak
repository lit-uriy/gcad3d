# use mit make -f G-Code.mak
# 1. Parameter = inputfilename
# ./G-Code /home/fwork/gCAD3D/tmp/nc.apt


EXENAM  = G-Code


OBJ1 =\
  ../prc/cut1/G-Code.o\


# Sourcen; bei denen keine Abhaengigkeit erforderlich ist.
OBJ2 =\
  ../prc/cut1/pp_ut.o\


# get OUTDIR CC VGUI
include ../options.mak



ADDLIBS = -lm

# Sourcefileliste fuers tagfile
SRC1 = ${OBJ1:.o=.c}
SRC2 = ${OBJ2:.o=.c}


CXFLG = -O0 -g3 -Wall

LKFLG = -lm


$(EXENAM): $(OBJ1) $(OBJ2)
	$(CC) -o $(EXENAM) $(OBJ1) $(OBJ2) $(LKFLG)
	ctags --excmd=number -f ut.tag $(SRC2)
	cp $(EXENAM) $(OUTDIR)/plugins/cut1/.


# vi holt fuer Alt f (grep) damit seine Sourcefileliste
SRCLST:
	@echo $(SRC1) $(SRC2)


.c.o:
	$(CC) -c $(CXFLG) $<
	if test $(@D) != "."; then mv $(@F) $@; fi
	ctags -f $*.tag $<


# EOF
