
# `AutoType.pl`
### High-level Descriptions:


> `AutoType.pl` types atoms in the input data file and creates a `.bgf` data file in the **working directory**.

Usage (Syntax):
```
./autoType.pl -i input_file -f force field -b (type bonds=no) -t (filetype=bgf|mol2|pdb|xyz) -a (atom selection = all) -s (bgf_file_savename)
```
* **`-i`** takes an data file as input
* **`-f`** takes an `.ff` force field file 
* **`[-b]`** indicates bond type
* **`[-t]`** indicates the file type 
* **`[-a]`**
* **`[-s]`** saves the file under the specified name

Where arguments encased in `()` or `[]` are optional. In this case, minimum arguments required are `-i` and `-f`.
 
---


# Behaviors
### `-i`

### `-f`

### `[-b]`

### `[-t]`


### `[-a]`


### `[-s]`
Save file is automatically created without specifying -s in current working directory, but -s can be used to specify name with same behavior (needs explicit file extension as it doesn’t automatically append `.bgf`)
---
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
