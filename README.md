# 智慧猜灯谜互动游戏

## 项目简介

这是一个基于 HTML5/CSS3/JavaScript 的传统节日互动猜灯谜游戏，支持响应式设计，在移动端和桌面端均有良好体验。

## 功能特点

- 🎯 包含 10 道精选灯谜题目
- 📊 实时计分系统和进度显示
- 💡 提示功能（使用提示后得分减半）
- ⏭️ 跳过功能（可跳过不会的题目）
- 📱 响应式设计，支持移动端
- 🎨 精美的渐变色界面
- 🏆 结束后根据得分显示不同评价

## 如何运行

1. 直接用浏览器打开 `index.html` 文件即可运行
2. 或使用本地服务器：
   ```bash
   # 使用 Python 3
   python -m http.server 8000
   
   # 或使用 Node.js
   npx serve
   ```

## 技术栈

- HTML5
- CSS3 (Flexbox, Gradient, Animation)
- JavaScript (Vanilla JS)
- 响应式设计

## 游戏规则

1. 总共有 10 道灯谜题目
2. 每题答对得 10 分
3. 使用提示后答对得 5 分
4. 可跳过不会的题目
5. 最终得分根据答题情况给出评价

## 部署指南

### 静态服务器部署

本项目是纯静态 HTML/CSS/JavaScript，可以部署到任何静态网站托管服务：

1. **Nginx/Apache**：将文件复制到 Web 服务器根目录
2. **CDN**：上传到腾讯云 CDN、阿里云 CDN 等
3. **对象存储**：上传到 COS、OSS 等对象存储并开启静态网站托管
4. **Vercel/Netlify**：拖拽文件夹即可部署

### 腾讯云部署建议

1. **COS + CDN**：
   - 将 index.html 上传到腾讯云 COS
   - 配置静态网站托管
   - 开启 CDN 加速

2. **腾讯云服务器**：
   - 安装 Nginx
   - 配置静态网站服务

## 工蜂代码仓库推送

由于工蜂需要腾讯内部登录认证，请按照以下步骤手动操作：

1. **初始化 Git 仓库**：
   ```bash
   git init
   git add .
   git commit -m "初始化智慧猜灯谜互动游戏"
   ```

2. **关联工蜂远程仓库**：
   ```bash
   git remote add origin <你的工蜂仓库地址>
   ```

3. **推送代码**：
   ```bash
   git push -u origin master
   # 或
   git push -u origin main
   ```

4. **在工蜂平台配置 CI/CD 流程**（根据您的团队标准流程）

## 许可证

MIT License

## 作者

WorkBuddy AI
