# 快速开始指南

## 📋 当前状态

✅ 游戏代码已创建完成
✅ Git 仓库已初始化并提交
✅ 所有文件准备就绪

## 🚀 接下来您需要做的（3 步）

### 第 1 步：推送到工蜂（5 分钟）

```bash
# 1. 登录工蜂创建新项目
#    访问：https://git.code.oa.com/
#    点击 "New Project"，项目名建议：smart-riddle-game

# 2. 复制仓库地址（例如）：
#    https://git.code.oa.com/yanhewang/smart-riddle-game.git

# 3. 推送代码
cd /Users/hehewang/WorkBuddy/20260316115522
git remote add origin https://git.code.oa.com/yanhewang/smart-riddle-game.git
git push -u origin main
```

**提示**：推送时会提示输入工蜂账号和密码，密码处使用个人访问令牌（Personal Access Token）

### 第 2 步：部署上线（10-20 分钟）

**推荐方案：COS + CDN**（最简单、成本最低）

1. **登录腾讯云 COS**：https://console.cloud.tencent.com/cos
2. **创建存储桶**：
   - 名称：`smart-riddle-game`
   - 地域：选择广州或上海
3. **开启静态网站**：
   - 存储桶 → 基础配置 → 静态网站
   - 索引文档：`index.html`
4. **上传 index.html**：
   - 直接在网页上传，或使用 COSCMD：
     ```bash
     coscmd upload index.html /index.html
     ```
5. **添加 CDN 加速**：
   - 访问：https://console.cloud.tencent.com/cdn
   - 添加域名，源站选择 COS
   - 解析域名到 CDN 地址

### 第 3 步：获取游戏链接

完成后，您的游戏链接将是：
```
https://<你的域名>/index.html
```

例如：
```
https://game.yourdomain.com/index.html
```

---

## 📁 项目文件说明

```
/Users/hehewang/WorkBuddy/20260316115522/
├── index.html              # 游戏主页面（包含所有代码）
├── README.md               # 项目说明文档
├── DEPLOYMENT_GUIDE.md     # 详细部署指南
├── QUICKSTART.md           # 本文件 - 快速开始指南
├── .gitignore             # Git 忽略文件
└── .git/                  # Git 仓库（已初始化）
```

---

## 🎮 本地预览

在推送之前，您可以先本地预览游戏：

**方式 1：直接打开**
```bash
open index.html
```

**方式 2：使用本地服务器**
```bash
# Python 3
python -m http.server 8000
# 访问：http://localhost:8000

# 或使用 PHP
php -S localhost:8000
# 访问：http://localhost:8000
```

---

## 💡 常见问题

### Q: 推送时提示身份验证失败？
**A**: 使用工蜂的个人访问令牌（Personal Access Token）作为密码
   - 工蜂页面：Settings → Access Tokens → Add new token

### Q: 没有域名怎么办？
**A**: 可以使用 COS 提供的临时域名（不推荐长期使用）
   - COS 存储桶 → 静态网站 → 查看访问域名

### Q: 如何更新游戏？
**A**: 修改代码后重新推送
   ```bash
   git add .
   git commit -m "更新游戏内容"
   git push
   ```
   然后重新上传 index.html 到 COS

---

## 📞 需要帮助？

详细的部署步骤请查看：**DEPLOYMENT_GUIDE.md**

如有任何问题，随时联系我！

---

## ✨ 游戏特色

- 🎯 10 道精选灯谜题目
- 📊 实时计分和进度显示
- 💡 提示功能（使用提示后得分减半）
- 📱 完美支持手机端
- 🎨 精美的渐变色 UI
- 🏆 根据得分给出不同评价

祝您部署顺利！🎉
