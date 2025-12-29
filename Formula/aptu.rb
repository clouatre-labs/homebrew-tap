class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.11/aptu-0.2.11-aarch64-apple-darwin.tar.gz"
    sha256 "fdc9a707ed43f27452204ed5de5a24527a163c2c0588caf6f0c31e002c43efc1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.11/aptu-0.2.11-aarch64-unknown-linux-musl.tar.gz"
    sha256 "d16a03525175f9fe512415c462eb2c4005dda9871dffc8ca437bd90491feb46b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.11/aptu-0.2.11-x86_64-unknown-linux-musl.tar.gz"
    sha256 "7aa5489277e856109c04c1afd6dce648ac07c8f8604a083bf5b415ad6c0ca6b5"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
