class Trails < Formula
  desc "Pick, rejoin and restore AI coding agents running in tmux"
  homepage "https://github.com/gunasekar/trails"
  url "https://github.com/gunasekar/trails/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "6f62195a8a1ea57cd77bcd8a58ab84b6acf2486a257dd1dc47451dc068f2140c"
  license "MIT"
  head "https://github.com/gunasekar/trails.git", branch: "main"

  depends_on "fzf"
  depends_on "jq"
  depends_on "tmux"

  def install
    bin.install "bin/trails"
  end

  test do
    assert_match "usage: trails", shell_output("#{bin}/trails help")
  end
end
