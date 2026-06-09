class Cfmpeg < Formula
  desc "Cloud ffmpeg CLI that runs ffmpeg jobs on remote containers"
  homepage "https://github.com/cfmpeg/cfmpeg-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.0/cfmpeg-darwin-arm64.tar.gz"
      sha256 "6bdfd8d7b7341435a4c8e5229608ece88983d7555013b4be09533584b65aef3e"
    else
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.0/cfmpeg-darwin-x64.tar.gz"
      sha256 "dfea3c3940b5d07d9161135efeddb08797f9ba10bd7edb571bcd3d2ded3e50ef"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.0/cfmpeg-linux-arm64.tar.gz"
      sha256 "d86bbf7d1ccb0d9cb92cf329a25d6e1ec4ef7549b0ae4f0d32baeda3b574290f"
    else
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.0/cfmpeg-linux-x64.tar.gz"
      sha256 "052e0e238a16e5b14292693571b29a350712d425203d55a0916db2e776737d35"
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
