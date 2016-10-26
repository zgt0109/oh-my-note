#### Mac下面制作Ubuntu启动U盘
* 下载Ubuntu.iso镜像文件
* 将ISO转换成IMG（不转也行）
* hdiutil convert -format UDRW -o ubuntu-desktop-i386.img ubuntu-desktop-i386.iso
* 查看USB盘符
* diskutil list
* 卸载USB磁盘
* diskutil unmountDisk /dev/disk2（找到对应的设备）
* 使用dd将ubuntu的（ISO）img写入U盘
* sudo dd if=ubuntu-desktop-i386.img.dmg of=/dev/disk2 bs=1m
* 或者 sudo dd if=ubuntu-desktop-i386.iso of=/dev/disk2 bs=1m
* 弹出USB
* diskutil eject /dev/disk2