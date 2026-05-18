# coscli の Homebrew フォーミュラ。
# 新バージョンのリリース時は url と sha256 を手動で更新する。
class Coscli < Formula
  desc "AI エージェント親和的 Cosense (Scrapbox) CLI"
  homepage "https://github.com/mtane0412/coscli"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-darwin-arm64"
      sha256 "a6d20202fbf72ad91ea0c428f21f1ab25e58b13f0478323fab8c160dddbba981"
    else
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-darwin-x64"
      sha256 "340e2cc8412eaec37bb493187476153fb47529c0d28abdfd2d9edfff21fd08ec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-linux-arm64"
      sha256 "50f0537c84ffd452aaf9d2cf78140278a4aa58055311b5d13dfb1829a3ac2298"
    else
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-linux-x64"
      sha256 "4e2ad7652f8712a616ef4ff5969605c18c9e82ff9f449a7c31f24040f25370cc"
    end
  end

  def install
    # ダウンロードしたバイナリを cos という名前で bin/ に配置する
    bin.install Dir["cos-*"].first => "cos"
  end

  test do
    system "#{bin}/cos", "--version"
  end
end
