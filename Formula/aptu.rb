class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"

  on_macos do
    on_arm64 do
      url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.1/aptu-aarch64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm64 do
      url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.1/aptu-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.1/aptu-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "aptu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
