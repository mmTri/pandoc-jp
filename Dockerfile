# ベースイメージ
FROM ubuntu:latest

# メタデータ
LABEL maintainer="makoto@misumi.org"
LABEL description="日本語対応のpandoc dockerimage"

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    texlive-lang-japanese \
    texlive-latex-extra \
    texlive-latex-recommended \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-luatex \
    pandoc \
    xz-utils \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN kanji-config-updmap-sys --jis2004 haranoaji && \
    # Re-index LuaTeX font database
    luaotfload-tool -u -f

# /var/lib/texmf/luatex-cacheにltcacheボリュームをマウントする
VOLUME ["/var/lib/texmf/luatex-cache"]

# 作業ディレクトリを設定
WORKDIR /data

# エントリーポイント
ENTRYPOINT ["pandoc"]
#ENTRYPOINT [ "bash" ]