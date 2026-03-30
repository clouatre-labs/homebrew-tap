class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.21/aptu-cli-0.2.21-aarch64-apple-darwin.tar.gz"
    sha256 "0cd8b1a45b71e152ee324f210795297bf9df3926d9227aaf59e5a29816941c56"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.21/aptu-cli-0.2.21-aarch64-unknown-linux-musl.tar.gz"
    sha256 "83ead8b913c397f1365fd6c3309baa0b6cd3ea0bff9f1b98010db79531c4b817"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.21/aptu-cli-0.2.21-x86_64-unknown-linux-musl.tar.gz"
    sha256 "908411310c437682071c7c6575e661a82904180553a6200da5493db5f0b055ab"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
