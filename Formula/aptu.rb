class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.7/aptu-cli-0.10.7-aarch64-apple-darwin.tar.gz"
    sha256 "3b4d37765b241fcb10537787a28f626a189d2b51cc33d54d97b55d6913bccb21"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.7/aptu-cli-0.10.7-aarch64-unknown-linux-musl.tar.gz"
    sha256 "0398a6460168794de399c41b79fb933d28a8f8b35bb7115fdf4eb74a6ad3c216"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.7/aptu-cli-0.10.7-x86_64-unknown-linux-musl.tar.gz"
    sha256 "6f0457cd08e0f0594d3a79bb0ff332aa2fcaf0c7db1cb1d0495618f5de4a3be6"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
