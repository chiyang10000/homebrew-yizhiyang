require "formula"

class Oushudb < Formula
  url "http://yumazure.oushu-tech.com:12000/oushurepo/yumrepo/internal/linux/toolchain/bak/OushuDB-Darwin-2020-12-08.tar.xz"
  sha256 "04065ce5d0f9fb8627a230902b38322a14af9f72451ea7ab3502326e1dff630c"
  version "2020-12-08"

  depends_on "hadoop"
  keg_only ""

  def install
    system "cp -r local/hawq/* #{prefix}"
    system "sed -i '' 's|GPHOME=.*|GPHOME=#{prefix}|' #{prefix}/greenplum_path.sh"
  end
end
