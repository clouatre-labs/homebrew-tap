class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.14.1/aptu-cli-0.14.1-aarch64-apple-darwin.tar.gz"
    sha256 "e997ede9d5c0343d8eb22e464db3b5afb2a2131679af43e0337f31d8d3d3eaa8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.14.1/aptu-cli-0.14.1-aarch64-unknown-linux-musl.tar.gz"
    sha256 "3ece3f3ef6b1b3f92b213eb9ca920be855cc7d70f6e434ce688ef77c8dba3ea8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.14.1/aptu-cli-0.14.1-x86_64-unknown-linux-musl.tar.gz"
    sha256 "0cc53d8dd9218250ef99625bbb84d90e6423d6a870d6f7f07c7d57bf35922bfe"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
