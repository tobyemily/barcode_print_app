# 扫码打印应用 - APK一键构建脚本

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  扫码打印 APK 构建工具" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 设置项目目录
$projectDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$appDir = Join-Path $projectDir "barcode_print_app"

Write-Host "项目目录: $appDir" -ForegroundColor Green
Write-Host ""

# 检查Flutter是否安装
Write-Host "[1/5] 检查 Flutter 环境..." -ForegroundColor Yellow
try {
    $flutterVersion = flutter --version 2>&1
    if ($LASTEXITCODE -ne 0) {
        throw "Flutter not found"
    }
    Write-Host "✓ Flutter 已安装" -ForegroundColor Green
    Write-Host $flutterVersion[0] -ForegroundColor Gray
} catch {
    Write-Host "✗ Flutter 未安装！" -ForegroundColor Red
    Write-Host ""
    Write-Host "请先安装 Flutter SDK：" -ForegroundColor Yellow
    Write-Host "1. 访问 https://flutter.dev/docs/get-started/install/windows" -ForegroundColor Cyan
    Write-Host "2. 下载并安装 Flutter SDK" -ForegroundColor Cyan
    Write-Host "3. 配置环境变量" -ForegroundColor Cyan
    Write-Host "4. 重新运行此脚本" -ForegroundColor Cyan
    Write-Host ""
    pause
    exit 1
}

Write-Host ""

# 检查项目目录
Write-Host "[2/5] 检查项目目录..." -ForegroundColor Yellow
if (-not (Test-Path $appDir)) {
    Write-Host "✗ 项目目录不存在: $appDir" -ForegroundColor Red
    pause
    exit 1
}
Write-Host "✓ 项目目录存在" -ForegroundColor Green

Set-Location $appDir

Write-Host ""

# 安装依赖
Write-Host "[3/5] 安装项目依赖..." -ForegroundColor Yellow
try {
    flutter pub get
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to install dependencies"
    }
    Write-Host "✓ 依赖安装成功" -ForegroundColor Green
} catch {
    Write-Host "✗ 依赖安装失败！" -ForegroundColor Red
    pause
    exit 1
}

Write-Host ""

# 构建APK
Write-Host "[4/5] 构建 APK..." -ForegroundColor Yellow
Write-Host "选择构建类型：" -ForegroundColor Cyan
Write-Host "1. Debug 版本（测试用，体积较大）" -ForegroundColor White
Write-Host "2. Release 版本（正式用，体积较小）" -ForegroundColor White
Write-Host ""

$choice = Read-Host "请输入选项 (1 或 2，默认 2)"
if ([string]::IsNullOrWhiteSpace($choice)) {
    $choice = "2"
}

$buildType = ""
if ($choice -eq "1") {
    $buildType = "debug"
} else {
    $buildType = "release"
}

Write-Host ""
Write-Host "正在构建 $buildType 版本 APK..." -ForegroundColor Yellow

try {
    if ($buildType -eq "debug") {
        flutter build apk --debug
    } else {
        flutter build apk --release
    }
    
    if ($LASTEXITCODE -ne 0) {
        throw "Build failed"
    }
    Write-Host "✓ APK 构建成功！" -ForegroundColor Green
} catch {
    Write-Host "✗ APK 构建失败！" -ForegroundColor Red
    pause
    exit 1
}

Write-Host ""

# 显示APK位置
Write-Host "[5/5] 完成！" -ForegroundColor Yellow
$apkDir = Join-Path $appDir "build\app\outputs\flutter-apk"

if ($buildType -eq "debug") {
    $apkFile = Join-Path $apkDir "app-debug.apk"
} else {
    $apkFile = Join-Path $apkDir "app-release.apk"
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  构建成功！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "APK 文件位置：" -ForegroundColor Yellow
Write-Host $apkFile -ForegroundColor Cyan
Write-Host ""
Write-Host "APK 目录：" -ForegroundColor Yellow
Write-Host $apkDir -ForegroundColor Cyan
Write-Host ""

# 尝试打开APK目录
Write-Host "是否打开 APK 所在文件夹？(Y/N，默认 Y)" -ForegroundColor Cyan
$openFolder = Read-Host
if ([string]::IsNullOrWhiteSpace($openFolder) -or $openFolder -eq "Y" -or $openFolder -eq "y") {
    Invoke-Item $apkDir
}

Write-Host ""
Write-Host "安装到手机的方法：" -ForegroundColor Yellow
Write-Host "1. 将 APK 文件复制到手机" -ForegroundColor White
Write-Host "2. 在手机文件管理器中打开 APK" -ForegroundColor White
Write-Host "3. 点击安装" -ForegroundColor White
Write-Host ""
Write-Host "或者（如果手机已通过USB连接并开启调试）：" -ForegroundColor Yellow
Write-Host "运行: flutter install" -ForegroundColor Cyan
Write-Host ""

pause
