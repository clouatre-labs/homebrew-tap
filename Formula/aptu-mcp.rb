class AptuMcp < Formula
  desc "MCP server exposing aptu-core functionality for AI-powered GitHub triage and review"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.1/aptu-mcp-0.4.1-aarch64-apple-darwin.tar.gz"
    sha256 "ce234e9ec421056f0d683cd6bd9088118d05d68cfdd638f01c46694430f21483"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.1/aptu-mcp-0.4.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "8c55ba452bbdae8db4e2942520f678066adfe5507a19f8ea7ae1ac0bbf02a424"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.1/aptu-mcp-0.4.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "de9dd1055f52f832c6e1d042666a9ef33c56aaca02ac96fac9389bd16dac24ed"
  end
  
  def install
    bin.install "aptu-mcp"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-mcp --version")
  end
end
