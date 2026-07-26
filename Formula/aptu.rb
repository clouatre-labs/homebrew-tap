class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.5/aptu-cli-0.10.5-aarch64-apple-darwin.tar.gz"
    sha256 "76f9551bd8e4df7886c0dce886da3a9d2e558d194b10a180ef2fb37174b8edaa"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.5/aptu-cli-0.10.5-aarch64-unknown-linux-musl.tar.gz"
    sha256 "94074b896c29ecf2c6b0938f4660fe6ef9d83c8bc46d7ff09abffb6a1bd2fc78"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.5/aptu-cli-0.10.5-x86_64-unknown-linux-musl.tar.gz"
    sha256 "de3e4599f5af34ebddf667107c74aeb976ae9c443a6ba2cda3f099ea62cb2904"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
