# Node.jsの公式イメージをベースにする
FROM node:20

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    wine64 \
    mono-complete \
    && rm -rf /var/lib/apt/lists/*

# 作業ディレクトリを設定
WORKDIR /app

# package.jsonとpackage-lock.jsonをコピー
COPY ./app/package*.json ./

RUN npm install -g --save-dev electron electron-builder

# 依存関係をインストール
RUN npm install

# ソースコードをコピー
COPY . .

# ビルドコマンドを実行
CMD ["npm", "run", "build"]