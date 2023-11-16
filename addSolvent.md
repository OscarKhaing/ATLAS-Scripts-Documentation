
# `____.pl`
### High-level Descriptions:



> put description here

Usage (Syntax):
```
usage: addSolvent.pl -i input_structure -f "forcefield(s)" -n solvent_options -o (reverse_order_placement) -t (file type) -w (solvent type) -s (savename) -a (random_rotate_mol_opt)
Required arguments:
	-i input structure:	Location of input structure file.
		Valid entries are
		BGF|MSI|MOL2
		PDB|PQR|XYZ - connections will be generated automatically (if no CONECT tables). 
			NOTE: Forcefield types are assumed to be the same as the atom names
		CHARMM_PSF - Also need to specify CHARMM CRD file (in quotes) or have xxx.crd file in same folder
		AMBER_PRMTOP - Also need to specify AMBER CRD|RST file (in quotes) or have xxx.crd|xxx.rst7 file in same folder
		GROMACS_GRO - Also need to specify TOP|XPLOR file (in quotes) xxx.top|xxx.xplor file in the same folder
	-f forcefield(s): Forcefield file describing the atomic interactions
		1 or more Cerius2|Polygraf|ITP|CHARMM_PRM|GROMACS_TOP formatted forcefields
		Valid entries are
		AMBER91/96/99/03/19 - the AMBER 1991/1996/1999/2003/2019 forcefield for proteins and DNA
		GAFF - the General AMBER forcefield for small molecules
		CHARMM - the CHARMM par_all27_prot_na Protein/Nucleic Acid forcefield
		CHARMM_LIPID - the CHARMM par_all27_prot_lipid Protein/Lipid force field
		DREIDING - The 1990 DREIDING forcefield with F3C waters
		MESODNA - The DNA Meso scale forcefield v.6.0
		REAX - The REAX force field. You may have to specify a location with -r
		REXPON_WAT - The RexPoN-water force field
		--or-- you can specify your own forcefield location
		NOTE: you can specify multiple forcefields by enclosing them in ""
		NOTE: If specifying multiple forcefields with the same atom types,
			the atom type values will come from the last matching forcefield.
	-n solvent options:	Specifies the number of solvent molecules to add. Can be either:
		"density: x.x" - will add solvent atoms to the cell until density x.x is achieved. 
			Will assume that input solvent is equilibrated at denisty of 1 gm/cm3
		"total: x"	 - will add a total of x solvent molecules
		"[x|y|z]:[+|-|=] x.x" - will inflate|set the unit cell by x.x angstoms in specified direction 
			(=,+, -, +/- directions) for the specified dimension (any combo of x,y,z). 
			This option can be used with the previous 2. If none of the other 2 is 
			specified, will assume density 1 gm/cm3. Multiple entries should be
			enclosed in quotes. e.g. "x: +/- 10 y: =10 z: -12"
Optional arguments:
	-o reverse_order_placement: Flag for whether to reverse the order of the final structure, to be solvent:solute.
		Expected no|0 (default) or yes|1
	-t file type: Specifies the formatting of the input file. If not supplied, with default 
		to either the file suffix or to a BGF file if the file has no suffix
	-w solvent type: The following predetermined (equilibrated) solvents are available. Default F3C.
		Alternatively, you can provide the location of your solvent file.
		TIP3: the original Jorgenson TIP3 water model (rigid hydrogens)
		TIP4: TIP4P with massless pseudo-atom
		TIP3_CHARMM: TIP3 water model as implemented in CHARMM
		F3C: F3C water model (no rigid hydrogens)
		SPC: SPC water model (DEFAULT)
		MESO: Water model for Meso-scale simulations (Valeria Molinero)
	-r randomize: When removing molecules, randomize selection. Expected no|0 (default) or yes|1			
	-s savename: Will assume $prefix_mod.$suffix if not specified.
	-a rotate_mol_opt: Will randomely rotate the solvent molecule. Expected no|0 (default) or yes|1




```
* **`-x`** put short description

Where arguments encased in `()` or `[]` are optional. In this case, minimum arguments required are `-i` and `-f`.
 
---


# Behaviors
### `-x`
---
# Examples
Minimal arguments
```
```
-x
```
```
