class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.5/aptu-cli-0.12.5-aarch64-apple-darwin.tar.gz"
    sha256 "e4543ab85356c81dc02e6161f53cb5db38fc0a1f3713546fcdd270ea76f778cb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.5/aptu-cli-0.12.5-aarch64-unknown-linux-musl.tar.gz"
    sha256 "45350eef1c50a5e1750a8ec9fee111dce6eaf5c473adc25f50de2c0d225f3a45"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.5/aptu-cli-0.12.5-x86_64-unknown-linux-musl.tar.gz"
    sha256 "44287ea16c3d578a92d95e55660e812d0c80afc7dcb6d8c9916970a6b7a7444b"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
