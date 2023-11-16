
# `____.pl`
### High-level Descriptions:



> put description here

Usage (Syntax):
```
usage: amberProteinMutate.pl -f filename -m mutation name -r (atom selection) -t (filetype) -s (save name)
options:
	-f filename: location of file
	-m mutation name: the name of the amber residue to mutate too
	-r atom selection: the list of atoms (residues) to mutate (see below for syntax). Optional. Default: all
	-r filetype: bgf|mol2|pdb|msi. Optional. Will be calculated if omitted
	-s savename: name of output file
Selection options:
		[^][:][I|T|N][a|r|b|m]
		a   - atom
		r   - residue
		m   - # atoms in molecule (only valid with index)
		b   - total number of bonds of atom (only valid with index)
		IaX - atom number X
		IrX - residue index X
		TaX - atom type X
		NaX - atom name X
		NrX - residue name X
		Use ":" to specify a range, eg. :Tr1-8 :Ia3-66
		Use "^" to exclude a selection. You can use multiple combinations
		range and exclusion enclosed in quotes, eg, "^:TrIP-IM ^:Ia23-45"
		to exclude residues of type IM and IP and atoms 23-45



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
