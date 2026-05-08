class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.3/aptu-coder-0.10.3-aarch64-apple-darwin.tar.gz"
    sha256 "2d288a5148e6b942197c120f56f1baf3ee922a2f2adb0e8dfa2f9e1625ad48f0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.3/aptu-coder-0.10.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "a28ab8d90928b609119eabdd99e6f52de065bef9c1efc8f8201caac6d7781684"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.3/aptu-coder-0.10.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d8e0945710c57203ab7204e8739a34c11396b972b2860564b269bfc19c966281"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
