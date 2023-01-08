pkgname=kime-patched-git
pkgver=2.5.6.r35.gff4e009
pkgrel=1
pkgdesc="Korean IME"
url="https://github.com/skystar-p/kime"
conflicts=('kime' 'kime-git')
provides=('kime')
optdepends=('gtk2: gtk2 support'
            'gtk3: gtk3 support'
            'gtk4: gtk4 support'
            'qt5-base: qt5 support'
            'qt6-base: qt6 support'
            'wayland: wayland support')
depends=('dbus' 'fontconfig' 'freetype2' 'libxcb')
makedepends=('git' 'cargo' 'clang' 'llvm' 'cmake' 'wayland')
arch=('any')
license=('GPL3')
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -b2-
}

# FIXME
build() {
    cd "${pkgname}"
    # Clean build cache
    rm -rf build || true
    scripts/build.sh -ar
}

package() {
    cd "${pkgname}"
    scripts/install.sh "${pkgdir}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
