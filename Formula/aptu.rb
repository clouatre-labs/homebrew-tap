class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.5/aptu-0.2.5-aarch64-apple-darwin.tar.gz"
    sha256 "2dc26fd3eaac024c0ce8b076ab19731a962b942a3893bc9be40657f9dd489afe"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.5/aptu-0.2.5-aarch64-unknown-linux-musl.tar.gz"
    sha256 "ad450107382ce9007cb02a49c443cae5937f690894fdfc0da38070037e2bcf73"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.5/aptu-0.2.5-x86_64-unknown-linux-musl.tar.gz"
    sha256 "4e1035605ed2c0a062e07519d1432a99e67a18295669b3b1024511263a3ac2dd"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
