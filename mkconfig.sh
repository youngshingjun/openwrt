#!/bin/bash

rm -f .config*
touch .config

device=$1
if [ "$1" = "cm520" ];then
    echo "CONFIG_TARGET_ipq40xx_generic_DEVICE_mobipromo_cm520-79f=y" >> .config
    sed -i 's/192.168.1.1/192.168.123.1/' ./package/base-files/files/bin/config_generate
else 
    echo "CONFIG_TARGET_ipq40xx_generic_DEVICE_p2w_r619ac-128m=y" >> .config
    sed -i 's/192.168.123.1/192.168.1.1/' ./package/base-files/files/bin/config_generate
fi

cat >> .config <<EOF
CONFIG_TARGET_ipq40xx=y
CONFIG_TARGET_ipq40xx_generic=y
EOF

cat >> .config <<EOF
CONFIG_PACKAGE_block-mount=y
CONFIG_PACKAGE_blockd=y
CONFIG_PACKAGE_kmod-fs-vfat=y
CONFIG_PACKAGE_kmod-fs-ext4=y
CONFIG_PACKAGE_kmod-fs-exfat=y
CONFIG_PACKAGE_kmod-fuse=y
CONFIG_PACKAGE_kmod-usb-storage-extras=y
CONFIG_PACKAGE_kmod-usb-storage-uas=y
CONFIG_PACKAGE_dnsmasq=n
CONFIG_PACKAGE_dnsmasq-full=y
CONFIG_PACKAGE_luci=y
CONFIG_LUCI_LANG_en=y
CONFIG_LUCI_LANG_zh_Hans=y
CONFIG_PACKAGE_luci-app-accesscontrol=y
CONFIG_PACKAGE_luci-app-aria2=y
CONFIG_PACKAGE_luci-app-cpufreq=y
CONFIG_PACKAGE_luci-app-hd-idle=y
CONFIG_PACKAGE_luci-app-samba=y
CONFIG_PACKAGE_luci-app-ssr-plus=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_V2ray=y
CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_ShadowsocksR_Socks=y
CONFIG_V2RAY_COMPRESS_UPX=n
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-unblockneteasemusic=y
CONFIG_PACKAGE_luci-app-upnp=y
CONFIG_PACKAGE_luci-app-vlmcsd=y
CONFIG_PACKAGE_luci-app-vsftpd=y
CONFIG_PACKAGE_luci-app-wifischedule=y
CONFIG_PACKAGE_luci-app-wrtbwmon=y
CONFIG_PACKAGE_luci-theme-material=y
CONFIG_PACKAGE_aria2=y
CONFIG_ARIA2_NOXML=y
CONFIG_ARIA2_BITTORRENT=y
CONFIG_ARIA2_SFTP=y
CONFIG_ARIA2_ASYNC_DNS=y
CONFIG_ARIA2_COOKIE=y
CONFIG_ARIA2_WEBSOCKET=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_wpad-basic=n
CONFIG_PACKAGE_wpad=y
CONFIG_PACKAGE_wget=y
CONFIG_PACKAGE_htop=y
CONFIG_PACKAGE_vim-fuller=y
CONFIG_PACKAGE_openssh-sftp-server=y
CONFIG_PACKAGE_iperf3=y
CONFIG_PACKAGE_bind-dig=y
EOF

make defconfig