class Wick < Formula
  desc "Browser-grade web access for AI agents"
  homepage "https://getwick.dev"
  version "0.4.0"
  license "MIT"

  depends_on "yt-dlp" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/wickproject/wick/releases/download/v0.4.0/wick-0.4.0-darwin-arm64.tar.gz"
      sha256 "567c4f83c523da30bab824f6a46b6c03ba58b332e65bd098e61b73c9d374811d"
    end
  end

  def install
    bin.install "wick"
  end

  def caveats
    <<~EOS
      To configure Wick for your AI coding tools, run:
        wick setup

      For media downloads (wick download), yt-dlp is recommended:
        brew install yt-dlp

      Documentation: https://getwick.dev/docs.html
    EOS
  end

  test do
    assert_match "wick #{version}", shell_output("#{bin}/wick version")
  end
end
