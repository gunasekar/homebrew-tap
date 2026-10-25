class Trails < Formula
  desc "Run AI coding agents in tmux, grouped by workspace, reachable from any editor"
  homepage "https://github.com/gunasekar/trails"
  url "https://github.com/gunasekar/trails/archive/refs/tags/v1.9.2.tar.gz"
  sha256 "6b59ccc48298f12187bd2b30ce4c0d1ac0a7d709b6298179b437a9d691d4fcd3"
  license "MIT"
  head "https://github.com/gunasekar/trails.git", branch: "main"

  depends_on "fzf"
  depends_on "jq"
  depends_on "tmux"

  def install
    bin.install "bin/trails"
  end

  # The tmux server, outside any terminal: brew services start trails (see trails help).
  service do
    run [opt_bin/"trails", "boot"]
    keep_alive true
    restart_delay 10
    process_type :interactive
    log_path var/"log/trails-boot.log"
    error_log_path var/"log/trails-boot.log"
  end

  def caveats
    <<~EOS
      trails diff (prefix G from trails keys) shows a codebase's changes side
      by side with delta when it is installed, and as plain git output
      without it. For side by side:
        brew install git-delta

      To keep the tmux server outside any terminal, so a Force Quit of one
      can't take your agents with it, and bring lost trails back on start:
        brew services start trails
    EOS
  end

  test do
    assert_match "usage: trails", shell_output("#{bin}/trails help")
  end
end
