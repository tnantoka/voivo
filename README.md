# Voivo

[![Codemagic build status](https://api.codemagic.io/apps/6113b5ffd45f1e979c873c63/6113b5ffd45f1e979c873c62/status_badge.svg)](https://codemagic.io/apps/6113b5ffd45f1e979c873c63/6113b5ffd45f1e979c873c62/latest_build) [![codecov](https://codecov.io/gh/tnantoka/voivo/branch/main/graph/badge.svg?token=LQ4DLK2972)](https://codecov.io/gh/tnantoka/voivo)

非公式 [VOICEVOX](https://github.com/Hiroshiba/voicevox) クライアントアプリ（Flutter製）

![](/docs/voivo.gif)

## 必要な環境

- Flutter 2以降
- VOICEVOX 0.2.0以降

## 使い方

### 1. エンジンの準備（Windows）

```
$ .\path\to\VOICEVOX\run.exe --host 0.0.0.0
```

### 2. アプリの起動（Flutter）

```
$ git clone git@github.com:tnantoka/voivo.git
$ cd voivo

$ echo "API_BASE_PATH=http://エンジンを実行したWindows機のIPアドレス:50021" > .env

$ flutter pub get
$ flutter run
```

## ライセンス

LGPLv3

## 作った人

[@tnantoka](https://twitter.com/tnantoka)

