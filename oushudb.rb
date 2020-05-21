require "formula"

class Oushudb < Formula
  url "http://yum.oushu-tech.com/oushurepo/yumrepo/internal/linux/toolchain/OushuDB-Darwin-2020-05-21.tar.xz"
  sha256 "c9cc8d649755af3318daaf6da68b3d673c0b246145971393f8fa99a4ad99e8da"
  version "4.X"

  depends_on "hadoop"
  keg_only ""

  def install
    system "cp -r local/hawq/* #{prefix}"
    system "sed -i '' 's|GPHOME=.*|GPHOME=#{prefix}|' #{prefix}/greenplum_path.sh"
  end
end
