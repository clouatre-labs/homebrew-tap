class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.7.0/aptu-coder-0.7.0-aarch64-apple-darwin.tar.gz"
    sha256 "ff47d404774651c1196711866fa1c1c3a3a1c4961b20bc511465a2371ba5dcfc"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.7.0/aptu-coder-0.7.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "ed097bb8db2b957bfd0f206e129856034b2f05070e14e3f71cf702f8121e1560"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.7.0/aptu-coder-0.7.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "88817644eeb390cc2623006434b50347921535746015920530279c78a62f3011"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
