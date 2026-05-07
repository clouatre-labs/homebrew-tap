class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.9.0/aptu-coder-0.9.0-aarch64-apple-darwin.tar.gz"
    sha256 "f403507f9b30ef7790c82906494c1a74316d5530d1ab3621022534d61aeeb978"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.9.0/aptu-coder-0.9.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "13d7efb4dc995ead4bb44327d4ec630d4965118467359cca58d298b7beff9eda"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.9.0/aptu-coder-0.9.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "37142bb6ac876b6edecf65072438e2daf1e79f6d935599cc5cf04f7dd390b26a"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
