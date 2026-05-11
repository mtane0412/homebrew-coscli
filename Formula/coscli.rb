# coscli の Homebrew フォーミュラ。
# 新バージョンのリリース時は url と sha256 を手動で更新する。
class Coscli < Formula
  desc "AI エージェント親和的 Cosense (Scrapbox) CLI"
  homepage "https://github.com/mtane0412/coscli"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-darwin-arm64"
      sha256 "fe85e7dd77dc58499211eb4a29a4c832a3048548889c6c843597c43941702b9e"
    else
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-darwin-x64"
      sha256 "b1e21c1ae067ed742cc7829e5d19a42b0de0540d0cd4870c7f22f9d902cf6665"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-linux-arm64"
      sha256 "fd4ca902c77b2a0a14dd4aa754604b78432e505dfbbefcbdea90acbe1628c9a8"
    else
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-linux-x64"
      sha256 "6a6549f05bdac0fbb75b5ceb64154f1cd705a1216826882968a0774236dd3778"
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
