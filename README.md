# Mortal Kombat for the NES
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

![Logo](.github/logo.png)

This is a hack of the Hummer Team's bootleg "Mortal Kombat 2" cartridge (which was actually a demake of Mortal Kombat 1) for the NES.

- Improved graphics
- New sound engine
- Improved music and sound effects
- Bug fixes

## Screenshots:
![Screenshot 1](.github/MK1_010.png)
![Screenshot 2](.github/MK1_011.png)
![Screenshot 3](.github/MK1_012.png)
![Screenshot 4](.github/MK1_013.png)
![Screenshot 5](.github/MK1_014.png)

## How to assemble the ROM (Windows)

[Download](https://github.com/FoxCunning/nes-MK1/archive/refs/heads/main.zip) or clone the repository.
`git clone https://github.com/FoxCunning/nes-mk1`

Simply double-click the `assemble.cmd` script.
You will find MK1.nes in the `out` folder.

## Animation editor

![AnimEd](.github/editor.png)

You will find this in the `tools` folder.
If you have Python installed, you can simply open and then run the `animed.pyw` source file.
To create an executable, edit the `build.bat` script and modify it to use your UPX installation path.

```
::Replace with UPX installation path
pyinstaller -F -w -s -i editor.ico --upx-dir F:\Programs\UPX\ animed.pyw
```

Then run the script. The executable will be created in the `dist` folder.
