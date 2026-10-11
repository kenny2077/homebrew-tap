class Usageforge < Formula
  desc "Start your Claude Code and Codex 5-hour usage window on your schedule"
  homepage "https://kenny2077.github.io/UsageForge/"
  url "https://github.com/kenny2077/UsageForge/archive/refs/tags/v3.7.0.tar.gz"
  sha256 "b7a1af5f8028c0a3bd8c8b030359d6987fb611f963b5a8191e78ab27dafab36a"
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
