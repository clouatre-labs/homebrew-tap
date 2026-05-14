class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.2/aptu-coder-0.13.2-aarch64-apple-darwin.tar.gz"
    sha256 "950cdad24eb7f1884ae06991040e3fbfff3657126debf5aac427d1a4e396fd3d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.2/aptu-coder-0.13.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "82ab8c1a42d4425ab2a5c0b53d88ca0000d48f86df55b6e937778c38a4a12832"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.13.2/aptu-coder-0.13.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "b6e44b6229cdc91ea27365139acedc01a8e51790f66ecf4c48cf559ed48f5f9b"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
