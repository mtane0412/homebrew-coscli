# coscli の Homebrew フォーミュラ。
# 新バージョンのリリース時は url と sha256 を手動で更新する。
class Coscli < Formula
  desc "AI エージェント親和的 Cosense (Scrapbox) CLI"
  homepage "https://github.com/mtane0412/coscli"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-darwin-arm64"
      sha256 "94b549b5335f39bc6e215c5d0c244f69db72b99d9942fa02b8ca1a790c699e73"
    else
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-darwin-x64"
      sha256 "4f12fe2d5295e5f54a3616c28b1a15df9c230a999c923f1945bc7cc65a391992"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-linux-arm64"
      sha256 "901e1e84d13365059803c654975608e6003d09d883f10c6a39ca66baf16c6c4d"
    else
      url "https://github.com/mtane0412/coscli/releases/download/v#{version}/cos-linux-x64"
      sha256 "48727bffeca409b139f9fff8a38a9fa55dde613c4d91b05070971bad611cf754"
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
