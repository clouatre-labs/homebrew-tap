class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.21/aptu-cli-0.10.21-aarch64-apple-darwin.tar.gz"
    sha256 "e8c60ba190e7e29c752b1191a6570550af16c3693ab3222bea7eee3e3c343059"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.21/aptu-cli-0.10.21-aarch64-unknown-linux-musl.tar.gz"
    sha256 "34e6f05cec2301fc714072428632428b3eb44220a9201a5c9c225ec83ad4b9d5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.21/aptu-cli-0.10.21-x86_64-unknown-linux-musl.tar.gz"
    sha256 "e19903769bd29e826984b88840244f7e1a2f5b9611fe6ab1953bb0fcc87b8378"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
