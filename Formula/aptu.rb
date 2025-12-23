class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  version "0.1.3"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.3/aptu-aarch64-apple-darwin.tar.gz"
    sha256 "86401b8e4161fc716449612bd81289ab9723eb34b3858046a758e66ae67d006e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.3/aptu-aarch64-unknown-linux-musl.tar.gz"
    sha256 "f87afaf3f390aacb621a0a333d3a606495e504d0c3380002ca6841d52826a63e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.3/aptu-x86_64-unknown-linux-musl.tar.gz"
    sha256 "9169e1f6aeb77f0a5c795d3a6205576fa838148db8c11eccbe5b08e5319059c7"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
