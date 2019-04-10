require "formula"

class Oushudb < Formula
  url "http://yum.oushu-tech.com/oushurepo/yumrepo/internal/linux/toolchain/OushuDB-Darwin.tar.xz"
  version "4.X"

  depends_on "hadoop"
  keg_only ""

  def install
    system "cp -r local/hawq/* #{prefix}"
    system "sed -i '' 's|GPHOME=.*|GPHOME=#{prefix}|' #{prefix}/greenplum_path.sh"
  end
end
