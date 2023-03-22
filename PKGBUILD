pkgname=edjubert-de
_pkgname=edjubert
_output_dir=~/.config/edjubert
_wm_dir="$_output_dir/dwm"
pkgver=0.1
pkgrel=1
epoch=1
pkgdesc="My desktop install for Arch with DWM (fork of ChadWM)"
arch=('x86_64' 'i686')
url="https://github.com/edjubert/dotfiles"
license=('MIT')
depends=('picom' 'feh' 'acpi' 'rofi' 'pavucontrol' 'dash' 'imlib2' 'xorg-xsetroot' 'wget' 'xorg-server')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('dwm')
conflicts=('dwm')
source=("$_pkgname::git+https://github.com/edjubert/dotfiles.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  mkdir "$_output_dir"
  cp -r "./" "$_output_dir"
  cd "$_wm_dir"
  make
}

package() {
  cd "$_wm_dir"
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -rf * "${pkgdir}/opt/${pkgname}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 ../README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
