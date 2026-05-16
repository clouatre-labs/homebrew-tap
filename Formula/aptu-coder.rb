class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.5/aptu-coder-0.13.5-aarch64-apple-darwin.tar.gz"
    sha256 "665817ab0696586b6c694046ca05601f5964aab99ab716f735401f6dd6d3a44a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.5/aptu-coder-0.13.5-aarch64-unknown-linux-musl.tar.gz"
    sha256 "d36c50a51e5dafb1840f808a4f6c281a0eb2469f8b55f3a1559c8a1593051fde"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.5/aptu-coder-0.13.5-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d269e741a468c98bbee6ac0771196832c93aad9a83c2580454ad2810ed204123"
  end

  service do
    run [opt_bin/"aptu-coder", "--port", "49200"]
    keep_alive true
    log_path var/"log/aptu-coder.log"
    error_log_path var/"log/aptu-coder.log"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
