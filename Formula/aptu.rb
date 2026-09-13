class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.19/aptu-cli-0.10.19-aarch64-apple-darwin.tar.gz"
    sha256 "8837f73534d1336842a346926a20e040802d7591ddea89838e61e0dcede0e2db"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.19/aptu-cli-0.10.19-aarch64-unknown-linux-musl.tar.gz"
    sha256 "b33ecd89ba9ea450a7331d145ead55779781ac4c3bd5ea8a0ba8952b213577f8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.19/aptu-cli-0.10.19-x86_64-unknown-linux-musl.tar.gz"
    sha256 "3fb59a6e3fc63371233c13416b372edc66427bb13ce8867482948993fd89344a"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
