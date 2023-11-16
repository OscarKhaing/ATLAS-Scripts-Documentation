# ATLAS-Scripts-Documentation

```
Current progress status:
 up to bgf2amber.pl
 in the alphabetical order (ls command)

Done:
 createLammpsInput.pl

Options Parsing/Refining Needed:
 add.pl
 addBoxToBGF.pl
 addGroup.pl
 addPlus.pl
 addQMCharge.pl
 addRadiiToBGF.pl
 addSolvent.pl
 addchaintobgf.pl
 alanize.pl
 alignMol.pl
 amber2bgf.pl
 amber2dreidingTypes.pl
 amber2mol2Types.pl
 amberAutoType.pl
 amberProteinMutate.pl
 amberRes2Vac.pl
 amberff2cerius.pl
 analyzeSolvation.pl
 assignAMBERcharges.pl
 atom2meso.pl
 atomLammpsTrj2Meso.pl
 autoType.pl
 avgResAtomCharge.pl
 avg_energy.pl
 base_composition.pl
 base_counter.pl
 bgf2VACgrp.pl
 bgf2amber.pl
```


/* Developers' note for Work-In-Progress
```
Below is general format:
     - Name of command
     - High-level Descriptions
     - Behaviors of [OPTIONS]
     - Examples of Usage
```
*/


Summary of General Encounters:

Running these scripts without any argument will automatically prompt usage guide, so it is very crucial to look at them first before actually using the script

When finding specific files, sometimes names are not exact, so it may be more helpful to navigate through layered folders with `ls` and predict where the files are located
The format of usage guides of different scripts can slightly differ: brackets for the createLammpsInput.pl are square[] while those for autoType.pl are parentheses(). What’s important is to discern that the arguments without any brackets are needed for the command to run.
