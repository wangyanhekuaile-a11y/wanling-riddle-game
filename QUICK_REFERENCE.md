# 万灵灯谜 - 快速操作参考卡片

## 📌 当前状态

✅ 代码已升级到 v2.0(万灵灯谜版本)
✅ 已提交到本地 Git 仓库
✅ 项目文档齐全
⏳ 待推送到工蜂代码仓库

---

## 🚀 快速推送步骤

### 1️⃣ 在工蜂创建项目

访问:https://git.code.oa.com/

- 项目名称:`wanling-riddle-game`
- 项目描述:`万灵灯谜互动游戏 - 华丽东方幻想风格`
- 可见性:Internal 或 Private

创建后复制仓库地址:
```
https://git.code.oa.com/yanhewang/wanling-riddle-game.git
```

---

### 2️⃣ 获取 Personal Access Token

1. 工蜂 → 头像 → Settings → Access Tokens
2. 点击 "Add new token"
3. 配置:
   - Token name:`wanling-riddle-game-deploy`
   - 权限:read_repository, write_repository
4. 复制生成的 Token(只显示一次!)

---

### 3️⃣ 推送代码

```bash
# 进入项目目录
cd /Users/hehewang/WorkBuddy/20260316115522

# 添加远程仓库(替换为您的实际地址)
git remote add origin https://git.code.oa.com/yanhewang/wanling-riddle-game.git

# 推送代码
git push -u origin main
```

**身份验证:**
- Username:yanhewang
- Password:粘贴 Personal Access Token

---

## 📦 推荐部署方案:COS + CDN

### 快速部署步骤

1. **创建 COS 存储桶**
   - 名称:`wanling-riddle-game`
   - 地域:广州
   - 权限:私有读写

2. **开启静态网站**
   - 索引文档:index.html
   - 错误文档:index.html

3. **上传文件**
   - 上传 `index.html` 到 COS

4. **配置 CDN**
   - 源站类型:COS 源
   - 加速域名:riddle.yourdomain.com
   - 配置 HTTPS(免费证书)

5. **CNAME 解析**
   - 添加 CNAME 记录指向 CDN

---

## 🔗 访问游戏

部署成功后访问:
```
https://riddle.yourdomain.com/index.html
```

---

## 📋 项目文件清单

```
wanling-riddle-game/
├── index.html              # 游戏主文件
├── README.md               # 项目说明
├── DEPLOYMENT_STEPS.md     # 完整部署指南 ⭐
├── DEPLOYMENT_GUIDE.md     # 部署方案详解
├── QUICKSTART.md           # 快速开始
├── DELIVERY_CHECKLIST.md   # 交付清单
├── 推送到工蜂.md          # 工蜂推送详解
├── push-to-gitlab.sh       # 推送脚本
└── QUICK_REFERENCE.md      # 本文件
```

---

## 📖 详细文档

- **完整部署指南**:查看 `DEPLOYMENT_STEPS.md`
- **工蜂推送详解**:查看 `推送到工蜂.md`
- **部署方案对比**:查看 `DEPLOYMENT_GUIDE.md`

---

## ⚡ 一键推送命令

```bash
cd /Users/hehewang/WorkBuddy/20260316115522 && \
git remote add origin https://git.code.oa.com/yanhewang/wanling-riddle-game.git && \
git push -u origin main
```

---

## ✅ 检查清单

推送前确认:
- [ ] 已在工蜂创建项目
- [ ] 已获取 Personal Access Token
- [ ] 仓库地址正确
- [ ] 代码已本地提交

部署后确认:
- [ ] 游戏可以正常访问
- [ ] 所有功能测试通过
- [ ] 移动端响应式正常
- [ ] HTTPS 配置完成

---

## 🆘 遇到问题?

### 推送失败
1. 检查仓库地址是否正确
2. 确认使用 Personal Access Token
3. 检查网络连接

### 部署失败
1. 查看 `DEPLOYMENT_STEPS.md` 详细步骤
2. 检查腾讯云配置
3. 确认域名解析正确

---

**文档更新时间**:2026-03-16
**项目版本**:v2.0
