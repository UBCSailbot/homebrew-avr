require 'formula'

class AvrGdb < Formula

    homepage 'http://www.gnu.org/software/gdb/'
    url "http://ftp.gnu.org/gnu/gdb/gdb-7.11.tar.gz"
    mirror "http://ftpmirror.gnu.org/gnu/gdb/gdb-7.11.tar.gz"
    sha256 '9382f5534aa0754169e1e09b5f1a3b77d1fa8c59c1e57617e06af37cb29c669a'

    depends_on 'avr-binutils'

    def install
        args = [
            "--target=avr",
            "--prefix=#{prefix}",

            "--disable-nls",
            "--disable-libssp",
            "--disable-install-libbfd",
            "--disable-install-libiberty",

            "--with-gmp=#{Formula["gmp"].opt_prefix}",
            "--with-mpfr=#{Formula["mpfr"].opt_prefix}",
            "--with-mpc=#{Formula["libmpc"].opt_prefix}",
            "--with-cloog=#{Formula["cloog"].opt_prefix}",
            "--with-isl=#{Formula["isl012"].opt_prefix}"
        ]

        mkdir 'build' do
            system "../configure", *args
            system "make"

            ENV.deparallelize
            system "make install"
        end

        # info conflicts with binutils
        info.rmtree
    end
end
