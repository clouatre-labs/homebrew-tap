class AptuMcp < Formula
  desc "MCP server exposing aptu-core functionality for AI-powered GitHub triage and review"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.0/aptu-mcp-0.4.0-aarch64-apple-darwin.tar.gz"
    sha256 "44a860ccfe64bd2d33d12bea6361b456f7a889e7b518c157c881c746aa38c32e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.0/aptu-mcp-0.4.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "f2ba2fc126fbcb98b8e8b247a9c9d0f61b6f2312f8f61cf2b737fdc4f3603713"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.0/aptu-mcp-0.4.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "4d96af6a3720021863382b85d33753197f76ef0a9f3ad353c1acd1ee7f66e811"
  end
  
  def install
    bin.install "aptu-mcp"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-mcp --version")
  end
end
