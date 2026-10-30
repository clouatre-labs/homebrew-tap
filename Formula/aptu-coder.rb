class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.41.1/aptu-coder-0.41.1-aarch64-apple-darwin.tar.gz"
    sha256 "b14fa3c5ea8260bcaddeb61633559eacf560470a3f8d8082889d6f003806b3a6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.41.1/aptu-coder-0.41.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "8f0e1bf5b41c2c5f2bba638e4912fa7925bd4852d4967d0ceb56d594769dc716"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.41.1/aptu-coder-0.41.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "36bc205f62bf29695c54ec5ea6c39bd5deae1501765236697db95a972eae297d"
  end

  service do
    run [opt_bin/"aptu-coder", "--port", "49200"]
    keep_alive false
    log_path var/"log/aptu-coder.log"
    error_log_path var/"log/aptu-coder.log"
  end

  def install
    bin.install "aptu-coder"
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

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
