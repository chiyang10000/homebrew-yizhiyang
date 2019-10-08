require "formula"

class Oushudb < Formula
  url "http://yum.oushu-tech.com/oushurepo/yumrepo/internal/linux/toolchain/OushuDB-Darwin-2019-10-08.tar.xz"
  sha256 "06532d9e353b77752a7bd687ace5a7436bcde488c5c2067b82c3b9c1dc0dbf5d"
  version "4.X"

  depends_on "hadoop"
  keg_only ""

  def install
    system "cp -r local/hawq/* #{prefix}"
    system "sed -i '' 's|GPHOME=.*|GPHOME=#{prefix}|' #{prefix}/greenplum_path.sh"
  end
end
