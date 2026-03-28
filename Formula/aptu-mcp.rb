class AptuMcp < Formula
  desc "MCP server exposing aptu-core functionality for AI-powered GitHub triage and review"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.19/aptu-mcp-0.2.19-aarch64-apple-darwin.tar.gz"
    sha256 "3502b3a070fc043b3d0ee43e05b82187b1549092da19400637fc36b12992b654"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.19/aptu-mcp-0.2.19-aarch64-unknown-linux-musl.tar.gz"
    sha256 "8ecc92abf5e7282aa70dd002bcce770f3cf035df2f8effe4f9ed6c2cf8292431"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.19/aptu-mcp-0.2.19-x86_64-unknown-linux-musl.tar.gz"
    sha256 "3d2c5a2c6bea37aba2d51103e6cca066bfdf59df2dbe62c54c7a4dbc9c816535"
  end
  
  def install
    bin.install "aptu-mcp"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-mcp --version")
  end
end
