class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  version "0.2.2"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.2/aptu-aarch64-apple-darwin.tar.gz"
    sha256 "ec26df8bf1eda796f30852443dae1d9a98c28c1f15e589fa40daa4ff7646014d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.2/aptu-aarch64-unknown-linux-musl.tar.gz"
    sha256 "9905771918e5cc106022e93ee7e7d65917e97ba6e60d07eef27dfedac89c3a58"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.2/aptu-x86_64-unknown-linux-musl.tar.gz"
    sha256 "c517c1b34a782298794b7bad6047518a40628cc1d8dd41f801c7c88737827fff"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
