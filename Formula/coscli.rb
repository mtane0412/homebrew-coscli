# coscli の Homebrew フォーミュラ。
# 新バージョンのリリース時は url と sha256 を手動で更新する。
class Coscli < Formula
  desc "AI エージェント親和的 Cosense (Scrapbox) CLI"
  homepage "https://github.com/mtane0412/coscli"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-darwin-arm64"
      sha256 "09b233bf3a3bb3e74acf98fa090e02e607a5f520cc690d7981b13395610f05d7"
    else
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-darwin-x64"
      sha256 "66fc575a1c3a30cb40c215018ec88c3b50a11a879de1074b1fdb7e7cb1aca5a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-linux-arm64"
      sha256 "9ff6d7cbd9c51900c269d02b47057a37521540c757b009c5516c8b4c453acefd"
    else
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-linux-x64"
      sha256 "8b1faa7509bb6e475e861ca6952ef5fdebc93f2581ad935ab3346a2caeba348c"
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
