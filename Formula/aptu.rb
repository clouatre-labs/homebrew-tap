class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.10/aptu-0.2.10-aarch64-apple-darwin.tar.gz"
    sha256 "f32357592b934850754da6ff5b12802817416e2a203dd58b4c772e9ebae65b48"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.10/aptu-0.2.10-aarch64-unknown-linux-musl.tar.gz"
    sha256 "47a9d97c292841f378c53ab1ea9dafb1109a67c3c94b4592030ea4dda3e7878e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.10/aptu-0.2.10-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d2e62c84271c71e7caffc6daa422654d80b34cb918440450e140367dcbb0f4ab"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
