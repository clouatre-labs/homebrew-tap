class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.1/aptu-cli-0.4.1-aarch64-apple-darwin.tar.gz"
    sha256 "0c5be07b9bfcd5f39e92ca747564a9bc093ca64d4d9fb6a359171e3acb77bd9c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.1/aptu-cli-0.4.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "d958966a3436326dfeba63893028f3c788c5caeda5c760d81d947ecefccf809b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.1/aptu-cli-0.4.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "e169c30af548faa9e6225b407f8183a584ce09fc1aa66038c9b4d5a8032fa0a0"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
