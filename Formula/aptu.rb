class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.13/aptu-0.2.13-aarch64-apple-darwin.tar.gz"
    sha256 "6204f1752cc2ddf19e35e23ee78404ca60ba2374a2e295040bbb1cbbcf853e84"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.13/aptu-0.2.13-aarch64-unknown-linux-musl.tar.gz"
    sha256 "bc04e7202d8466ecc3e6a22a1c50f052e68811050d0cbf08db577ddd0e622bc6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.13/aptu-0.2.13-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d3e06d4b2c1deb8fef9c448ae9d05caaf31f418fc3d002b546ab8ba87edda174"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
