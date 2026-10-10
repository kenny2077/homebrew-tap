class Usageforge < Formula
  desc "Start your Claude Code and Codex 5-hour usage window on your schedule"
  homepage "https://kenny2077.github.io/UsageForge/"
  url "https://github.com/kenny2077/UsageForge/archive/refs/tags/v3.2.2.tar.gz"
  sha256 "1e59dd35ab023ad033039244c5124c5ee714f8853f35465ebea65a6e155c4e3f"
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
