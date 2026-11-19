class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.47.0/aptu-coder-0.47.0-aarch64-apple-darwin.tar.gz"
    sha256 "62b1b6e618161243e18d702cf789bbe341c4a0ca3eccef6b612e8dad1054b89c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.47.0/aptu-coder-0.47.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "7d91e6ffa68e210771fe291f63931dd34f0a2518870037c52ffa5888ab33f0d1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.47.0/aptu-coder-0.47.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "e382ef9b5d4ba980731c4483c5d12e472b207e2719fe2c92d06ca022dc82e913"
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
