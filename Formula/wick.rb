class Wick < Formula
  desc "Browser-grade web access for AI agents"
  homepage "https://getwick.dev"
  version "0.5.0"
  license "MIT"

  depends_on "yt-dlp" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/wickproject/wick/releases/download/v0.5.0/wick-0.5.0-darwin-arm64.tar.gz"
      sha256 "8f4585f478c4bb734098dddd4660cb60ccce47ac10f7f48e7b382a02110554cc"
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
