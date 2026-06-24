# ============================================================
#  ai-imf-website — Git/GitHub セットアップスクリプト (PowerShell)
# ============================================================
$ErrorActionPreference = "Stop"
$repoPath = $PSScriptRoot
Set-Location $repoPath

Write-Host ""
Write-Host "[1/6] 既存の不完全な .git があれば削除..." -ForegroundColor Cyan
if (Test-Path ".git") {
    Remove-Item -Recurse -Force ".git"
    Write-Host "    .git を削除しました" -ForegroundColor Gray
}

Write-Host ""
Write-Host "[2/6] git init (main branch)" -ForegroundColor Cyan
git init -b main

Write-Host ""
Write-Host "[3/6] author を設定" -ForegroundColor Cyan
git config user.name "Katsunari Murase"
git config user.email "mura5726@gmail.com"

Write-Host ""
Write-Host "[4/6] ファイルを追加" -ForegroundColor Cyan
git add -A

Write-Host ""
Write-Host "[5/6] 初回コミット" -ForegroundColor Cyan
git commit -m "Initial commit: AI Consulting, Inc. static website"

Write-Host ""
Write-Host "[6/6] GitHub リモートのセットアップ" -ForegroundColor Cyan
Write-Host ""
Write-Host "次のいずれかを実行してください:" -ForegroundColor Yellow
Write-Host ""
Write-Host "  A) GitHub CLI を使う場合:" -ForegroundColor White
Write-Host "     gh repo create ai-imf-website --public --source=. --remote=origin --push" -ForegroundColor Gray
Write-Host ""
Write-Host "  B) 既に GitHub で空リポジトリ作成済みの場合:" -ForegroundColor White
Write-Host "     git remote add origin git@github.com:mura5726/ai-imf-website.git" -ForegroundColor Gray
Write-Host "     git push -u origin main" -ForegroundColor Gray
Write-Host ""
Write-Host "完了したら Vercel で Import → Deploy" -ForegroundColor Green
Write-Host ""
