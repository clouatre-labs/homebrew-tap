class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.4/aptu-coder-0.20.4-aarch64-apple-darwin.tar.gz"
    sha256 "4ee39e997007f65fd6dabb64f702a55fabd8ccef3854fee18080afd6d608bc0c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.4/aptu-coder-0.20.4-aarch64-unknown-linux-musl.tar.gz"
    sha256 "a50eee4d5d92a0740bc3f6e68ac44c6c0e19b08683fe73ba6a66ce1dfe964e54"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.20.4/aptu-coder-0.20.4-x86_64-unknown-linux-musl.tar.gz"
    sha256 "a706e2fb9bf9df546ed46d324e0ad209954311867e93ad6ab65c982458587780"
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
