class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.40.1/aptu-coder-0.40.1-aarch64-apple-darwin.tar.gz"
    sha256 "2b867bec7a890397af7707700fc812c354a7aceff7e0a310f98d4b0092df2412"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.40.1/aptu-coder-0.40.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "843e39942389f60c80f480ee8cf7e334a98d18d7a277541513751711dea37ff6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.40.1/aptu-coder-0.40.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "c75df921eefe58b25883b6b395ff28ad9954c3063aba646b8e79c643a33f935a"
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
