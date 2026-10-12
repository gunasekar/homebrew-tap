class Trails < Formula
  desc "Pick, rejoin and restore AI coding agents running in tmux"
  homepage "https://github.com/gunasekar/trails"
  url "https://github.com/gunasekar/trails/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "8145a02231542d3416e87bebf817bc534f0f38f3b2cfc4a55dd5df5110e1d48d"
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
