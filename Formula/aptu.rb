class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.1/aptu-cli-0.12.1-aarch64-apple-darwin.tar.gz"
    sha256 "bc0ab9a7eb2afbe6cb1a3011cb3942c375ef39fb198122df8162c03d8b71e5b2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.1/aptu-cli-0.12.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "d3ed875b98bf43d6880a68b039085acd60b360039e7396c2bfe63976d2c41619"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.1/aptu-cli-0.12.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "57bbc5c99d4c39fcf4c20c74cdb8bdc14e8f184fd0b0f409176dbebabbe941f0"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
