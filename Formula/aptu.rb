class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.2/aptu-cli-0.12.2-aarch64-apple-darwin.tar.gz"
    sha256 "775947804550a06b90e708a79e64a20d264c3f4117c01324b288daf0a2d30400"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.2/aptu-cli-0.12.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "0d3ab5265ff3680ec834262f8ac722efcfefc9c0e67d1139c3a3843ec70d4e0a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.2/aptu-cli-0.12.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "24e189a8d5f993e8c2a744dc62473872ef8e553a7ed1d2f06a0444cbe1447383"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
