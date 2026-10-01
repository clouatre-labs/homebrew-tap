class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"
  
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.6/aptu-cli-0.12.6-aarch64-apple-darwin.tar.gz"
    sha256 "a278a498a93db3183432607fc091b2b74f43024cea68ba1deaaf303fa9c54fd9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.6/aptu-cli-0.12.6-aarch64-unknown-linux-musl.tar.gz"
    sha256 "cd3c0f7cdc0aa54bd5c3a300183a9c6fbc2045cdbe83323283e05fa78b399474"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/clouatre-labs/aptu/releases/download/v0.12.6/aptu-cli-0.12.6-x86_64-unknown-linux-musl.tar.gz"
    sha256 "db16af0cc705de670009b41e9f5a628f051299843ae1a98ac21997941a6ad191"
  end
  
  def install
    bin.install "aptu"
  end
  
  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
