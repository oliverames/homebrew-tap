class FramesCli < Formula
  include Language::Python::Shebang

  desc "Frame screenshots and screen recordings with official Apple device bezels"
  homepage "https://github.com/viticci/frames-cli"
  url "https://github.com/viticci/frames-cli/archive/refs/tags/1.6.1.tar.gz"
  sha256 "84a893e07af93455a34a6c12496f26ab26c7f225026ff4089197d341c5b321b1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "pillow"
  depends_on "python@3.15"

  def install
    rewrite_shebang detected_python_shebang, "frames"
    bin.install "frames"
    pkgshare.install "skill"
  end

  def caveats
    <<~EOS
      Video framing needs ffmpeg and ffprobe 5.1 or newer. Install either the
      ffmpeg or ffmpeg-full formula; frames checks for them when you run a
      video command. Apple Frames 4 assets are downloaded on first use.

      A Claude Code skill for this tool is installed at:
        #{opt_pkgshare}/skill/SKILL.md
    EOS
  end

  test do
    assert_match "frames v#{version}", shell_output("#{bin}/frames --version")
    system formula_opt_bin("python@3.15")/"python3.15", "-c", "import PIL"
  end
end
