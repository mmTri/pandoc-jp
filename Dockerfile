# ベースイメージ
FROM ubuntu:latest

# メタデータ
LABEL maintainer="makoto@misumi.org"
LABEL description="日本語対応のPandoc DockerImage"

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
# 作業ディレクトリを設定
WORKDIR /workspace

# エントリーポイントをbashに設定
ENTRYPOINT ["bash"]
