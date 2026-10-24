class Trails < Formula
  desc "Run AI coding agents in tmux, grouped by workspace, reachable from any editor"
  homepage "https://github.com/gunasekar/trails"
  url "https://github.com/gunasekar/trails/archive/refs/tags/v1.8.0.tar.gz"
  sha256 "d0ede2b158c779b36291bf068d56fe269b126824e5e335a8fda5d96ed3a5c2aa"
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
