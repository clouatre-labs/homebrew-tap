class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.25.4/aptu-coder-0.25.4-aarch64-apple-darwin.tar.gz"
    sha256 "4f53680067b40970edca41b0cf2d5a875868c6750ea6227f260f3695fc16ce71"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.25.4/aptu-coder-0.25.4-aarch64-unknown-linux-musl.tar.gz"
    sha256 "090ba2cd5762ca8bf725ad50912af3649f09012f806b0a53fc4caaf141a3e51f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.25.4/aptu-coder-0.25.4-x86_64-unknown-linux-musl.tar.gz"
    sha256 "1bcaf8af03e2338a84f716e5dc64ebdcdde5e6303c5c4c5229a78e69c91b3b96"
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
