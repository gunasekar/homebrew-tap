class Trails < Formula
  desc "Pick, rejoin and restore AI coding agents running in tmux"
  homepage "https://github.com/gunasekar/trails"
  url "https://github.com/gunasekar/trails/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "31595d3c669c197646555ebded4b45e9610ad17b8c372b897fd94a42e6f8622b"
  license "MIT"
  head "https://github.com/gunasekar/trails.git", branch: "main"

  depends_on "fzf"
  depends_on "jq"
  depends_on "tmux"

  def install
    bin.install "bin/trails"
    (pkgshare/"swiftbar").install Dir["extras/swiftbar/*"]
  end

  def caveats
    return unless OS.mac?

    <<~EOS
      trails ships a SwiftBar menu-bar plugin. With SwiftBar installed
      (brew install --cask swiftbar) and a plugin folder chosen, run:
        trails swiftbar
    EOS
  end

  test do
    assert_match "usage: trails", shell_output("#{bin}/trails help")
  end
end
