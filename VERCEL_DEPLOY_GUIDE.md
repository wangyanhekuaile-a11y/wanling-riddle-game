# 🚀 Vercel 快速部署指南 - 万灵灯谜游戏

## 方法一:最简单 - 拖拽部署(推荐,2分钟)

### 步骤 1:准备文件
确保项目目录包含:
```
wanling-riddle-game/
├── index.html (必须)
├── README.md (可选)
└── 其他文档...
```

### 步骤 2:访问 Vercel
打开浏览器访问:https://vercel.com/signup

### 步骤 3:登录账号
- 使用 GitHub、GitLab、Bitbucket 或 Email 登录
- 免费注册即可

### 步骤 4:拖拽上传
1. 登录后,在 Vercel 首页
2. 将 `/Users/hehewang/WorkBuddy/20260316115522` 文件夹
3. **直接拖拽**到 Vercel 页面的上传区域
4. 等待上传完成(约 30 秒)

### 步骤 5:获取链接
上传成功后,Vercel 会自动:
- ✅ 部署您的网站
- ✅ 生成访问链接(类似:https://wanling-riddle-game.vercel.app)
- ✅ 配置 HTTPS

**您的游戏链接就是 Vercel 提供的域名!**

---

## 方法二:使用 Git 部署(如果已推送到 GitHub)

### 步骤 1:推送到 GitHub

```bash
# 初始化 Git(如果还没有)
cd /Users/hehewang/WorkBuddy/20260316115522
git init
git add .
git commit -m "万灵灯谜游戏 v2.0"

# 推送到 GitHub
git remote add origin https://github.com/yanhewang/wanling-riddle-game.git
git push -u origin main
```

### 步骤 2:在 Vercel 导入
1. 访问:https://vercel.com/dashboard
2. 点击 "Add New" → "Project"
3. 选择您的 GitHub 仓库
4. 点击 "Deploy"
5. 等待部署完成(约 1-2 分钟)

### 步骤 3:获取链接
Vercel 会提供:
- 预览链接:https://wanling-riddle-game-xxx.vercel.app
- 生产链接:https://wanling-riddle-game.vercel.app

---

## 方法三:使用 Vercel CLI(需要 Node.js)

### 步骤 1:安装 Node.js
访问:https://nodejs.org/ 下载并安装

### 步骤 2:安装 Vercel CLI
```bash
npm install -g vercel
```

### 步骤 3:登录 Vercel
```bash
cd /Users/hehewang/WorkBuddy/20260316115522
vercel login
```

### 步骤 4:部署
```bash
vercel
```

按照提示操作,1分钟内完成部署!

---

## ✅ 部署成功后

### 您会获得:
1. **在线游戏链接**:https://wanling-riddle-game.vercel.app
2. **自动 HTTPS**:Vercel 自动配置 SSL 证书
3. **全球 CDN**:自动分发到全球节点
4. **持续部署**:更新代码自动重新部署

### 分享链接:
- 复制 Vercel 提供的链接
- 直接分享给任何人访问
- 支持桌面和移动设备

---

## 🎯 推荐流程

**最快方式**:方法一(拖拽部署)
- ⏱️ 时间:2分钟
- 📱 设备:任何浏览器
- 💰 成本:免费
- 🔧 技术要求:无

**如果您有 GitHub**:方法二(Git 部署)
- ⏱️ 时间:3分钟
- 📱 设备:任何浏览器
- 💰 成本:免费
- 🔧 技术要求:需要 Git 和 GitHub 账号

---

## 📝 注意事项

1. **文件夹名称**:建议使用英文,避免中文
2. **index.html**:必须命名为 `index.html`
3. **免费额度**:Vercel 免费版完全够用
4. **域名**:可以后续绑定自定义域名

---

## 🆘 常见问题

### Q: 需要付费吗?
A: Vercel 免费版完全够用,无限带宽和流量。

### Q: 链接会失效吗?
A: 不会,只要不删除项目,链接永久有效。

### Q: 可以修改域名吗?
A: 可以,Vercel 支持绑定自定义域名。

### Q: 如何更新游戏?
A: 重新拖拽文件夹或推送代码,自动重新部署。

---

## 🎉 部署后您就拥有:

```
✅ 在线游戏链接: https://wanling-riddle-game.vercel.app
✅ 全球加速访问
✅ HTTPS 安全连接
✅ 移动端完美适配
✅ 自动更新部署
```

---

**现在就开始部署吧!** 🚀

访问:https://vercel.com/signup
