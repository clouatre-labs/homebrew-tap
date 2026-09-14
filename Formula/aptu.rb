class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.20/aptu-cli-0.10.20-aarch64-apple-darwin.tar.gz"
    sha256 "dff4756ba1aa8be94651245549c680357db6c3864043e177c2de001386fe04b9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.20/aptu-cli-0.10.20-aarch64-unknown-linux-musl.tar.gz"
    sha256 "fc97ce5fec2f2c4d4441fc0d80a0a425a2990137baacfeaae03c39fd89c65cf1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.20/aptu-cli-0.10.20-x86_64-unknown-linux-musl.tar.gz"
    sha256 "070a3dffe3a817dc059f5ced00bbf6c0ca4f23b7885dfd7f98b53722167d97b1"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
