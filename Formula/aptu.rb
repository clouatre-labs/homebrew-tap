class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.0/aptu-cli-0.4.0-aarch64-apple-darwin.tar.gz"
    sha256 "b641c4fafb9fb8de0f887db564b4e636f0a28f6cab44acda99b9f2dde731610d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.0/aptu-cli-0.4.0-aarch64-unknown-linux-musl.tar.gz"
    sha256 "54f3076a8e0ccc3e0f57e79ec8de4c2179efc937e401552816e32a078a11dac7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.4.0/aptu-cli-0.4.0-x86_64-unknown-linux-musl.tar.gz"
    sha256 "b4d383bac14c6820a532a3a302dbb2f0239a1b90f9601c49785a69f0a3a2bcac"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
