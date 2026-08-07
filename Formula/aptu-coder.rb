class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.28.0/aptu-coder-0.28.0-aarch64-apple-darwin.tar.gz"
    sha256 "8fcfc607f08f9c82227c604581dc00e8799b6eda091d1145316d704c232ca3e0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.28.0/aptu-coder-0.28.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "a449f1808c25efcb8bef1c31dc066f90129594ae417c2a0caa840b7b235f0076"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.28.0/aptu-coder-0.28.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "fcad5b5c5b51fcfdefa7556b0ffcde40577e7b2782ba9632f07017ddd5ca9d42"
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
