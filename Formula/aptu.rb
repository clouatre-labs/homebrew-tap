class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.20/aptu-cli-0.2.20-aarch64-apple-darwin.tar.gz"
    sha256 "bea5ec1eed38b060aa6f9da2a056653fd052d18f5e9e3e1a9c8c0bc12adaece4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.20/aptu-cli-0.2.20-aarch64-unknown-linux-musl.tar.gz"
    sha256 "af512efdae7531c728cd95438a36ec6e34db4db490a11370952ad4c591b1b798"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.20/aptu-cli-0.2.20-x86_64-unknown-linux-musl.tar.gz"
    sha256 "bf79721b990a97775320d740e005f21b89c19eaec902a5793637a829d38c7700"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
