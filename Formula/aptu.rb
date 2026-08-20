class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.12/aptu-cli-0.10.12-aarch64-apple-darwin.tar.gz"
    sha256 "c4bcff49d1a66324cb2a4f50125fbe7b66a3365276248f65b5485501b4cc0b1c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.12/aptu-cli-0.10.12-aarch64-unknown-linux-musl.tar.gz"
    sha256 "a323c2989b6d9b66c7e1f3968606c45c8c851375c647cfd703da88acc596f46f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.12/aptu-cli-0.10.12-x86_64-unknown-linux-musl.tar.gz"
    sha256 "5173593b94a58afe186f26c6dfdb25cc7eb4d36629117f39e57dbb1cf3d5d5a4"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
