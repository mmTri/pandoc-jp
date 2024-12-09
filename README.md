# 日本語対応版pandoc Docker Image

## Docker Imageの作成

### イメージのビルド

```shell
docker build -t pandoc-jp .
```

### コンテナを起動してshellに入る

```shell
docker run -it --rm -v $(pwd):/workspace pandoc-jp
```

## 日本語ファイルのPDF化

実行例
```shell
pandoc <input>.md -o <output>.pdf  --pdf-engine=lualatex -V documentclass=ltjarticle -V geometry:a4paper -V linkcolor=blue
```