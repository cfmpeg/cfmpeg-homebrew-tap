class Cfmpeg < Formula
  desc "Cloud ffmpeg CLI that runs ffmpeg jobs on remote containers"
  homepage "https://github.com/cfmpeg/cfmpeg-cli"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.5/cfmpeg-darwin-arm64.tar.gz"
      sha256 "399ccaaa46adf8e7a7e9e0e36060c6c3f99e2dda565be5f28d847bf5f27bcad9"
    else
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.5/cfmpeg-darwin-x64.tar.gz"
      sha256 "d0ef57b16929499c175db1f23a830acaeeabe76c27f6b2bfd2368aa442aaae35"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.5/cfmpeg-linux-arm64.tar.gz"
      sha256 "1bd7ea658875f309b7e3dd4b2dd3fd0fd936689c42e5bf7b7a80eb05f0afac5f"
    else
      url "https://github.com/cfmpeg/cfmpeg-cli/releases/download/v0.1.5/cfmpeg-linux-x64.tar.gz"
      sha256 "7697508e995b07fc9a8321129feafb7c369910afb13ee06f468149bfc24059ef"
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
