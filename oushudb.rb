require "formula"

class Oushudb < Formula
  url "http://yum.oushu-tech.com/oushurepo/yumrepo/internal/linux/toolchain/OushuDB-Darwin-2019-09-29.tar.xz"
  sha256 "1937e2ff8cd8fafd1302afa67d59083e39cde51f3a8ded0e69748d0ff2c563f9"
  version "4.X"

  depends_on "ossp-uuid"
  depends_on "hadoop"
  keg_only ""

  def install
    system "cp -r local/hawq/* #{prefix}"
    system "sed -i '' 's|GPHOME=.*|GPHOME=#{prefix}|' #{prefix}/greenplum_path.sh"
  end
end
