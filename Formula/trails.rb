class Trails < Formula
  desc "Pick, rejoin and restore AI coding agents running in tmux"
  homepage "https://github.com/gunasekar/trails"
  url "https://github.com/gunasekar/trails/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "3a3b85cdeffca49230cb4cd512faa7fd431459337b7258db34cb037603778433"
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
