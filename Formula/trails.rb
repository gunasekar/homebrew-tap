class Trails < Formula
  desc "Run AI coding agents in tmux, grouped by workspace, reachable from any editor"
  homepage "https://github.com/gunasekar/trails"
  url "https://github.com/gunasekar/trails/archive/refs/tags/v1.8.4.tar.gz"
  sha256 "38390320a6e24f8239e3d1ab363d3bf40579ee6b7c1567da82f520ec967c1aef"
  license "MIT"
  head "https://github.com/gunasekar/trails.git", branch: "main"

  depends_on "fzf"
  depends_on "jq"
  depends_on "tmux"

  def install
    bin.install "bin/trails"
  end

  def caveats
    <<~EOS
      trails diff (prefix G from trails keys) shows a codebase's changes side
      by side with delta when it is installed, and as plain git output
      without it. For side by side:
        brew install git-delta
    EOS
  end

  test do
    assert_match "usage: trails", shell_output("#{bin}/trails help")
  end
end
