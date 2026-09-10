class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.5/aptu-coder-0.32.5-aarch64-apple-darwin.tar.gz"
    sha256 "d33d183c1dff01d04c0fb9f7962241745b939a8c537dae8e60ee062576881c47"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.5/aptu-coder-0.32.5-aarch64-unknown-linux-musl.tar.gz"
    sha256 "b3faf42a3ad37125c17ff0996e8c341e261864a068a0bcbe84d88677c484bc35"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.32.5/aptu-coder-0.32.5-x86_64-unknown-linux-musl.tar.gz"
    sha256 "c4bf976f049a8a7adf13688ad302c2bb4daaf9cc753119a1bb9a27739806341f"
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
