class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.8.1/aptu-coder-0.8.1-aarch64-apple-darwin.tar.gz"
    sha256 "cb90308394d5a927cd6865f7f9f10585620ec427fa49a4d9f7bf6e612aaae592"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.8.1/aptu-coder-0.8.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "d07edf19e5227b05ba93e899649381288806eaa05f4dbcbabe52a60c4dcfee8f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.8.1/aptu-coder-0.8.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "5e5c765de9d2d1bf820a5c13453eee4ea86ccdef39c4665142aade9bf6499318"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
