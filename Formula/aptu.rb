class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.19/aptu-cli-0.2.19-aarch64-apple-darwin.tar.gz"
    sha256 "36fae0607a8b15b487d34b71753ba19256f7dc5efb967cbe47b3df59215628e8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.19/aptu-cli-0.2.19-aarch64-unknown-linux-musl.tar.gz"
    sha256 "7a1aef0ac970f59e17f6b1358f9457c4a43075647708242d8bb001de89c327e5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.19/aptu-cli-0.2.19-x86_64-unknown-linux-musl.tar.gz"
    sha256 "6bd382de78caf813b6d999e1b53d1fd5d83dba96deacd29286569bf3eafca3aa"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
