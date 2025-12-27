class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.8/aptu-0.2.8-aarch64-apple-darwin.tar.gz"
    sha256 "7aefbb46271639b77e51e502d8354e8c5c01ccdf3db02070dde97dde45c11a4f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.8/aptu-0.2.8-aarch64-unknown-linux-musl.tar.gz"
    sha256 "0e578fb1b4085a998a2414c39a908551d9f1c4e5bcc256720fa8e2defa3c05cc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.8/aptu-0.2.8-x86_64-unknown-linux-musl.tar.gz"
    sha256 "848c31515772edd619c9205e09faee5338148890647be601544c8fb45c7da7eb"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
