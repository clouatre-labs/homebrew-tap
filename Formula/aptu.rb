class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  version "0.1.4"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.4/aptu-aarch64-apple-darwin.tar.gz"
    sha256 "b4a8e10b251ff8c4898e87344c5d6d6439e7391ad0656ae120588c64bf1a0c1f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.4/aptu-aarch64-unknown-linux-musl.tar.gz"
    sha256 "e6fb7db10e29edd959eadfdac57340a30d69d1ab3a24bf5a3f7a341f3777ec2a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.4/aptu-x86_64-unknown-linux-musl.tar.gz"
    sha256 "97f2680d3e8737d4ba400d1996d48ef6a6d003e9055652c7ecd6f4149fb5a5b1"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
