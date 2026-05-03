class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.5.0/aptu-cli-0.5.0-aarch64-apple-darwin.tar.gz"
    sha256 "f5a246283cd6cbe67a7194d8f997f3b56042511699b8130dff0f8a71dfd19509"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.5.0/aptu-cli-0.5.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "5ff4bc94b31708a997638004ab87b436a02466085a0606087bbe2767ed5d3056"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.5.0/aptu-cli-0.5.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "9175def2c0efbf960faa091762da8e68ef5a693b04ce942b462bac4d65cb0a82"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
