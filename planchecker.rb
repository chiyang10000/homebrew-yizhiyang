require "formula"

class Planchecker < Formula
  url "http://yum.oushu-tech.com/oushurepo/yumrepo/internal/linux/toolchain/planchecker-1.0.0.tar.xz"
  sha256 "7fe66166fb7cdf95b0f35b67b977c4d14af6c5ba7ce02ca257870720a1ab8068"

  def install
    bin.install "planchecker"
    prefix.install "templates"
    prefix.install "assets"
  end
end
