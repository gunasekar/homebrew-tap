class Trails < Formula
  desc "Run AI coding agents in tmux, grouped by workspace, reachable from any editor"
  homepage "https://github.com/gunasekar/trails"
  url "https://github.com/gunasekar/trails/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "c8a64b23da0edc67ed2a34242562facd1460d97ea0372f61c7ffb34607487028"
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
