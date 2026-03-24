# Flutter SDK 安装脚本
# 以管理员身份运行此脚本

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Flutter SDK 安装向导" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 检查是否以管理员身份运行
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole::Administrator)) {
    Write-Host "请以管理员身份运行此脚本！" -ForegroundColor Red
    Write-Host "右键点击脚本，选择'以管理员身份运行'" -ForegroundColor Yellow
    pause
    exit
}

# 设置安装目录
$installDir = "C:\src\flutter"
$flutterZip = "$env:TEMP\flutter_windows_3.22.0-stable.zip"
$flutterUrl = "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.22.0-stable.zip"

Write-Host "安装目录: $installDir" -ForegroundColor Green
Write-Host ""

# 创建安装目录
if (-not (Test-Path "C:\src")) {
    New-Item -ItemType Directory -Path "C:\src" -Force | Out-Null
}

# 下载Flutter SDK
Write-Host "正在下载 Flutter SDK..." -ForegroundColor Yellow
Write-Host "下载地址: $flutterUrl" -ForegroundColor Gray
Write-Host "这可能需要几分钟，请耐心等待..." -ForegroundColor Gray

try {
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($flutterUrl, $flutterZip)
    Write-Host "下载完成！" -ForegroundColor Green
} catch {
    Write-Host "下载失败，请手动下载：" -ForegroundColor Red
    Write-Host "1. 访问 https://flutter.dev/docs/get-started/install/windows" -ForegroundColor Yellow
    Write-Host "2. 下载 Flutter SDK for Windows" -ForegroundColor Yellow
    Write-Host "3. 解压到 $installDir" -ForegroundColor Yellow
    pause
    exit
}

# 解压Flutter SDK
Write-Host ""
Write-Host "正在解压 Flutter SDK..." -ForegroundColor Yellow

try {
    Expand-Archive -Path $flutterZip -DestinationPath "C:\src" -Force
    Write-Host "解压完成！" -ForegroundColor Green
} catch {
    Write-Host "解压失败！" -ForegroundColor Red
    pause
    exit
}

# 配置环境变量
Write-Host ""
Write-Host "正在配置环境变量..." -ForegroundColor Yellow

$flutterBin = "$installDir\bin"
$currentPath = [Environment]::GetEnvironmentVariable("Path", "Machine")

if ($currentPath -notlike "*$flutterBin*") {
    [Environment]::SetEnvironmentVariable("Path", "$currentPath;$flutterBin", "Machine")
    Write-Host "环境变量已配置！" -ForegroundColor Green
} else {
    Write-Host "环境变量已存在，跳过配置" -ForegroundColor Yellow
}

# 清理临时文件
Write-Host ""
Write-Host "正在清理临时文件..." -ForegroundColor Gray
Remove-Item $flutterZip -Force -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Flutter SDK 安装成功！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "请关闭当前终端，重新打开新的终端" -ForegroundColor Yellow
Write-Host "然后运行: flutter --version" -ForegroundColor Yellow
Write-Host "接着运行: flutter doctor" -ForegroundColor Yellow
Write-Host ""
Write-Host "如需安装Android Studio，请访问：" -ForegroundColor Cyan
Write-Host "https://developer.android.com/studio" -ForegroundColor Cyan
Write-Host ""
pause
