class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.6/aptu-0.2.6-aarch64-apple-darwin.tar.gz"
    sha256 "62c82e829deed6304fe4ce8bffcdfdc08038290f10f7c0f54294be64c724d74d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.6/aptu-0.2.6-aarch64-unknown-linux-musl.tar.gz"
    sha256 "0f2223fd74c2ce74fc9f35209d3321e7e62bd660e8872a4c81a0b0587e11de58"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.2.6/aptu-0.2.6-x86_64-unknown-linux-musl.tar.gz"
    sha256 "a9ef733b0cf3ccc7eefa300ce05c9f47a666b01ab741d5372221f6acab140b00"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
