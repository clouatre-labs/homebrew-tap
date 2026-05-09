class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.4/aptu-coder-0.10.4-aarch64-apple-darwin.tar.gz"
    sha256 "bc6d7a3b922398388d2b8ff0c0164ba00be78b45c2edcca742aaddcea63d33f6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.4/aptu-coder-0.10.4-aarch64-unknown-linux-musl.tar.gz"
    sha256 "8a4cc4c30744718cab769d882342cdd24ee6c0f39df087a54fe14782db613335"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.4/aptu-coder-0.10.4-x86_64-unknown-linux-musl.tar.gz"
    sha256 "738d7dba540bcf8965109cb4e4e84ea0ef01ad0a40b859a6c40b2e9ccb06c8bd"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
