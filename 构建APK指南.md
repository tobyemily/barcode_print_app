# 扫码打印应用 - APK构建指南

## 📱 最简单的方式：使用在线构建服务

### 推荐：Codemagic（免费）

1. 访问 https://codemagic.io
2. 使用 GitHub 账号登录
3. 将您的项目推送到 GitHub
4. 在 Codemagic 中导入项目
5. 选择 Flutter 项目类型
6. 点击 "Start new build"
7. 等待构建完成，下载 APK 文件

---

## 💻 本地构建完整步骤

### 第一步：安装 Flutter SDK

#### 1.1 下载 Flutter
访问：https://flutter.dev/docs/get-started/install/windows
下载：Flutter SDK for Windows (zip)

#### 1.2 解压 Flutter
- 解压到：`C:\src\flutter`
- 确保路径为：`C:\src\flutter\bin`

#### 1.3 配置环境变量
1. 按 `Win + X`，选择"系统"
2. 点击"高级系统设置"
3. 点击"环境变量"
4. 在"系统变量"中找到 `Path`，点击"编辑"
5. 点击"新建"，添加：`C:\src\flutter\bin`
6. 点击"确定"保存所有窗口
7. **重要**：关闭所有终端，重新打开新的终端

#### 1.4 验证安装
打开新的终端，运行：
```bash
flutter --version
```

### 第二步：安装 Android Studio

#### 2.1 下载 Android Studio
访问：https://developer.android.com/studio
下载并安装 Android Studio

#### 2.2 安装 Android SDK
1. 打开 Android Studio
2. 首次启动会提示安装 SDK，按提示完成
3. 安装 Android SDK Platform-Tools
4. 安装 Android SDK Build-Tools (34.0.0 或更高)

#### 2.3 接受 Android 许可证
打开终端，运行：
```bash
flutter doctor --android-licenses
```
一路按 `y` 接受所有许可证

### 第三步：安装项目依赖

打开终端，进入项目目录：
```bash
cd c:\Users\tobye\Documents\trae_projects\bartenderERP\barcode_print_app
```

安装依赖：
```bash
flutter pub get
```

### 第四步：构建 APK

#### 构建 Debug 版本（测试用）
```bash
flutter build apk --debug
```

#### 构建 Release 版本（正式发布用）
```bash
flutter build apk --release
```

### 第五步：获取 APK 文件

构建成功后，APK 文件位于：

**Debug 版本：**
```
c:\Users\tobye\Documents\trae_projects\bartenderERP\barcode_print_app\build\app\outputs\flutter-apk\app-debug.apk
```

**Release 版本：**
```
c:\Users\tobye\Documents\trae_projects\bartenderERP\barcode_print_app\build\app\outputs\flutter-apk\app-release.apk
```

## 📲 安装 APK 到手机

### 方法一：通过 USB 连接
1. 在手机上开启"开发者选项"和"USB 调试"
2. 用 USB 线连接手机和电脑
3. 手机上允许 USB 调试
4. 运行：
   ```bash
   flutter install
   ```

### 方法二：直接传输 APK
1. 将 APK 文件复制到手机
2. 在手机文件管理器中找到 APK
3. 点击安装
4. 如果提示"允许安装未知来源应用"，点击允许

## 🔍 检查环境

运行以下命令检查所有依赖是否正常：
```bash
flutter doctor
```

确保所有项目都显示为 ✅

## ⚡ 快速命令参考

```bash
# 进入项目目录
cd c:\Users\tobye\Documents\trae_projects\bartenderERP\barcode_print_app

# 安装依赖
flutter pub get

# 构建 Debug APK
flutter build apk --debug

# 构建 Release APK
flutter build apk --release

# 直接安装到连接的设备
flutter install

# 运行应用（需要设备连接）
flutter run
```

## 📋 常见问题

**Q: 构建时提示找不到 Android SDK？**
A: 运行 `flutter doctor` 查看详细信息，确保 Android Studio 已正确安装 SDK

**Q: Release APK 安装失败？**
A: 需要先卸载 Debug 版本，再安装 Release 版本

**Q: 应用无法访问网络？**
A: 确保手机和服务器在同一局域网，检查服务器地址配置

---

**祝构建顺利！如有问题，请查看 `flutter doctor` 的输出。**
