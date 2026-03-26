class Wick < Formula
  desc "Browser-grade web access for AI agents"
  homepage "https://getwick.dev"
  version "0.6.0"
  license "MIT"

  depends_on "yt-dlp" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/wickproject/wick/releases/download/v0.6.0/wick-0.6.0-darwin-arm64.tar.gz"
      sha256 "4510639d0bc094ad013ca2ccc3e641b7ec65a89e949bcd8e50fde47ae9532e67"
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
