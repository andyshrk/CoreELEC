# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)

PKG_NAME="libdevmapper"
PKG_VERSION="2.03.25"
PKG_SHA256="4bea6fd2e5af9cdb3e27b48b4efa8d89210d9bfa13df900e092e404720a59b1d"
PKG_ARCH="any"
PKG_LICENSE="GPLv2 LGPL2.1"
PKG_SITE="https://sourceware.org/lvm2"
PKG_URL="https://sourceware.org/ftp/lvm2/LVM2.$PKG_VERSION.tgz"
PKG_SOURCE_DIR="LVM2.$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain libaio util-linux"
PKG_SECTION="sysutils"
PKG_SHORTDESC="Logical Volume Manager 2 - only libdevmapper library."
PKG_BUILD_FLAGS="-gold"

LVM2_CONFIG_DEFAULT="ac_cv_func_malloc_0_nonnull=yes \
                     ac_cv_func_realloc_0_nonnull=yes \
                     --disable-use-lvmlockd \
                     --disable-selinux \
                     --disable-dbus-service \
                     --with-cache=none \
                     --with-thin=none \
                     --with-clvmd=none \
                     --with-cluster=none"

PKG_CONFIGURE_OPTS_TARGET="$LVM2_CONFIG_DEFAULT \
                           --with-optimisation=-Os \
                           --disable-readline \
                           --disable-applib \
                           --disable-cmdlib \
                           --disable-blkid_wiping \
                           --disable-use-lvmetad \
                           --with-mirrors=none \
                           --disable-use-lvmpolld \
                           --disable-dmeventd \
                           --disable-dmfilemapd \
                           --disable-blkdeactivate \
                           --disable-udev_sync \
                           --disable-udev_rules \
                           --disable-pkgconfig \
                           --disable-fsadm \
                           --disable-nls"

PKG_MAKEINSTALL_OPTS_TARGET="install_dynamic \
                             install_include \
                             -C libdm"

makeinstall_target() {
  make install DESTDIR=${SYSROOT_PREFIX} -j1 \
    ${PKG_MAKEINSTALL_OPTS_TARGET} M_INSTALL_PROGRAM="-m 755"

  make install DESTDIR=${INSTALL} \
    ${PKG_MAKEINSTALL_OPTS_TARGET} M_INSTALL_PROGRAM="-m 755"
}
