# BatteryTrolled

## Installation
Open the .deb into any package manager

## Building
You will need [Theos](https://github.com/theos/theos)

Then you can run these commands : 
```bash
git clone https//github.com/FireBibi/BatteryTrolled
cd BatteryTrolled
make package FINALPACKAGE=1
```

if you need a rootless package, you can add `THEOS_PACKAGE_SCHEME=rootless` at the end of the make command.

Have fun :)