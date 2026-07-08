class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.25.0/aptu-coder-0.25.0-aarch64-apple-darwin.tar.gz"
    sha256 "68be16e9a7a6aa1bab231add18a75430217edeadabcd520961fcd3159b91dbed"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.25.0/aptu-coder-0.25.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "b3651df23772725d0cd6b59bdf6f41720bd75718621dcdb2fd9861322bc6aeea"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.25.0/aptu-coder-0.25.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "805c1fb0de6a1b96272d18bdf670c90ee103cf49db5e45e81b0f75141e81847b"
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
