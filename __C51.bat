@echo off
::This file was created automatically by CrossIDE to compile with C51.
D:
cd "\UBC\ELEC 291\Lab4\src\"
"D:\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "D:\UBC\ELEC 291\Lab4\src\lab4.c"
if not exist hex2mif.exe goto done
if exist lab4.ihx hex2mif lab4.ihx
if exist lab4.hex hex2mif lab4.hex
:done
echo done
echo Crosside_Action Set_Hex_File D:\UBC\ELEC 291\Lab4\src\lab4.hex
