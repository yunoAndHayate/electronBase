# Electron アプリケーション開発環境

このプロジェクトは、Electron を使用してデスクトップアプリケーションを開発するための基本的な環境を提供します。Docker を利用して、開発環境の構築と管理を容易にしています。

## 前提条件

- Docker
- Docker Compose

## セットアップ

1. リポジトリをクローンします：
   ```
   git clone https://github.com/yourusername/your-electron-app.git
   cd your-electron-app
   ```

2. Docker コンテナをビルドします：
   ```
   docker-compose build
   ```

## 開発

このプロジェクトは以下の特徴を持っています：

- Node.js v20 を使用
- Electron と electron-builder がグローバルにインストール済み
- Windows 向けビルドのための wine64 と mono-complete が利用可能

### プロジェクト構造

- `app/`: Electron アプリケーションのソースコード
- `Dockerfile`: 開発環境の Docker イメージ定義
- `docker-compose.yml`: Docker サービスの設定

### ボリューム

Docker Compose は以下のボリュームをマウントします：

- `./app:/app`: ローカルの `app` ディレクトリをコンテナの `/app` にマウント
- `/app/node_modules`: node_modules を分離して管理
- `./logs:/root/.npm/_logs`: npm ログをホストマシンに保存

## ビルド

コンテナを起動すると、アプリケーションがビルドされます。

    ```
    docker-compose up -d
    ```

