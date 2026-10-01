class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.39.0/aptu-coder-0.39.0-aarch64-apple-darwin.tar.gz"
    sha256 "2605825345808298a72ab791a20bbdd3ae2877e9af0fa74dfcca704b64fdcace"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.39.0/aptu-coder-0.39.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "f36661d8b9495f2bbaf65dbb9829277325fb7310fec797df6d160a2a4a07dba9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.39.0/aptu-coder-0.39.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d0acd894c28884fe49f807b5ccd42dd53c5478e0e8343ed924496eca6af43de8"
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
