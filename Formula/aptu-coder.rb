class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.26.2/aptu-coder-0.26.2-aarch64-apple-darwin.tar.gz"
    sha256 "cf4ffceb7baea3fc54f1738482c91a7d3a235f2def7e4c72458d27950cf31596"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.26.2/aptu-coder-0.26.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "36abc5731bb21a22d54b15cec4f3cea25ce268b7a42f0ad3ab248d5c60d93ef2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.26.2/aptu-coder-0.26.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "151b0c3be40d16c3bd5d9222456ce416641fc566db48eb3fb329473263561e1e"
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
