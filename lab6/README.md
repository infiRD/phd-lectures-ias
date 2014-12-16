IAS - lab 5
===========
More complex programs
---------------------

- read about instructions operating with stack and about stack principles on this [elaborate wiki page] (https://wis.fit.vutbr.cz/FIT/db/vyuka/ucitel/cwk.php?title=IAS:Cvi%E8en%ED_4&id=9959)
- read about [common usage of x86 registers](http://www.eecg.toronto.edu/~amza/www.mindsec.com/files/x86regs.html)
- download portable version of git [msysgit](https://github.com/msysgit/msysgit/releases), for example [portableGit-1.9.4-preview20140929](https://github.com/msysgit/msysgit/releases/download/Git-1.9.4-preview20140929/PortableGit-1.9.4-preview20140929.7z)
- unpack msysgit into some directory and run its shell using
```bash
./git-cmd.bat
```
- navigate to a suitable directory, e.g. 
```bash
P:
cd P:/
```
- clone the IAS repository using 
```bash
git clone https://github.com/infiRD/IAS.git IAS-master
```
- make your IAS working directory and make your working copy of supplied lab5 workspace 
```bash
mkdir IAS
cp IAS-master/lab5 IAS/ -r
```
- open provided workspace using Codasip Studio at path **P:/IAS/lab4/workspace**
- solve all the tasks


### Aditional information

You might find useful matrix a [multiplication calculator](http://matrix.reshish.com/multiplication.php)

You might want to check out the [tips for Codasip Studio (Slovak only)](https://www.evernote.com/shard/s373/sh/b3ae5877-6faf-461d-9310-37daf9322f16/8033abc217738785).

If you need to download updates to IAS-master from github do the following:
```bash
P:
cd P:/IAS-master
git pull
```
Now you should have an up-to-date vesion of the project.
