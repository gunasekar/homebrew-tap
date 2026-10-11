class Trails < Formula
  desc "Pick, rejoin and restore AI coding agents running in tmux"
  homepage "https://github.com/gunasekar/trails"
  url "https://github.com/gunasekar/trails/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "58406ce5b1ba49db9b060c0e16c6e9558858ecdafad2ddf65bd1484fa4054856"
  license "MIT"
  head "https://github.com/gunasekar/trails.git", branch: "main"

  depends_on "fzf"
  depends_on "tmux"

  def install
    bin.install "bin/trails"
  end

  test do
    assert_match "usage: trails", shell_output("#{bin}/trails help")
  end
end
