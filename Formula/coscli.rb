# coscli の Homebrew フォーミュラ。
# 新バージョンのリリース時は url と sha256 を手動で更新する。
class Coscli < Formula
  desc "AI エージェント親和的 Cosense (Scrapbox) CLI"
  homepage "https://github.com/mtane0412/coscli"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-darwin-arm64"
      sha256 "c4d65e1c99a5acef4076710dc5ea12f10cdd452cbb15e4959f352ebad36377d3"
    else
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-darwin-x64"
      sha256 "ac70318b1aea9fbf626b4d650ce5f6bfb2bd1a86cb5ca40ee12a9f3433ce0213"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-linux-arm64"
      sha256 "0e3b8ea8eef9664652dd72153c88f5eeb5619d3cd2e525f8542371a39af3e68e"
    else
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-linux-x64"
      sha256 "1dfc49a926d76b36712c193661516a6284b3567053931081ed8457e4568a8a4b"
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
