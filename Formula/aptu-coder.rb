class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.17.0/aptu-coder-0.17.0-aarch64-apple-darwin.tar.gz"
    sha256 "240ccc64a5fb4f43c922abfd4f3eac48a3a22688ca51f0021dc5903775dfdec8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.17.0/aptu-coder-0.17.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "e41b0dc573127640abafdd8d7b2b37c499ba75f60764d9e72da0754f5810c462"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.17.0/aptu-coder-0.17.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d6ae2049c9202e8a76cd7641802544e39780446d20ace8af150ac5d7cc2371be"
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
