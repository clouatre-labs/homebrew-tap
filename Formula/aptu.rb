class Aptu < Formula
  desc "Gamified OSS issue triage with AI assistance"
  homepage "https://github.com/clouatre-labs/aptu"
  license "Apache-2.0"

  on_macos do
    on_arm64 do
      url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.1/aptu-aarch64-apple-darwin.tar.gz"
      sha256 "b47d8f3b616186a3a3bec069955a95ed015c801211db449033bc39ce2b167256"
    end
  end

  on_linux do
    on_arm64 do
      url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.1/aptu-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b47d8f3b616186a3a3bec069955a95ed015c801211db449033bc39ce2b167256"
    end
    on_intel do
      url "https://github.com/clouatre-labs/aptu/releases/download/v0.1.1/aptu-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b47d8f3b616186a3a3bec069955a95ed015c801211db449033bc39ce2b167256"
    end
  end

  def install
    bin.install "aptu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aptu --version")
  end
end
