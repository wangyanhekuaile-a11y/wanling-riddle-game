# GitHub + Vercel 快速部署指南

## 🚀 总览

通过 GitHub + Vercel 的组合,您可以实现:
- ✅ 代码托管在 GitHub
- ✅ 自动部署到 Vercel
- ✅ 全球 CDN 加速
- ✅ 自动 HTTPS 配置
- ✅ 推送代码自动更新网站

---

## 📋 部署步骤 (预计 5-10 分钟)

### 步骤 1:创建 GitHub 仓库

#### 1.1 访问 GitHub 新建页面

打开浏览器访问:
```
https://github.com/new
```

#### 1.2 填写仓库信息

**必填项**:
- **Repository name**: `wanling-riddle-game`
- **Description**: `万灵灯谜互动游戏 - 东方幻想风格的猜谜游戏`

**选填项**:
- **Public** (推荐) - 公开仓库,任何人都可以访问
- **Private** - 私有仓库,只有您可以访问

**其他选项**:
- ❌ "Add a README file" - 不要勾选(我们已经有代码了)
- ❌ "Add .gitignore" - 不要勾选
- ❌ "Choose a license" - 不要勾选

#### 1.3 创建仓库

点击绿色的 **"Create repository"** 按钮

#### 1.4 保存仓库地址

创建成功后,GitHub 会显示一个页面,复制您的仓库地址:

```
https://github.com/yanhewang/wanling-riddle-game.git
```

---

### 步骤 2:推送代码到 GitHub

#### 2.1 打开终端

在终端中执行以下命令:

```bash
cd /Users/hehewang/WorkBuddy/20260316115522
```

#### 2.2 添加 GitHub 远程仓库

```bash
git remote add github https://github.com/yanhewang/wanling-riddle-game.git
```

#### 2.3 推送代码到 GitHub

```bash
git push -u github master
```

**身份验证**:

如果这是您第一次推送代码,GitHub 会要求身份验证:

**方式 A:使用 Personal Access Token (推荐)**
1. 访问: https://github.com/settings/tokens
2. 点击 "Generate new token" → "Generate new token (classic)"
3. 填写信息:
   - Note: `Vercel Deploy Token`
   - Expiration: 选择一个过期时间(推荐 90 days)
   - 勾选权限: `repo` (完整的仓库访问权限)
4. 点击 "Generate token"
5. **复制 token**(只显示一次!)
6. 回到终端,输入用户名: `yanhewang`
7. 输入密码: 粘贴刚才复制的 token

**方式 B:使用 SSH 密钥 (如果您已配置 SSH)**
- 直接使用 SSH 推送,无需输入密码

#### 2.4 验证推送成功

推送成功后,您会看到类似输出:

```
Enumerating objects: 20, done.
Counting objects: 100% (20/20), done.
Writing objects: 100% (20/20), XX KiB | XX MiB/s, done.
Total 20 (delta 5), reused 0 (delta 0)
To https://github.com/yanhewang/wanling-riddle-game.git
 * [new branch]      master -> master
```

#### 2.5 在 GitHub 验证

访问您的 GitHub 仓库:
```
https://github.com/yanhewang/wanling-riddle-game
```

您应该能看到:
- ✅ 所有的代码文件
- ✅ README.md
- ✅ 所有提交记录

---

### 步骤 3:在 Vercel 导入项目

#### 3.1 访问 Vercel

打开浏览器访问:
```
https://vercel.com/new
```

#### 3.2 登录/注册 Vercel

如果您还没有 Vercel 账号:
1. 点击 "Sign Up"
2. 使用 GitHub 账号登录(推荐)
3. 或者使用 Email 注册

如果您已有账号:
1. 点击 "Log In"
2. 使用 GitHub 账号登录

#### 3.3 导入 GitHub 仓库

1. 在 Vercel 页面,您会看到 **"Import Git Repository"** 部分
2. 点击 **"Continue with GitHub"** 按钮
3. 如果需要,授权 Vercel 访问您的 GitHub 账号
4. 在仓库列表中找到 `wanling-riddle-game`
5. 点击 **"Import"** 按钮

#### 3.4 配置项目

**Framework Preset**:
- 选择: `Other` (因为这是纯静态 HTML 项目)

**Project Name**:
- 默认: `wanling-riddle-game`
- 您可以修改,但建议保持默认

