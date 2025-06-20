#!/bin/bash

# Notify Send Server Service Installation Script

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SERVICE_NAME="notify-send-server"
SERVICE_FILE="$SCRIPT_DIR/${SERVICE_NAME}.service"
USER_SYSTEMD_DIR="$HOME/.config/systemd/user"

echo "🔧 Notify Send Server のサービス化を開始します..."

# ユーザーsystemdディレクトリの作成
echo "📁 ユーザーsystemdディレクトリを作成中..."
mkdir -p "$USER_SYSTEMD_DIR"

# サービスファイルの存在確認
if [ ! -f "$SERVICE_FILE" ]; then
    echo "❌ エラー: サービスファイル '$SERVICE_FILE' が見つかりません"
    exit 1
fi

# サービスファイルのコピー
echo "📋 サービスファイルをコピー中..."
cp "$SERVICE_FILE" "$USER_SYSTEMD_DIR/"

# スクリプトの実行権限確認
SCRIPT_FILE="$SCRIPT_DIR/notify-send-server.sh"
if [ ! -x "$SCRIPT_FILE" ]; then
    echo "🔐 実行権限を設定中..."
    chmod +x "$SCRIPT_FILE"
fi

# systemdデーモンの再読み込み
echo "🔄 systemdデーモンを再読み込み中..."
systemctl --user daemon-reload

# サービスの有効化
echo "⚡ サービスを有効化中..."
systemctl --user enable "${SERVICE_NAME}.service"

# サービスの開始
echo "🚀 サービスを開始中..."
systemctl --user start "${SERVICE_NAME}.service"

# サービス状態の確認
echo "📊 サービス状態を確認中..."
if systemctl --user is-active --quiet "${SERVICE_NAME}.service"; then
    echo "✅ サービスが正常に起動しました！"
    echo ""
    echo "📋 サービス状態:"
    systemctl --user status "${SERVICE_NAME}.service" --no-pager -l
    echo ""
    echo "🎯 使用方法:"
    echo "  通知送信: echo 'テストメッセージ' | nc localhost 45678"
    echo "  サービス停止: systemctl --user stop ${SERVICE_NAME}.service"
    echo "  サービス再起動: systemctl --user restart ${SERVICE_NAME}.service"
    echo "  ログ確認: journalctl --user -u ${SERVICE_NAME}.service -f"
else
    echo "❌ サービスの起動に失敗しました"
    echo "詳細なログ:"
    journalctl --user -u "${SERVICE_NAME}.service" --no-pager -l
    exit 1
fi