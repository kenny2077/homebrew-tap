class Usageforge < Formula
  desc "Start your Claude Code and Codex 5-hour usage window on your schedule"
  homepage "https://kenny2077.github.io/UsageForge/"
  url "https://github.com/kenny2077/UsageForge/archive/refs/tags/v3.7.8.tar.gz"
  sha256 "203f7fafa6c8cfb9479d8982b6092efb25c3962c70d1df161951e13cce2abdf1"
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
