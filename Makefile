trusty.tar.xz:
	mkdir -p trusty_root
	fakechroot fakeroot /usr/sbin/debootstrap trusty trusty_root/
	fakechroot fakeroot chroot trusty_root apt-get clean
	rm -rf trusty_root/dev trusty_root/proc trusty_root/sys
	XZ_OPT=-9 tar -C trusty_root -cJf trusty.tar.xz . || rm -rf trusty.tar.xz
	rm -rf trusty_root
