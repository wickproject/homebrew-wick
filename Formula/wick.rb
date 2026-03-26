class Wick < Formula
  desc "Browser-grade web access for AI agents"
  homepage "https://getwick.dev"
  version "0.7.0"
  license "MIT"

  depends_on "yt-dlp" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/wickproject/wick/releases/download/v0.7.0/wick-0.7.0-darwin-arm64.tar.gz"
      sha256 "766f48f0eb1cfb220352f9fb266fb97504fe456cea9670a1d1f3516b3ae8f725"
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
