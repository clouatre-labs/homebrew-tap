class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.38.0/aptu-coder-0.38.0-aarch64-apple-darwin.tar.gz"
    sha256 "3ebee73e12db3d63c9e46015c361ef586371118db4ab3211c1ffbc8063e632f1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.38.0/aptu-coder-0.38.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "fb421e104f926edc11b7c164f66870b8fde9a30ba549aa4c10bd3a1fdd817b4a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.38.0/aptu-coder-0.38.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "1f749ed78572b652540eee86daad9aabc7f1f63c210ceed3d0923688acceaf47"
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
