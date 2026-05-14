class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.7.0/aptu-cli-0.7.0-aarch64-apple-darwin.tar.gz"
    sha256 "7316db2cbdb88e6c1ae74d3f39f500b073e656cfe1f2a6953adfe0d6ea04e1df"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.7.0/aptu-cli-0.7.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "42648f8f2c617ae95c4713a95fb19ba49e029c5d0803579b70432718fed67ba1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.7.0/aptu-cli-0.7.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "0676b0be7abd8bba64ce95e24624b403300b964a68593ebd674c8f7e49a27567"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
