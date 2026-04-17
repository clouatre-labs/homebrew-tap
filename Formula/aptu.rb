class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.1/aptu-cli-0.4.1-aarch64-apple-darwin.tar.gz"
    sha256 "b260819431110437ff15ee257fbb0ed8ffba3fe221da9204288739d31c6a5730"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.1/aptu-cli-0.4.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "a8df02fac3e25b003c47303823742b8704af4f3c0163df7e354bc420f35d411e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.1/aptu-cli-0.4.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "217aaeb0ac223a1fb912c5d3097dafef84872ed9426077f455511208d2a16898"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
