class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.18.1/aptu-coder-0.18.1-aarch64-apple-darwin.tar.gz"
    sha256 "51355f59f78b7907bf2b2e54960134a90ac7db351d47b2a6fb17b208822756a7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.18.1/aptu-coder-0.18.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "cea73b9f2211825a12d6d1b8a6cd4776b0df4b96534aa745de58e240638575d5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.18.1/aptu-coder-0.18.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d1bf6d2c337c417f78a0bfefe1185fc718370953250165a9281eb778741fbebd"
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
