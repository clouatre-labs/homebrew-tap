class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.43.0/aptu-coder-0.43.0-aarch64-apple-darwin.tar.gz"
    sha256 "3c978209052f34472aed64909e07a6266bd47f1de2f9779ebf8e94065ed277c5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.43.0/aptu-coder-0.43.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "b0becd18ed08dd73ebb46395f8caae2274b8916b90ae8ff0c68d30f4c64791d2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.43.0/aptu-coder-0.43.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "47813faa0ad2356251de07274eaabc3b5cfb54d532b7c7523acf23233aa08397"
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
