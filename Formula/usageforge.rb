class Usageforge < Formula
  desc "Start your Claude Code and Codex 5-hour usage window on your schedule"
  homepage "https://kenny2077.github.io/UsageForge/"
  url "https://github.com/kenny2077/UsageForge/archive/refs/tags/v3.8.7.tar.gz"
  sha256 "61940f7496f2fde5cdbaad8ba31a8231ce15879f30a0a2d4ba2d66b6a5a3e56d"
  license "MIT"

  depends_on "jq"

  def install
    libexec.install "usageforge", "ui"
    (libexec/"docs").install "docs/assets"
    bin.install_symlink libexec/"usageforge"
  end

  def caveats
    <<~EOS
      Open the control panel:  usageforge ui
      Check your setup:        usageforge doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/usageforge --version")
  end
end
