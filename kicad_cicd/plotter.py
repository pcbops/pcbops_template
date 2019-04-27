import sys
import os

import pcbnew
from pcbnew import *

file_name = os.path.abspath(sys.argv[1])
output_dir = os.path.abspath(sys.argv[2])

print("Running KiCAD Plotter CI/CD Script on %s output to %s"%(file_name, output_dir,))

try:
    os.makedirs(output_dir)
except OSError:
    pass


board = pcbnew.LoadBoard(file_name)
pctl = pcbnew.PLOT_CONTROLLER(board)
popt = pctl.GetPlotOptions()
popt.SetOutputDirectory(output_dir)
popt.SetPlotFrameRef(False)
popt.SetLineWidth(pcbnew.FromMM(0.1))

popt.SetAutoScale(False)
popt.SetScale(1)
popt.SetMirror(False)

popt.SetUseGerberAttributes(True)
popt.SetUseGerberProtelExtensions(True)

popt.SetExcludeEdgeLayer(True)
popt.SetUseAuxOrigin(False)
pctl.SetColorMode(True)

popt.SetSubtractMaskFromSilk(False)
popt.SetPlotReference(True)
popt.SetPlotValue(False)

layers = [
    ("F.Cu", pcbnew.F_Cu, "Top layer"),
    ("B.Cu", pcbnew.B_Cu, "Bottom layer"),
    ("F.Paste", pcbnew.F_Paste, "Paste top"),
    ("B.Paste", pcbnew.B_Paste, "Paste bottom"),
    ("F.SilkS", pcbnew.F_SilkS, "Silk top"),
    ("B.SilkS", pcbnew.B_SilkS, "Silk top"),
    ("F.Mask", pcbnew.F_Mask, "Mask top"),
    ("B.Mask", pcbnew.B_Mask, "Mask bottom"),
    ("Edge.Cuts", pcbnew.Edge_Cuts, "Edges"),
]

for layer_info in layers:
    pctl.SetLayer(layer_info[1])
    pctl.OpenPlotfile(layer_info[0], pcbnew.PLOT_FORMAT_GERBER, layer_info[2])
    pctl.PlotLayer()
    pctl.ClosePlot()
