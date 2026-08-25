class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.15/aptu-cli-0.10.15-aarch64-apple-darwin.tar.gz"
    sha256 "342af1d7e7d1a689b46201797be1b89852662b5ea129bb17bd2c5e6f1efe510d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.15/aptu-cli-0.10.15-aarch64-unknown-linux-musl.tar.gz"
    sha256 "c4c88e660ae5e5f7e485a25c4e28b0e821208f73f5b0f204de8bced3e6bea886"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.15/aptu-cli-0.10.15-x86_64-unknown-linux-musl.tar.gz"
    sha256 "67717c0bd2d42e91b0c76025a17162af137ada4ad90ea7caf647d8e293c10bce"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
