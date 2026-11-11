class Trails < Formula
  desc "Run AI coding agents in tmux, grouped by workspace, reachable from any editor"
  homepage "https://github.com/gunasekar/trails"
  url "https://github.com/gunasekar/trails/archive/refs/tags/v1.23.0.tar.gz"
  sha256 "a8c366601c72199860d52d450c4dd9318fe12d6549c0afa45a7345ca8d9cccd2"
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
      trails diff (prefix G from trails tmux-config) shows a live diff in Hunk:
        brew install hunk

      On tmux 3.8 or later, prefix followed by backtick opens a native floating
      pane. Reload the Trails server's tmux configuration after upgrading.

      To keep the tmux server outside any terminal, so a Force Quit of one
      can't take your agents with it, and bring lost trails back on start:
        brew services start trails
    EOS
  end

  test do
    assert_match "usage: trails", shell_output("#{bin}/trails help")
  end
end
