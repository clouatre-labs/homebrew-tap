class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.15/aptu-0.2.15-aarch64-apple-darwin.tar.gz"
    sha256 "48e44a0af04c6b28a9295e2cc55783f85a59b03bf57c0a72942d865c6a838625"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.15/aptu-0.2.15-aarch64-unknown-linux-musl.tar.gz"
    sha256 "e4e77e686a785dc6fd4643f7ffa4442dcda71fdd240e8bb446c673551031b3a1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.15/aptu-0.2.15-x86_64-unknown-linux-musl.tar.gz"
    sha256 "fdd4d9b48f5e9129fa653e931b8650b7a6fbf16f6e4ea6a3a8301da739580d05"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
