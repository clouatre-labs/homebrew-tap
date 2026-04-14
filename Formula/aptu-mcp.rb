class AptuMcp < Formula
  desc "MCP server exposing aptu-core functionality for AI-powered GitHub triage and review"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.2/aptu-mcp-0.3.2-aarch64-apple-darwin.tar.gz"
    sha256 "b165b1370cc797da39d3a02a80cb5441dd5f0f931e8f4d2dc6226e474b1e7390"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.2/aptu-mcp-0.3.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "979d152b3338866d69eea719bf6dfd307f597163d898141e11a6acb70e6dafca"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.2/aptu-mcp-0.3.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "63516aba2c0a40865388807e47ab0f361f7d4cfabc9ebb39f4aee4831ce09d99"
  end
  
  def install
    bin.install "aptu-mcp"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-mcp --version")
  end
end