**Build and Output Settings**:
- **Build Command**: 留空(不需要构建)
- **Output Directory**: 留空或输入 `.` (当前目录)

**Environment Variables**:
- 不需要配置

#### 3.5 部署项目

1. 检查所有配置是否正确
2. 点击蓝色的 **"Deploy"** 按钮
3. 等待部署完成(通常 1-2 分钟)

#### 3.6 部署成功

部署成功后,Vercel 会显示:
- ✅ **Congrats!** 的成功消息
- 🔗 您的网站链接: `https://wanling-riddle-game.vercel.app`

**恭喜!您的游戏已成功上线!** 🎉

---

## 🎉 完成!您的游戏现在可以访问了

### 访问您的游戏

直接访问:
```
https://wanling-riddle-game.vercel.app
```

或者点击 Vercel 提供的 **"Visit"** 按钮

---

## 🔄 更新游戏 (后续操作)

当您需要更新游戏时:

### 步骤 1:修改代码

在本地修改 `index.html` 或其他文件

### 步骤 2:提交代码

```bash
cd /Users/hehewang/WorkBuddy/20260316115522
git add .
git commit -m "更新游戏内容"
```

### 步骤 3:推送到 GitHub

```bash
git push github master
```

### 步骤 4:自动部署

Vercel 会检测到新的提交,自动重新部署!
- 通常需要 1-2 分钟
- 部署完成后自动更新网站

---

## 🌟 Vercel 的高级功能

### 自定义域名

1. 在 Vercel 项目页面,点击 **"Settings"**
2. 点击 **"Domains"**
3. 添加您的自定义域名
4. 按照指引配置 DNS

### 环境变量

如果您的游戏需要配置 API 密钥等:
1. Settings → Environment Variables
2. 添加变量

### 分析统计

Vercel 提供免费的网站访问统计:
- 访问量
- 访问地域
- 性能指标

---

## 📊 项目状态检查

### 查看 GitHub 仓库状态

```bash
cd /Users/hehewang/WorkBuddy/20260316115522
git status
git log --oneline -5
```

### 查看远程仓库

```bash
git remote -v
```

### 推送新代码

```bash
git push github master
```

---

## 🆘 常见问题

### Q1:推送时提示 "Permission denied"

**解决方案**:
1. 检查用户名是否正确: `yanhewang`
2. 使用 Personal Access Token 而不是 GitHub 密码
3. 确认 token 有 `repo` 权限

### Q2:Vercel 导入时找不到仓库

**解决方案**:
1. 确认已授权 Vercel 访问 GitHub
2. 确认仓库是 Public(公开)的
3. 等待 GitHub 索引完成(通常 1-2 分钟)

### Q3:部署后页面显示 404

**解决方案**:
1. 检查 `index.html` 是否在根目录
2. 确认 Output Directory 设置正确
3. 查看 Vercel 部署日志

### Q4:如何删除项目?

**删除 GitHub 仓库**:
1. GitHub 仓库 → Settings
2. 滚动到底部 → "Danger Zone"
3. 点击 "Delete this repository"

**删除 Vercel 项目**:
1. Vercel 项目 → Settings
2. 滚动到底部 → "Delete Project"

---

## 📋 检查清单

部署完成后,请确认:

- [ ] GitHub 仓库已创建
- [ ] 代码已推送到 GitHub
- [ ] Vercel 已导入项目
- [ ] Vercel 部署成功
- [ ] 游戏链接可以正常访问
- [ ] 游戏功能正常工作

---

## 🎯 快速命令参考

```bash
# 推送到 GitHub
git push github master

# 查看状态
git status

# 查看提交历史
git log --oneline -5

# 查看远程仓库
git remote -v

# 提交新代码
git add .
git commit -m "更新说明"
git push github master
```

---

## 📞 需要帮助?

如果遇到问题:

1. 查看 Vercel 部署日志
2. 查看 GitHub 仓库的 Issues
3. 检查控制台错误信息
4. 联系我获取帮助

---

**祝您部署顺利!** 🚀🎉

---

## 🎮 部署完成后

您将获得:

- ✅ **在线游戏链接**: `https://wanling-riddle-game.vercel.app`
- ✅ **全球访问**: 任何人都可以访问
- ✅ **自动更新**: 推送代码自动部署
- ✅ **完全免费**: 无需付费
- ✅ **专业托管**: Vercel 提供的专业服务

**现在就开始吧!** 🚀
