# 🚀 一键获取APK - 超简单！

## 这个方法有多简单？

只需 **5个步骤**，约 **5分钟**，您就能得到APK！完全不需要安装任何东西！

---

## 第一步：注册 GitHub 账号（如果还没有）

1. 访问 https://github.com
2. 点击右上角 "Sign up" 注册账号
3. 完成注册和邮箱验证

---

## 第二步：创建新仓库

1. 登录 GitHub 后，点击右上角的 **+** 号
2. 选择 **"New repository"**
3. 填写仓库信息：
   - Repository name: `barcode_print_app`（或您喜欢的名字）
   - 选择 **Public**（免费）或 **Private**（也免费）
   - **不要**勾选任何选项（README、.gitignore、License 都不要选）
4. 点击 **"Create repository"**

---

## 第三步：上传代码

1. 创建仓库后，您会看到一个页面，找到 **"…or create a new repository on the command line"** 这部分

2. 在您的电脑上，打开项目文件夹：
   ```
   c:\Users\tobye\Documents\trae_projects\bartenderERP
   ```

3. 在文件夹空白处，按住 **Shift** 键，同时右键点击
4. 选择 **"在此处打开PowerShell窗口"** 或 **"在终端中打开"**

5. 复制粘贴以下命令，一行一行执行（注意：把下面的 `您的用户名` 换成您的GitHub用户名）：

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/您的用户名/barcode_print_app.git
git push -u origin main
```

**注意**：执行 `git push` 时，可能需要您输入GitHub账号密码或使用Personal Access Token。

---

## 第四步：等待自动构建（最重要！）

1. 上传完成后，回到您的GitHub仓库页面
2. 点击上方的 **"Actions"** 标签
3. 您会看到一个名为 **"Build APK"** 的工作流正在运行
4. 等待约 **2-3分钟**，直到它变成 **绿色 ✓**

---

## 第五步：下载 APK！

1. 构建完成后，点击那个绿色的构建记录
2. 滚动到页面底部，找到 **"Artifacts"** 区域
3. 您会看到两个文件：
   - **app-debug**（测试用，推荐先用这个）
   - **app-release**（正式版）
4. 点击它们下载！

---

## 就这么简单！🎉

下载到APK后：
1. 把APK文件传到手机
2. 在手机文件管理器中点击安装
3. 开始使用！

---

## 常见问题

**Q: 上传代码时提示需要输入密码？**
A: GitHub现在需要用Personal Access Token。您可以去GitHub设置里生成一个。

**Q: Actions里没有看到构建任务？**
A: 确保您上传的代码里包含 `.github/workflows/build-apk.yml` 这个文件。

**Q: 构建失败了怎么办？**
A: 点击失败的构建记录，查看日志，把错误信息告诉我，我帮您解决！

---

## 更简单的方法：使用 GitHub Desktop

如果命令行太复杂，可以下载 GitHub Desktop：
https://desktop.github.com

1. 安装后登录
2. 点击 "File" → "Add Local Repository"
3. 选择我们的项目文件夹
4. 点击 "Publish repository"
5. 完成！

---

**祝您顺利拿到APK！有问题随时找我！** 😊
