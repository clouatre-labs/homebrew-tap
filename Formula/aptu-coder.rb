class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.36.1/aptu-coder-0.36.1-aarch64-apple-darwin.tar.gz"
    sha256 "f317ae7af6c573459871069106fe1e450071c1b4e2e85caab248ce300d762bdf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.36.1/aptu-coder-0.36.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "6ad0a1f20ae0d4c782cc71a5950f22e16eb3677d490877ddf8ae881e0c61e491"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.36.1/aptu-coder-0.36.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "b2f3ec84192377e6734b5eb09c8f51266ac096f715b2b82c3481486c96f4037e"
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
