IAS - lab 6
===========
Calling conventions (stdcall, cdecl)
------------------------------------

- read through [lab6 wiki] (http://wiki.infi-rd.com/index.php?title=IAS_lab6) (Slovak only)
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
cp IAS-master/lab6 IAS/ -r
```
- open provided workspace using Codasip Studio at path **P:/IAS/lab6/workspace**
- solve all the tasks

- check out the [lab6 forum] (http://ias.infi-rd.com/forum/viewtopic.php?f=1&t=2&sid=a3109168e9a104b5e26a71f3003d1429) (Slovak only)

### Aditional information

You might want to read about [common usage of x86 registers](http://www.eecg.toronto.edu/~amza/www.mindsec.com/files/x86regs.html)

You might want to check out the [tips for Codasip Studio (Slovak only)](https://www.evernote.com/shard/s373/sh/b3ae5877-6faf-461d-9310-37daf9322f16/8033abc217738785).

If you need to download updates to IAS-master from github do the following:
```bash
P:
cd P:/IAS-master
git pull
```
Now you should have an up-to-date vesion of the project.
