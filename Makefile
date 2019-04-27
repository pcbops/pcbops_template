PYTHON=python
PLOT_SCRIPT=kicad_cicd/plotter.py
OUTPUT_DIR=output
INPUT_FILE=kicad/project.kicad_pcb
ECHO=echo
EEPLOT=eeplot
PROJECT=example

ci_plot:
	$(PYTHON) $(PLOT_SCRIPT) $(INPUT_FILE) $(OUTPUT_DIR)

ci_sch:
	$(EEPLOT) kicad/$(PROJECT).lib kicad/$(PROJECT).pro -o $(OUTPUT_DIR)/$(PROJECT).pdf

ECHO:
	@$(ECHO) "test"


.PHONY: ci_build ECHO
