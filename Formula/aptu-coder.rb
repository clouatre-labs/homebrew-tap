class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.5/aptu-coder-0.10.5-aarch64-apple-darwin.tar.gz"
    sha256 "c52192ca8bd8a2c9ecdd7aa4eebb1735c81d72ba90181a67293e0488b7fd2cbb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.5/aptu-coder-0.10.5-aarch64-unknown-linux-musl.tar.gz"
    sha256 "8e4035c0801213e2c398a796053266c97f2e3ad6df4469f9243c7aa3e5ce37b9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.5/aptu-coder-0.10.5-x86_64-unknown-linux-musl.tar.gz"
    sha256 "cb7d9d3b9f957f98df5d28b4ae97230372c4024b5bb6f0690f8e1e5d3232927e"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
