class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.26.1/aptu-coder-0.26.1-aarch64-apple-darwin.tar.gz"
    sha256 "42f2755a50afd0a965e168acf2b3b2b3aa0963d7b4f3e9e8493dcae07b83854c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.26.1/aptu-coder-0.26.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "909fedce8a65105eb978518c257a5816e4d52a3b54aa49d3af58a5639578a236"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.26.1/aptu-coder-0.26.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "dcc4e17536a9dcef10714b33b7bf9e04bcf1dbb29dcacaf1b599379e52fd71bd"
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
