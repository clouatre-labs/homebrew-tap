class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.14.0/aptu-coder-0.14.0-aarch64-apple-darwin.tar.gz"
    sha256 "cf176f2bdc94ad46dc2c124caa57a9be188fcaaf148a45e5e12403a703a3b563"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.14.0/aptu-coder-0.14.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "da8e3f00bcf50f932ee7940c35e311c93a9082230478b903eaa5f69509549ed9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.14.0/aptu-coder-0.14.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "f471239482f2d22d7c119ad9ddafd5c2dbfd7daad16062e15060a8cdfa75ff62"
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
