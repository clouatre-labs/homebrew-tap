class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.17/aptu-cli-0.10.17-aarch64-apple-darwin.tar.gz"
    sha256 "6f2a50ae6a1e8a777a9e3f49c94ae627c76c6d57cd25793440518f5d860784a9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.17/aptu-cli-0.10.17-aarch64-unknown-linux-musl.tar.gz"
    sha256 "77c43ee739d576056686c54dcd09bafa42c3e2dcb6bc5c30a105dbfd0ce1fb71"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.10.17/aptu-cli-0.10.17-x86_64-unknown-linux-musl.tar.gz"
    sha256 "e9712e858eb1e125a3ebc69303ed79d5273081964a4b8b23b813da48a59122b5"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
