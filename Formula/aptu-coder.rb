class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.15.3/aptu-coder-0.15.3-aarch64-apple-darwin.tar.gz"
    sha256 "359a670042713537633e50415728755941b0e16bded0a7c603865bd19fa36640"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.15.3/aptu-coder-0.15.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "368441b6027280e9b94d88b9e29c30a335d6f7f95f2fa54879e99b234575bc2d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.15.3/aptu-coder-0.15.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "02019c2c9ff8a8a8255eb856f6ecfc53c9136dc45221a09b272d53863b605f57"
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
