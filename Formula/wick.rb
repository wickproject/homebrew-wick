class Wick < Formula
  desc "Browser-grade web access for AI agents"
  homepage "https://getwick.dev"
  version "0.9.1"
  license "MIT"

  depends_on "yt-dlp" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/wickproject/wick/releases/download/v0.9.1/wick-darwin-arm64.tar.gz"
      sha256 "7618186ea87d3eb08b96a56ef8c5fda04d0b0fafe634b09715ac652d1f8c2e30"
    end
  end

  def install
    bin.install "wick"
  end

  def caveats
    <<~EOS
      To configure Wick for your AI coding tools, run:
        wick setup

      To start the HTTP API server:
        wick serve --api

      Documentation: https://getwick.dev/docs.html
    EOS
  end

  test do
    assert_match "wick #{version}", shell_output("#{bin}/wick version")
  end
end
