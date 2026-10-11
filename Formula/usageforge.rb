class Usageforge < Formula
  desc "Start your Claude Code and Codex 5-hour usage window on your schedule"
  homepage "https://kenny2077.github.io/UsageForge/"
  url "https://github.com/kenny2077/UsageForge/archive/refs/tags/v3.6.0.tar.gz"
  sha256 "9203bd90ff11b55ea283b9b1ecd7900a87e649cd2a003773fe61dcbfd34cf424"
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
