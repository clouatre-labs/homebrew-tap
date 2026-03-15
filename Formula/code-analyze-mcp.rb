class CodeAnalyzeMcp < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/code-analyze-mcp"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.4/code-analyze-mcp-0.1.4-aarch64-apple-darwin.tar.gz"
    sha256 "e8b315603fcf502a4528e43c2fcbe92c86adb78ae9c88565f218f1eaaaa5e087"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.4/code-analyze-mcp-0.1.4-aarch64-unknown-linux-musl.tar.gz"
    sha256 "018904c5544c91eca8a6b2fc2d365acf2042573fff1e2b2d6c1ad21dc8443b03"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/code-analyze-mcp/releases/download/v0.1.4/code-analyze-mcp-0.1.4-x86_64-unknown-linux-musl.tar.gz"
    sha256 "109991ad11ee1f6b724bd9fccc66b203a4278bb66f4cc4a9e170a351e0fb9c94"
  end

  def install
    bin.install "code-analyze-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/code-analyze-mcp --version")
  end
end
