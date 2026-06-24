@echo off
chcp 65001 >nul
REM ============================================================
REM  ai-imf-website — Git/GitHub セットアップスクリプト
REM ============================================================
REM  使い方:
REM   1) PowerShell / コマンドプロンプトでこのフォルダに cd
REM   2) setup-repo.bat をダブルクリック または `setup-repo.bat` 実行
REM ============================================================

cd /d "%~dp0"

echo.
echo [1/6] 既存の不完全な .git があれば削除します...
if exist .git (
    rmdir /s /q .git
    echo     .git を削除しました
)

echo.
echo [2/6] git init (default branch: main)
git init -b main

echo.
echo [3/6] author を設定
git config user.name "Katsunari Murase"
git config user.email "mura5726@gmail.com"

echo.
echo [4/6] 全ファイルを追加
git add -A

echo.
echo [5/6] 初回コミット
git commit -m "Initial commit: AI Consulting, Inc. static website"

echo.
echo [6/6] GitHub リモートをセットアップ
echo.
echo --- 次のいずれかを実行してください ---
echo.
echo  A) GitHub CLI を使う場合:
echo     gh repo create ai-imf-website --public --source=. --remote=origin --push
echo.
echo  B) すでに GitHub で空リポジトリを作成済みの場合:
echo     git remote add origin git@github.com:mura5726/ai-imf-website.git
echo     git push -u origin main
echo.
echo  完了したら Vercel ダッシュボードからこのリポジトリを Import してデプロイ。
echo.
pause
