# `createLammpsInput.pl`
### High-level Descriptions:

> `AutoType.pl` generate LAMMPS data and input files from a bgf structure.

Usage (Syntax):
```
./createLammpsInput.pl -b structureFile -f "ff1 ff2..." -s [suffix] -t [sim template] -q [qeq/pqeq file] -r [reax/rexpon file] -i [inputFile_coeffs] -o [other_options]
```
* **`-b`**
* **`-f`** 
* **`[-s]`** 
* **`[-t]`**
* **`[-q]`**
* **`[-r]`** 
* **`[-i]`**
* **`[-o]`**


Where arguments encased in `()` or `[]` are optional. In this case, minimum arguments required are `-i` and `-f`.
 
---


# Behaviors
### `-b`
-b structureFile:
                Valid entries are
                BGF|MSI|MOL2
                PDB|PQR|XYZ - connections will be generated automatically (if no CONECT tables).
                        NOTE: Forcefield types are assumed to be the same as the atom names
                CHARMM_PSF - Also need to specify CHARMM CRD file (in quotes) or have xxx.crd file in same folder
                AMBER_PRMTOP - Also need to specify AMBER CRD|RST file (in quotes) or have xxx.crd|xxx.rst7 file in same folder
                GROMACS_GRO - Also need to specify TOP|XPLOR file (in quotes) xxx.top|xxx.xplor file in the same folder
### `-f`
-f "forcefield1 forcefield2...":
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

### `[-s]`
-s [suffix]: (optional) When specified, the program will generate in.[suffix]
                and data.[suffix] as the files. If not specified, the output will be
                in.lammps, data.lammps
### `[-t]`
-t [control file template]: (optional). Specifies the type of input file to create. See /home/oscar-khaing/ATLAS-toolkit/scripts/dat/LAMMPS for a list

### `[-q]`
-q [qeq/pqeq/polarization file]: (optional) Specifies either the QEq/PQEq/Drude parameters set.

### `[-r]`
-r [reax/rexpon file]: (optional) Specifies either the ReaxFF  or RexPoN forcefield file
### `[-i]`
-i [write inputfile options]: (optional). If set to 1, then assumes -o "write_inputfile_coeffs write_inputfile_type_charges". Default 0      

### `[-o]`
-o [options]: (optional). Controls various options in input file. Valid entries include:
                "amoeba_monopole" - switch from full multipole to monopole only amoeba
                "2D or dimension 2" - for 2D simulations
                "compress_parms" - compress parameters to eliminate multiples with the same values.
                "finite" - for 0D (isolated) simulations
                "ewald vdw" - calculate long range vdw using ewald summations. Only valid for lj and exp6 potentials.
                "no shake|shake solute/solvent" - shake constraints on the hydrogens are turned on by default.
                        This turns it off or applies it to the solute or solvent only
                "no_labels" - Specfies whether to supress writing atom type based label for the coefficients. Default yes
                "nobonds:" 'atom selection' - Delete all bonds involving selected atoms. If no atom selection give, then will delete ALL bonds!!     
                "sort_fftypes" - Sort the fftypes alphabetically and renumber accordingly. Default 0: fftypes sorted
                        based on encountered order in structure file
                "write_inputfile_coeffs" - Specifies whether to write the coefficients in the input file, instead of the data file. Default 0        
                "write_inputfile_type_charges" - Specifies whether to write the charge of the atom types from the forcefield (if provided)
                        in the forcefield. Default 0
                "write_inputfile_pair_off_diag" - Specifies whether to write the off diagonal components to the input file. By default, this is done 
                "fep:" 'atom selection'. Write simulation parameters to perform a FEP simulation on atom selection(s)
                "qeq" - dynamically determine the charge during dynamics using the QEQ charge equilibration scheme.
                        See the -x option to specify the parameter set, else the default set will be used
                "pqeq" - dynamically determine the partial atomic charge during dynamics using the PQEq scheme.
                        See the -x option to specify the parameter set, else the default set will be used
                        NOTE: The charges are repesented as gaussian distributions (not point charges) and associated with
                                the coul/pqeq pair style.
                "charge x" - overall charge on system with pqeq. Default 0
                "electrode:" 'atom selection_1' ('atom_selection_2')" - for QEq simulations, this invokes the ECHEMDID method,
                        based on the Chi parameter of the specified forcefield. The format is top electrode, bottom electrode.
                        If only is specified then the fftype is for both. Same for conp simulations (see above)
                        "conp" - Activate the CONP options for electrochemical cell simulations. Must be use in conjunction with the 'electrode' flag                        "fixedQ" - Activate the fixed charge electrode option. Must be used in conjunction with the 'electrode' flag
                "polarizable:" 'atom selection(s)' [adiabatic/drude/thole/pqeq]" - Turns on shell polarization options.
                        The atom selection(s) should be enclosed in quotes and is based on the usual selection criteria.
                        The shell polarization options are:
                                adiabatic: adiabatic core/shell model,
                                drude: drude induced dipole,
                                thole: drude induced dipole with thole short range screening,
                                pqeq: represent the electrostatics between the atoms using overlap of gaussian types orbitals,
                                        as opposed to point dipoles in the other options.
                "rigid: 'atom selection(s)'" - Treat the specified atoms (and their associated molecules) as rigid bodies during dynamics
                "include_file:" - Include a file with LAMMPS code after the data_read line. Use for further customization

# Examples
Minimal arguments
```
(base) oscar-khaing@MSI:~/ATLAS-toolkit/Documentation-Robert$ perl ../scripts/autoType.pl -i pss75.neutral.bgf -f ../ff/UFF.ff
Initializing...Done
Getting atom data from bgf file pss75.neutral.bgf...Using Box Information from file...Done
Loading CERIUS force field..sucessfully loaded 1 force field
Typing Atoms...Done
Creating pss75.neutral.typed.bgf....Done
(base) oscar-khaing@MSI:~/ATLAS-toolkit/Documentation-Robert$ ls
pss75.neutral.bgf  pss75.neutral.typed.bgf
```
-s savefile name
```
(base) oscar-khaing@MSI:~/ATLAS-toolkit/Documentation-Robert$ perl ../scripts/autoType.pl -i pss75.neutral.bgf -f ../ff/UFF.ff -s "example-save-name"Initializing...Done
Getting atom data from bgf file pss75.neutral.bgf...Using Box Information from file...Done
Loading CERIUS force field..sucessfully loaded 1 force field
Typing Atoms...Done
Creating example-save-name....Done
(base) oscar-khaing@MSI:~/ATLAS-toolkit/Documentation-Robert$ ls
example-save-name  pss75.neutral.bgf  pss75.neutral.typed.bgf
```
