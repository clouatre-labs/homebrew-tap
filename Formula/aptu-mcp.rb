class AptuMcp < Formula
  desc "MCP server exposing aptu-core functionality for AI-powered GitHub triage and review"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.17/aptu-mcp-0.2.17-aarch64-apple-darwin.tar.gz"
    sha256 "5f1c2eb27d741bd6a96f1a7e43a9d1b0c18b104dfc2b90ea4a10b6f02e6d67ab"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.17/aptu-mcp-0.2.17-aarch64-unknown-linux-musl.tar.gz"
    sha256 "d39306faa616d55676fa0016fe72bb314e6b1362f2734256f651d1de861e4cac"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.17/aptu-mcp-0.2.17-x86_64-unknown-linux-musl.tar.gz"
    sha256 "8ea532eb8399b0cd7ef72c1868445ed34116f88087814ef2e8bd6339fd70f138"
  end
  
  def install
    bin.install "aptu-mcp"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-mcp --version")
  end
end
