class Wick < Formula
  desc "Browser-grade web access for AI agents"
  homepage "https://getwick.dev"
  version "0.12.0"
  license "MIT"

  depends_on "yt-dlp" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/wickproject/wick/releases/download/v0.12.0/wick-darwin-arm64.tar.gz"
      sha256 "2be11b7979e72bbb17be0656efbceabe9221c8ae0d9aa275fce3c9dc0814e77f"
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
