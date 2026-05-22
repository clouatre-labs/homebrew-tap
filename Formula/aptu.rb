class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.4/aptu-cli-0.8.4-aarch64-apple-darwin.tar.gz"
    sha256 "9ee7fa9b4c1bbc5e0829f614c41812470ded6c2aeb6b9aad434c01c279c3d677"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.4/aptu-cli-0.8.4-aarch64-unknown-linux-musl.tar.gz"
    sha256 "cfa9c79d8eebecca719872a284c53d6f684d2cfba17b6f7247354e004bf2c97e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.4/aptu-cli-0.8.4-x86_64-unknown-linux-musl.tar.gz"
    sha256 "900ce81e83fa848b618cf030f410508d2e400a6d8926808e039152894f283acb"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
