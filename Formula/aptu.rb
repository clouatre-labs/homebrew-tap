class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.6.0/aptu-cli-0.6.0-aarch64-apple-darwin.tar.gz"
    sha256 "e47123b509599d2e811d47d22f928deccfdd02b8e19db4d42ab5b6a61221da9d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.6.0/aptu-cli-0.6.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "bd951377c19aeafddf31d828e2450ebd82a1167529d7da7c17695fa17c303389"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.6.0/aptu-cli-0.6.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "c695aeac0252d3d91fe2bb20bc0a19ae8bfa48fcd88427c5edd57b1b25626846"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
