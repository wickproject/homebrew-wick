class Wick < Formula
  desc "Browser-grade web access for AI agents"
  homepage "https://getwick.dev"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wickproject/wick/releases/download/v0.2.0/wick-0.2.0-darwin-arm64.tar.gz"
      sha256 "9d38cdcd01ab6a662989d87c14709bd998a5be62aacd40599104f745e630683a"

      resource "wick-captcha" do
        url "https://github.com/wickproject/wick/releases/download/v0.2.0/wick-captcha"
        sha256 "e2071ce2d46cf67a9558f163ca838f1378a5cf10b36e0dd89fce4c8eff8b46e9"
      end
    end
  end

  def install
    bin.install "wick"

    resource("wick-captcha").stage do
      bin.install Dir["*"].first => "wick-captcha"
    end
  end

  def caveats
    <<~EOS
      To configure Wick for your AI coding tools, run:
        wick setup
    EOS
  end

  test do
    assert_match "wick #{version}", shell_output("#{bin}/wick version")
  end
end
