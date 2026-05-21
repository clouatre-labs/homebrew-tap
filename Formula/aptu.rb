class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.2/aptu-cli-0.8.2-aarch64-apple-darwin.tar.gz"
    sha256 "855935934e9af0ca54fdad3a0c36ded2817e9479e436ad159d3c541439d6f87a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.2/aptu-cli-0.8.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "4fbf3f2c2f2b999eacf88a32b4836204f280f384caed8948831a8c2f1cea51b9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.2/aptu-cli-0.8.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "af8a29d6c17f4285532be381b5847fe7327555d2f39189061f23abb2e6c6e6a8"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
