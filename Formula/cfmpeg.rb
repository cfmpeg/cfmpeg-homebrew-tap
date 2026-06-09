class Cfmpeg < Formula
  desc "Cloud ffmpeg CLI that runs ffmpeg jobs on remote containers"
  homepage "https://github.com/cfmpeg/cfmpeg-cli"
  version "0.1.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.4/cfmpeg-darwin-arm64.tar.gz"
      sha256 "ff8a33291c9332a5d2be6393a2646da6371b7333be5cdbed29e24a6b8fc39e9f"
    else
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.4/cfmpeg-darwin-x64.tar.gz"
      sha256 "9eab46480c4f8608cfb8c5560cc4ad7e013195527e3c387cd2dd0f02f2a2a43d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.4/cfmpeg-linux-arm64.tar.gz"
      sha256 "12af46a5b2c27375d1f072f09a2d2cd51720a42af288d551f5a06661a7a27f12"
    else
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.4/cfmpeg-linux-x64.tar.gz"
      sha256 "0edddca74f82b4ad1c1ba8a12b05ecac31ce61580b81afb1499f1e0e3b8fd6ab"
    end
  end

  def install
    bin.install "bin/cfmpeg"
    libexec.install "libexec/ffmpeg", "libexec/ffprobe"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cfmpeg --version")
    assert_predicate libexec/"ffmpeg", :exist?
    assert_predicate libexec/"ffprobe", :exist?
  end
end
