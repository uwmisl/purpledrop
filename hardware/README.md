# PurpleDrop

Main printed circuit board design for PurpleDrop. 

The board design is done in KiCad v5.

Schematic print: [PurpleDrop_rev6.1_schematic.pdf](output/PurpleDrop_rev6.1_schematic.pdf)

Fab drawing: [PurpleDrop_rev6.1_fab.pfd](output/PurpleDrop_rev6.1_fab.pdf)

![Front View](output/front_render.png)
![Back View](output/back_render.png)

## BOM Generation

The [KiBom](https://github.com/SchrodingersGat/KiBoM) plugin is used to generate a BOM file, based on settings in `bom.ini`.

To re-generate the BOM output:

First, install kibom: `pip install kibom`. 

Add a new BOM plugin in the "Generate BOM" dialog in eeschema, and configure it
with this command line: 
`python -m kibom "%I" "%O.csv"`

Run the BOM plugin. 