class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.7/aptu-cli-0.8.7-aarch64-apple-darwin.tar.gz"
    sha256 "d12ceb0b82816d699f7acb66c82c9536f50b0d0fc0bf33ab6e30cb7a3c3a380c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.7/aptu-cli-0.8.7-aarch64-unknown-linux-musl.tar.gz"
    sha256 "89435d7c5ed06c24eb5e7acb3227a6077fe8d5094832f81a59b291806be5122b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.8.7/aptu-cli-0.8.7-x86_64-unknown-linux-musl.tar.gz"
    sha256 "845c08c8b2d23ffcd0b04785342ccfb1aefae9544017e37c40070bbef8922ad6"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
