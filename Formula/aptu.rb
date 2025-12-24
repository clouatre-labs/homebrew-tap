class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  version "0.2.0"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.0/aptu-aarch64-apple-darwin.tar.gz"
    sha256 "11f804e706a645cd6d6d4dd196e2508292b26b33ce864f6f7f8a5269a2774f38"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.0/aptu-aarch64-unknown-linux-musl.tar.gz"
    sha256 "63186ff2d327fc0c11cc918aaccc1ba827c421d3ef286b6b4bb7e899221b8de4"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.0/aptu-x86_64-unknown-linux-musl.tar.gz"
    sha256 "d0da907fca36bc231f40d7151d85039fb6fc8d967581d93c9d65264989feb022"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
