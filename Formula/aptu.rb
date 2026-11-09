class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.14.3/aptu-cli-0.14.3-aarch64-apple-darwin.tar.gz"
    sha256 "f50cc6cb9d73138365895a743f06a1d93dc5ff5a31d1b65b2db63a673bf89e1d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.14.3/aptu-cli-0.14.3-aarch64-unknown-linux-musl.tar.gz"
    sha256 "65c0dc428fd2371f416a371073675ff4ccccf76a39ba51cbd98b302076f574af"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.14.3/aptu-cli-0.14.3-x86_64-unknown-linux-musl.tar.gz"
    sha256 "06dafa77366f9d3b6d50363f2bcacca45dfc42f0874305271f05767e701cf6b5"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
