class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.16.4/aptu-coder-0.16.4-aarch64-apple-darwin.tar.gz"
    sha256 "2398fb8fc8b480b5fd19625a561b44d507a03719e0c1f70a5266865711521ba4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.16.4/aptu-coder-0.16.4-aarch64-unknown-linux-musl.tar.gz"
    sha256 "4887ad0377ef16623e4ebc00826e1497bb4ec9ae60f45154f9dccd117ef02c64"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.16.4/aptu-coder-0.16.4-x86_64-unknown-linux-musl.tar.gz"
    sha256 "ec7570fa485dda191d7b87515146ee47ff81d7499b2fdfbbe1fcab8f5dbe8dba"
  end

  service do
    run [opt_bin/"aptu-coder", "--port", "49200"]
    keep_alive false
    log_path var/"log/aptu-coder.log"
    error_log_path var/"log/aptu-coder.log"
  end

  def caveats
    <<~EOS
      aptu-coder defaults to stdio mode: your MCP client (e.g. Claude, goose)
      launches and manages the process directly. This is the recommended mode
      for single-client use and requires no background service.

      To share a single server instance across multiple MCP clients, run it as
      a persistent HTTP service on port 49200:
        brew services start clouatre-labs/tap/aptu-coder
    EOS
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
