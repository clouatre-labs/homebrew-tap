class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.3/aptu-coder-0.13.3-aarch64-apple-darwin.tar.gz"
    sha256 "553c65653d71e5efa75ec67e74a408c0b64201ea35b58f18d46d5abec1895b93"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.3/aptu-coder-0.13.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "ff09405c49119599812550b8f1e8906ad6576529ab17a78b6b2ff770f037717d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.3/aptu-coder-0.13.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "8c7c71550bfc7991dcd5584c46e2b23a33adb4575322f2e0adf2fe47fec1fe0d"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
