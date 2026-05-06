class Wick < Formula
  desc "Browser-grade web access for AI agents"
  homepage "https://getwick.dev"
  version "0.10.2"
  license "MIT"

  depends_on "yt-dlp" => :recommended

  on_macos do
    on_arm do
      url "https://github.com/wickproject/wick/releases/download/v0.10.2/wick-darwin-arm64.tar.gz"
      sha256 "1e27ae7e93e9f6dc3eabadf372622e4fdbb02ab569bf92817a1ba1f26e07e005"
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
