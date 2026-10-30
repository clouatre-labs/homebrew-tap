class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.14.2/aptu-cli-0.14.2-aarch64-apple-darwin.tar.gz"
    sha256 "85ae753286c0686b492833699b96e7dd69cfbdcd4ad16e38667fc5a85bfcbc1c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.14.2/aptu-cli-0.14.2-aarch64-unknown-linux-musl.tar.gz"
    sha256 "31a028988fd33b2c8e5f11cbe1c0829c754231badabe95abe5ef4df4f93b84c0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.14.2/aptu-cli-0.14.2-x86_64-unknown-linux-musl.tar.gz"
    sha256 "97555e5c4f46beb756d107a834cde9f5e3f20b64bb9ed522aa2c8c4ff88306cc"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
