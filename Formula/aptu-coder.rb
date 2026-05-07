class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.0/aptu-coder-0.10.0-aarch64-apple-darwin.tar.gz"
    sha256 "c5857759101eef48179a9ede710a9002e5a0cf36cb4d94286e1a430b7786f834"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.0/aptu-coder-0.10.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "300c4f04011aa8bd3e4422627407d11c8f0de234f9f120686aafcc335cb79a0f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.0/aptu-coder-0.10.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "cbe950168bce6922df05f8b2c2b38987356fdec1627711225abc400d4743618b"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
