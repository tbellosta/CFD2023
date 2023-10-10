# CFD2023
Repository for the 2023 course of Computational Fluid Dynamics
## 
0. [Oblique Shock](OBLIQUE_SHOCK)
1. [Diamond Airfoil](DIAMOND)
2. [Laminar Boundary Layer](LAMINAR_FLATPLATE)
2. [Turbulent Boundary Layer](TURBULENT_FLATPLATE)


## SOFTWARE
This course will make use of the CFD code [SU2](https://su2code.github.io) (available via a LGPL License). For build instructions please visit [this section of the SU2 website](https://su2code.github.io/docs_v7/Build-SU2-Linux-MacOS/).

Meshes will be generated via [gmsh](https://gmsh.info/) (distributed under a GPL License). As of today (2/10/23) the export of su2 meshes via gmsh is broken in version 4.11.1. Please use version [4.10.5](https://gmsh.info/bin/) to export su2 format meshes from gmsh.

## USEFUL LINKS
- [SU2 presentation paper](utils/SU2_AIAA2016.pdf)
- [Linux cheat sheet](utils/Linux_cheat_sheet.pdf)
- Mesh Spacing Tool. [Credits and explanation](https://www.cfd-online.com/Forums/openfoam-meshing/61785-blockmesh-grading-calculator.html), [source](utils/MeshSpace.zip)
- [Airfoil printer for gmsh](utils/printGeo)

## LECTURES RECORDINGS
Recordings will be available via PoliMI online services
