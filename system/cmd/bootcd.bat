@ECHO OFF
call qemu.bat -boot d -m 256 -cdrom %*
