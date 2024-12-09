# 日本語対応版pandoc dockerimage

## dockerimageの作成

### イメージのビルド

```shell
docker build --no-cache=true -t pandoc-jp .
```

### コンテナを起動してshellに入る

```shell
docker run -it --rm \
-v $(pwd):/data \
--mount type=volume,src=ltcache,dst=/var/lib/texmf/luatex-cache \
--entrypoint /bin/bash \
pandoc-jp 
```

## 日本語ファイルのPDF化

実行例

```shell
pandoc <input>.md -o <output>.pdf  --pdf-engine=lualatex -V documentclass=ltjarticle -V geometry:a4paper -V linkcolor=blue
```

## VSCodeの設定

次の内容を追加

```json
    "pandoc.docker.options": "--mount type=volume,src=ltcache,dst=/var/lib/texmf/luatex-cache",
    "pandoc.pdfOptString": "--pdf-engine=lualatex -V documentclass=ltjarticle -V geometry:a4paper -V geometry:margin=2.5cm -V geometry:nohead",
    "pandoc.docker.enabled": true,
```
