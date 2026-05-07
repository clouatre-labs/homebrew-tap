class AptuCoder < Formula
  desc "MCP server for code structure analysis using tree-sitter"
  homepage "https://github.com/clouatre-labs/aptu-coder"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.1/aptu-coder-0.10.1-aarch64-apple-darwin.tar.gz"
    sha256 "38e03fa084b23ff09a4768886c648a09f553c8688326dff885d4ae88cb39105f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.1/aptu-coder-0.10.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "8b0d10281a698437c48cca10aa58cf8a29b3a4d2d78d0749fe409f1eb3bac7f1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu-coder/releases/download/v0.10.1/aptu-coder-0.10.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d9461f2b8838eb1b00c85e61ff2bfc993f1d8779f2001444da7ef8e26e7c14e5"
  end

  def install
    bin.install "aptu-coder"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu-coder --version")
  end
end
