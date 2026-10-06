#!/bin/sh
# Пакет плагина ChatGPT (#26951): ZIP по формату Agent Plugins 1.0 из chatgpt/ и общих assets/.
# Отдельно от плагина Cursor: в ChatGPT подключается один сервер - OAuth-хост, без PAT-хоста с токеном.
set -e
ROOT="$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)"
VERSION="$(python3 -c "import json;print(json.load(open('$ROOT/chatgpt/plugin.json'))['version'])")"
STAGE="$(mktemp -d)"
trap 'rm -rf "$STAGE"' EXIT
cp "$ROOT/chatgpt/plugin.json" "$ROOT/chatgpt/mcp.json" "$STAGE/"
mkdir "$STAGE/assets" && cp "$ROOT/assets/logo.png" "$STAGE/assets/"
mkdir -p "$ROOT/dist"
OUT="$ROOT/dist/kosmodrom-chatgpt-$VERSION.zip"
rm -f "$OUT"
python3 -c "import shutil,sys;shutil.make_archive(sys.argv[1][:-4],'zip',sys.argv[2])" "$OUT" "$STAGE"
echo "$OUT"
