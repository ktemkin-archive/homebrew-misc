class Minipro < Formula
  desc "Software for universal programmers"
  homepage "https://github.com/vdudouyt/minipro"

  url "https://github.com/vdudouyt/minipro/releases/download/0.0.1/minipro-0.0.1.tar.gz"
  sha256 "168ab8d7414cd3aa8f10791a532d720899287ba2eefeb0781f718c3d1a2fa639"

  head "https://github.com/vdudouyt/minipro.git", :branch => "master"

  depends_on "libusb"

  def install
    args = %W[
      CFLAGS=-I/usr/local/include/libusb-1.0
      CC=#{ENV.cc}
      INSTALL_DIR=#{prefix}
    ]
    system "make", "-f", "Makefile.osx", "install", *args


  end

  test do
    system "minipro"
  end
end
