class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.2/aptu-cli-0.3.2-aarch64-apple-darwin.tar.gz"
    sha256 "e725ed4fe6e67b5dfc3a92be4c93d57ac1a58537da63d2d85f365e9650d7bd5d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.2/aptu-cli-0.3.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "5acf0b345b499916bc4667c303d3bede9284afee0d51979b9f1acf002d06cba9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.3.2/aptu-cli-0.3.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "dd456963f5cb35a0aa3ddaa0a1e9131932da2e67efe77301c91125c1675d8f97"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
