class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.4/aptu-cli-0.10.4-aarch64-apple-darwin.tar.gz"
    sha256 "7f1820c2c78132a8d6014f37a689fdb2ee1a495f638d07f206200f4fc9afd280"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.4/aptu-cli-0.10.4-aarch64-unknown-linux-musl.tar.gz"
    sha256 "d0c47a1856d4e2c4709f71b49c38e7cd9e7bb1de4e334605b9eb076128d36207"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.4/aptu-cli-0.10.4-x86_64-unknown-linux-musl.tar.gz"
    sha256 "c433fdbdc12074f0c5569e4e6584602dbc1c61db9eaa6ed14ee4a8a63f4a0d25"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
