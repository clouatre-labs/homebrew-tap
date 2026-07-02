class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.22.1/aptu-coder-0.22.1-aarch64-apple-darwin.tar.gz"
    sha256 "53a6ddee604eac52fa731edc208b1820d805165d15405d8bdbc1d2b9fc1a3be0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.22.1/aptu-coder-0.22.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "38e3c6c0c782f7c622b7afacaeb2eb98fb049a199b9c508c73cf8854f4c52490"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.22.1/aptu-coder-0.22.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "5db5174cc724ec3ff73e2cc9e2720192726ef1255bef7baa0d2b8ad1eb8766cc"
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
