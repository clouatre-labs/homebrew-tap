class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.7/aptu-0.2.7-aarch64-apple-darwin.tar.gz"
    sha256 "9f4c448c8f8a8eb5ff8d8d3365dde4ad3abf658e06a71b5a00e114a6d11cc22b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.7/aptu-0.2.7-aarch64-unknown-linux-musl.tar.gz"
    sha256 "77925d1bcc3cd75332c172b7d84b28e860a527434aceece515be26fcf94b5c9a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.7/aptu-0.2.7-x86_64-unknown-linux-musl.tar.gz"
    sha256 "3ccd5ebcb7531acdb5176697d9d2cdd31d28d307237b98166af35e4073de695a"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
