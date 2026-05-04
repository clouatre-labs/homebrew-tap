class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.8.0/aptu-coder-0.8.0-aarch64-apple-darwin.tar.gz"
    sha256 "3fec1bbc673c3122f8f6b5794c233b0c31d9c4e62dc6bf185ab82cd5a6536a05"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.8.0/aptu-coder-0.8.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "0e9256611ba3ac40899ed6b9f264e9a05ab07bde3fd99ce42c90f12223c072fd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.8.0/aptu-coder-0.8.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "a127d80f489ab14d48add4cecc50c51ea73e7a932ddb6b7e721f1963d04eb51e"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
