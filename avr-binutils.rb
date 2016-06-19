require 'formula'

class AvrBinutils < Formula

    homepage 'http://www.gnu.org/software/binutils/binutils.html'
    url 'http://ftpmirror.gnu.org/binutils/binutils-2.26.tar.gz'
    mirror 'http://ftp.gnu.org/gnu/binutils/binutils-2.26.tar.gz'
    sha256 '9615feddaeedc214d1a1ecd77b6697449c952eab69d79ab2125ea050e944bcc1'

    # Support for -C in avr-size. See issue
    # https://github.com/larsimmisch/homebrew-avr/issues/9
    patch :p0 do
        url 'https://gist.github.com/larsimmisch/4190960/raw/b36f3d6d086980006f097ae0acc80b3ada7bb7b1/avr-binutils-size.patch'
        sha256 '1776fa53ec8c8cc6031c205be0ca358db32fccef7831d29d17b3435309ef7a1c'
    end

    def install
        args = [
            "--disable-debug",
            "--disable-dependency-tracking",
            "--target=avr",
            "--prefix=#{prefix}",
            "--infodir=#{info}",
            "--mandir=#{man}",
            "--disable-werror",
            "--disable-nls"
        ]

        mkdir 'build' do
            system "../configure", *args

            system "make"
            system "make install"
        end

        info.rmtree # info files conflict with native binutils
    end
end
