# PCBOps Simple Template Makefile
# jobs underscored ci_ orchestrate automated builds,
# add cutom jobs below
#



PYTHON=python
ECHO=echo
EEPLOT=eeplot
PROJECT=example

PLOT_SCRIPT=kicad_cicd/plotter.py

OUTPUT_DIR=output
PROJECT_DIR=kicad
LIB_DIR=lib

INPUT_FILE=$(PROJECT_DIR)/$(PROJECT).kicad_pcb
PROJECT_FILE=$(PROJECT_DIR)/$(PROJECT).pro


all: ci_plot ci_sch


ci_plot:
	$(PYTHON) $(PLOT_SCRIPT) $(INPUT_FILE) $(OUTPUT_DIR)/gerbers

ci_sch:
	$(EEPLOT) $(LIB_DIR)/*.lib $(PROJECT_FILE) -o $(OUTPUT_DIR)/$(PROJECT).pdf

ci_drawings:
	$(ECHO) "NYI"	

ci_step:
	$(ECHO) "NYI"

ci_pnp:
	$(ECHO) "NYI"

ci_bom:
	$(ECHO) "NYI"

ci_drc:
	$(ECHO) "NYI"

ci_erc:
	$(ECHO) "NYI"

ci_rfq:
	$(ECHO) "NYI"



clean:
	$(RM) -r $(OUTPUT_DIR)

ECHO:
	@$(ECHO) <EOF
Python      : $(PYTHON)
Plot Script : $(PLOT_SCRIPT)
Output Dir  : $(OUTPUT_DIR)
Input Board : $(INPUT_FILE)
Echo cmd    : $(ECHO)
Eeplot cmd  : $(EEPLOT)
Project     : $(PROJECT)

.PHONY: ci_plot ci_sch all ECHO

