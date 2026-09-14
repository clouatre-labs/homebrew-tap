class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.33.0/aptu-coder-0.33.0-aarch64-apple-darwin.tar.gz"
    sha256 "8f2ad812efb556e22f3ef10efc5949ce7f86dd2b843de07d69f9d3c90e358280"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.33.0/aptu-coder-0.33.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "ae75f844569800a458c6c39dfa61ed75ba064e99cf3d90ffd075e33331ce61cd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.33.0/aptu-coder-0.33.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "8b609dc7ee0fb86b73974c3970010cade66072831df235c33badcea201f4d14e"
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
