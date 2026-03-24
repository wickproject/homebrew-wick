class Wick < Formula
  desc "Browser-grade web access for AI agents"
  homepage "https://getwick.dev"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/wickproject/wick/releases/download/v0.4.0/wick-0.4.0-darwin-arm64.tar.gz"
      sha256 "b3c5d3a2fb8960aa92730ef7e8826e06c4bb14f040f5d4b515549ef46dc306c4"
    end
  end

  def install
    bin.install "wick"
  end

  def caveats
    <<~EOS
      To configure Wick for your AI coding tools, run:
        wick setup

      Documentation: https://getwick.dev/docs.html
    EOS
  end

  test do
    assert_match "wick #{version}", shell_output("#{bin}/wick version")
  end
end
