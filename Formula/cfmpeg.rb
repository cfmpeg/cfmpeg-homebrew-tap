class Cfmpeg < Formula
  desc "Cloud ffmpeg CLI that runs ffmpeg jobs on remote containers"
  homepage "https://github.com/cfmpeg/cfmpeg-cli"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.2/cfmpeg-darwin-arm64.tar.gz"
      sha256 "42dfcfaed7a7dc3a143a1a024fa300b9768dd4a62c9eeb427d93f957d0785af5"
    else
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.2/cfmpeg-darwin-x64.tar.gz"
      sha256 "ee055fb882524420be565ea4bb22457496f716ead0f24ceb03e71654da1d56ac"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.2/cfmpeg-linux-arm64.tar.gz"
      sha256 "b74f2fd81ca92afa5c96e2a7c427e8b7f50b008bdcd5d685a8f0673c02a01750"
    else
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.2/cfmpeg-linux-x64.tar.gz"
      sha256 "012f42611947d56c951128bf9bdf811593a225b501a0e3ecfa7c00506a1dea74"
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
