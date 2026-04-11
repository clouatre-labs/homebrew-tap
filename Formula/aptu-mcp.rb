class AptuMcp < Formula
  desc "MCP server exposing aptu-core functionality for AI-powered GitHub triage and review"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.1/aptu-mcp-0.3.1-aarch64-apple-darwin.tar.gz"
    sha256 "2e2859073c4e5d96868eddec49c3e5725a883aee144670d56da679af509a3939"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.1/aptu-mcp-0.3.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "269053d8e8a1feee2087c2ddf20d6e228889dadf9607180faa80480b8b554c9f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.1/aptu-mcp-0.3.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "0abf4dabe182b866ad79fec637c120c5dc32e2c21ee998e92d1db47e6926429a"
  end
  
  def install
    bin.install "aptu-mcp"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-mcp --version")
  end
end
