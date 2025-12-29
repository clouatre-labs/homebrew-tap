class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.9/aptu-0.2.9-aarch64-apple-darwin.tar.gz"
    sha256 "5732c52f94d634111a97c78c7a1b097fb818f20f21dacdae79879b834a69b3af"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.9/aptu-0.2.9-aarch64-unknown-linux-musl.tar.gz"
    sha256 "df9e62a0d3e843f885808dcec31ee7dbf08f0e710d6ba61cb16f553266278a44"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.9/aptu-0.2.9-x86_64-unknown-linux-musl.tar.gz"
    sha256 "f53fe3d57d165331c8966769038f7ec4f8c1d48f95f7b9baf48e8e4e92243d2a"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
