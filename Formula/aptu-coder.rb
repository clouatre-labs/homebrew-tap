class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.42.0/aptu-coder-0.42.0-aarch64-apple-darwin.tar.gz"
    sha256 "f9667026a091dc6ae84248be652b23d6002e0f9e5b4e39bdba856f598bbea1c5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.42.0/aptu-coder-0.42.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "e2f497a65c708d7d558999fc6f0ac500fb60a7d9f4e12ea0feb94b62221d81d2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.42.0/aptu-coder-0.42.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "a222fef9ed177400c5871c01db0054faa183afa0fe368e0dc69636d7225ae413"
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
