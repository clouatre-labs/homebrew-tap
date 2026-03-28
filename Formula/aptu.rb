class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.18/aptu-cli-0.2.18-aarch64-apple-darwin.tar.gz"
    sha256 "6c2d1dbc3e079bc783bfbb324a7c7988cf2d1e7f5ddad15b19f06bfb8ac17165"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.18/aptu-cli-0.2.18-aarch64-unknown-linux-musl.tar.gz"
    sha256 "0f66364c526d107797c67d34956bfdc87fa7bc2eff290df03764a68a798bdeb2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.18/aptu-cli-0.2.18-x86_64-unknown-linux-musl.tar.gz"
    sha256 "a66f462128ed9b60c08c59a07552551d21f87f1648befd2c770243da83dba26b"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
