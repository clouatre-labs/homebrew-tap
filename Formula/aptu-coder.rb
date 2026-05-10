class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.11.0/aptu-coder-0.11.0-aarch64-apple-darwin.tar.gz"
    sha256 "1b7ef9e6095b6609584064648c306adf2708b47672d6d0e6f0d5700c43661719"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.11.0/aptu-coder-0.11.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "a0ab42785682fb233853ae35376697aa3cc1e1711bc88e7852c0b6cac16ffbb2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.11.0/aptu-coder-0.11.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "18d452e07d0551b2fa158460b172ab11be090eb543d846bea7bcc7b6e3b8b64b"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
