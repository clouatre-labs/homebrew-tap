class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  version "0.2.1"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.1/aptu-aarch64-apple-darwin.tar.gz"
    sha256 "6c5db9f6721243404e48ad16f732d053ae5a2df0733691abd299fb09f4c269ac"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.1/aptu-aarch64-unknown-linux-musl.tar.gz"
    sha256 "662189bd6258665d04228d4b8f334cafd64c1336a9f316b2a948780ee2930de6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.1/aptu-x86_64-unknown-linux-musl.tar.gz"
    sha256 "cd723a43ac88ffdc2aad8a9297ef731c61c98bda8c0e077165c18e9ec161379b"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
