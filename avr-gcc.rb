require 'formula'

# print avr-gcc's builtin include paths
# `avr-gcc -print-prog-name=cc1plus` -v

class AvrGcc < Formula

    homepage 'http://www.gnu.org/software/gcc/gcc.html'
    url 'ftp://gcc.gnu.org/pub/gcc/releases/gcc-5.4.0/gcc-5.4.0.tar.bz2'
    mirror 'http://ftpmirror.gnu.org/gcc/gcc-5.4.0/gcc-5.4.0.tar.bz2'
    sha512 '2941cc950c8f2409a314df497631f9b0266211aa74746c1839c46e04f1c7c299afe2528d1ef16ea39def408a644ba48f97519ec7a7dd37d260c3e9423514265b'

    depends_on 'gmp'
    depends_on 'libmpc'
    depends_on 'mpfr'

    depends_on 'avr-binutils'

    option 'disable-cxx', 'Don\'t build the g++ compiler'

    def install
        # The C compiler is always built, C++ can be disabled
        languages = %w[c]
        languages << 'c++' unless build.include? 'disable-cxx'

        args = [
            "--target=avr",
            "--prefix=#{prefix}",

            "--enable-languages=#{languages.join(',')}",
            "--with-gnu-as",
            "--with-gnu-ld",
            "--with-ld=#{Formula["avr-binutils"].opt_bin/'avr-ld'}",
            "--with-as=#{Formula["avr-binutils"].opt_bin/'avr-as'}",

            "--disable-nls",
            "--disable-shared",
            "--disable-threads",
            "--disable-libssp",
            "--disable-libstdcxx-pch",
            "--disable-libgomp",

            "--with-gmp=#{Formula["gmp"].opt_prefix}",
            "--with-mpfr=#{Formula["mpfr"].opt_prefix}",
            "--with-mpc=#{Formula["libmpc"].opt_prefix}",
            "--with-system-zlib"
        ]

        mkdir 'build' do
            system "../configure", *args
            system "make"

            ENV.deparallelize
            system "make install"
        end

        # info and man7 files conflict with native gcc
        info.rmtree
        man7.rmtree
    end
end

