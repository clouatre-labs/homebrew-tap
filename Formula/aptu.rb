class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.3/aptu-cli-0.12.3-aarch64-apple-darwin.tar.gz"
    sha256 "3ad9a787b81f6c1b35b95faa894755eda3efcbfd2048e82e36a64c66b11decf8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.3/aptu-cli-0.12.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "222768207c7f554177a5befa85e557a6194e3e6d2256a35bb0f92ac724b33ff6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.3/aptu-cli-0.12.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "e0c9a9aac993834fd0094e4300ed653575833188076b1d1c51589a539a30677c"
  end

  def install
    bin.install "aptu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
