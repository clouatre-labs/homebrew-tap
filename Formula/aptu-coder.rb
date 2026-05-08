class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.2/aptu-coder-0.10.2-aarch64-apple-darwin.tar.gz"
    sha256 "e1eda05e5c2d6c13692f1ae564e24b936e0c5af127642648e6ae07499e0ebc24"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.2/aptu-coder-0.10.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "ebaeac2d95922efab2449d8d894946416c10c64de9a5615109376ed21b625cd3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.2/aptu-coder-0.10.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "23b769a9fda1d4ab0e2e4bd4a64463beb6e92d1ba2ab69dcdbac0464e886b31e"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
