class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.15.1/aptu-coder-0.15.1-aarch64-apple-darwin.tar.gz"
    sha256 "055b8116f2e72c0029f77a609d0b1d0b22edb3becc7c06781ccdbec18f3a1f1d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.15.1/aptu-coder-0.15.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "58ecabcc198862b77a5f7ba001f1c20b9871048ff27ceaacbd33fddc876a6e70"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.15.1/aptu-coder-0.15.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "fd39df899d9118cd9ba34b09b0bf7ecda083c01a51919798e489374bb9533ef7"
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
