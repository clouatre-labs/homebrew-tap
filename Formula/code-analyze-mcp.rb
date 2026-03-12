class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.0/code-analyze-mcp-0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "abef7076b8ea0fec337e3b22fa69f35559d2cf8b2bd8bf01762d5652337cf91d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.0/code-analyze-mcp-0.1.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "0815d0c06002105f26d385d6adef17d6216236598dc1e7222be3718934607cd2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.0/code-analyze-mcp-0.1.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "360b9d7b313ccd17b929280b317ede6d536fb583accc89d7f343f9e09d9d3b90"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
