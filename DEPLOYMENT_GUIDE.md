# 工蜂代码仓库推送和部署指南

## ⚠️ 重要提示

由于工蜂（GitLab）需要腾讯内部登录认证，无法通过自动化工具直接访问。请按照以下步骤手动完成推送和部署。

---

## 第一部分：推送代码到工蜂

### 步骤 1：获取工蜂仓库地址

1. **登录工蜂**：访问 https://git.code.oa.com/
2. **创建新项目**：
   - 点击 "New Project" 或 "新建项目"
   - 项目名称：`smart-riddle-game`（或您喜欢的名字）
   - 项目描述：`智慧猜灯谜互动游戏 - 传统节日互动体验`
   - 可见性：Internal（内部）或 Private（私有）
   - 点击 "Create project"

3. **复制仓库地址**：
   - 创建后会显示仓库地址，格式通常为：
     ```
     https://git.code.oa.com/yanhewang/smart-riddle-game.git
     ```
     或者
     ```
     git@git.code.oa.com:yanhewang/smart-riddle-game.git
     ```

### 步骤 2：推送代码到工蜂

在项目目录执行：

```bash
# 进入项目目录
cd /Users/hehewang/WorkBuddy/20260316115522

# 添加远程仓库（替换为您的实际仓库地址）
git remote add origin https://git.code.oa.com/yanhewang/smart-riddle-game.git

# 推送代码到远程仓库
git push -u origin main
```

如果遇到认证问题：

**方式 1：使用 HTTPS + 个人访问令牌**
```bash
# 推送时会提示输入用户名和密码
# 用户名：你的工蜂账号
# 密码：使用个人访问令牌（Personal Access Token）
```

如何生成个人访问令牌：
1. 在工蜂页面点击头像 → Settings → Access Tokens
2. 点击 "Add new token"
3. 勾选必要的权限（如：read_repository, write_repository）
4. 点击 "Create personal access token"
5. 复制生成的 token（只显示一次，请妥善保存）

**方式 2：配置 Git 凭据**
```bash
# 配置凭证存储
git config --global credential.helper store

# 再次推送时输入一次密码后自动保存
git push -u origin main
```

### 步骤 3：验证推送成功

- 访问工蜂项目页面，确认代码已上传
- 查看 Commit 历史和文件列表

---

## 第二部分：部署上线方案

### 方案一：使用腾讯云 COS + CDN（推荐）

这是最简单、成本最低的方案，适合静态网站。

#### 步骤 1：准备 COS 存储桶

1. **登录腾讯云控制台**：https://console.cloud.tencent.com/cos
2. **创建存储桶**：
   - 点击 "创建存储桶"
   - 名称：`smart-riddle-game`（全局唯一）
   - 所属地域：选择离您用户最近的地域（如：广州、上海）
   - 访问权限：**私有读写**（稍后配置静态网站）

3. **配置静态网站**：
   - 进入存储桶 → "基础配置" → "静态网站"
   - 点击 "编辑"
   - 开启静态网站
   - 索引文档：`index.html`
   - 错误文档：`index.html`
   - 点击 "保存"

4. **上传文件**：
   - 进入 "文件管理"
   - 上传 `index.html` 文件
   - 或使用 COSCMD 上传：
     ```bash
     # 安装 COSCMD
     pip install coscmd
     
     # 配置 COSCMD
     coscmd config
     
     # 上传文件
     coscmd upload index.html /index.html
     ```

#### 步骤 2：配置 CDN 加速

1. **进入 CDN 控制台**：https://console.cloud.tencent.com/cdn
2. **添加域名**：
   - 点击 "添加域名"
   - 源站类型：COS 源
   - 源站地址：选择你的 COS 存储桶
   - 加速域名：填写您的域名（如：game.yourdomain.com）
   - 点击 "提交"

3. **配置 HTTPS**（可选但推荐）：
   - 在域名管理中点击 "配置"
   - 添加 SSL 证书（可使用免费证书或自有证书）
   - 开启强制 HTTPS

#### 步骤 3：访问游戏

- **测试访问**：使用 CDN 域名访问（如：http://game.yourdomain.com）
- **正式域名**：解析域名到 CDN 地址

---

### 方案二：使用腾讯云 CVM + Nginx

适合需要服务器配置、自定义域名等场景。

#### 步骤 1：购买并配置 CVM

1. **登录腾讯云**：https://console.cloud.tencent.com/cvm
2. **购买云服务器**：
   - 实例规格：1核2GB 足够
   - 镜像：CentOS 7 或 Ubuntu 20.04
   - 网络计费：按流量或按带宽

3. **登录服务器**（使用 SSH）：
   ```bash
   ssh root@your_server_ip
   ```

#### 步骤 2：安装 Nginx

```bash
# CentOS
yum install -y nginx

# Ubuntu
apt-get update
apt-get install -y nginx
```

#### 步骤 3：部署代码

```bash
# 创建网站目录
mkdir -p /var/www/riddle-game

# 上传文件到服务器
scp index.html root@your_server_ip:/var/www/riddle-game/

# 或使用 git clone（已推送到工蜂后）
cd /var/www
git clone https://git.code.oa.com/yanhewang/smart-riddle-game.git riddle-game
```

#### 步骤 4：配置 Nginx

创建配置文件：
```bash
vi /etc/nginx/conf.d/riddle-game.conf
```

添加配置：
```nginx
server {
    listen 80;
    server_name game.yourdomain.com;  # 替换为你的域名

    root /var/www/riddle-game;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    # 启用 gzip 压缩
    gzip on;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml;
}
```

重启 Nginx：
```bash
systemctl restart nginx
systemctl enable nginx
```

#### 步骤 5：配置域名解析

在域名管理后台添加 A 记录：
- 主机记录：game
- 记录类型：A
- 记录值：你的 CVM 公网 IP

---

### 方案三：使用 Serverless 部署（现代化方案）

#### 使用腾讯云 SCF + API Gateway

适合 Serverless 架构，按需付费。

1. **创建云函数**：
   - 登录 SCF 控制台
   - 创建函数，选择 "Web 函数" 类型
   - 运行时：Python/Node.js/Go 等
   - 上传代码或使用在线编辑

2. **创建 API 网关**：
   - 关联云函数
   - 配置自定义域名

---

## 第三部分：工蜂 CI/CD 自动化部署（可选）

### 配置 CI/CD 流水线

在工蜂项目中创建 `.gitlab-ci.yml` 文件：

```yaml
stages:
  - deploy

deploy_to_cos:
  stage: deploy
  image: python:3.9
  only:
    - main
  script:
    - pip install coscmd
    - coscmd config
    - coscmd upload index.html /index.html
    - echo "部署到 COS 成功"
  when: manual
```

### 配置环境变量

在工蜂项目设置中添加以下 CI/CD 变量：
- `COS_SECRET_ID`：腾讯云 API Secret ID
- `COS_SECRET_KEY`：腾讯云 API Secret Key
- `COS_BUCKET`：存储桶名称
- `COS_REGION`：存储桶地域

### 触发部署

- 每次推送到 main 分支自动触发
- 或手动点击流水线运行

---

## 第四部分：最终的游戏链接获取

### 方案一：COS + CDN

游戏链接格式：
```
https://<你的CDN域名>/index.html
```

例如：
```
https://cdn.game.yourdomain.com/index.html
```

### 方案二：CVM + Nginx

游戏链接格式：
```
http://<你的域名>/index.html
```

或直接访问：
```
http://<CVM公网IP>/index.html
```

### 方案三：Serverless

游戏链接格式：
```
https://<API网关自定义域名>/
```

---

## 常见问题

### Q1: 推送代码时提示权限被拒绝？

**A**: 
- 检查是否配置了正确的远程仓库地址
- 使用个人访问令牌（Personal Access Token）
- 确认你有该仓库的写入权限

### Q2: 如何配置 HTTPS？

**A**:
- 在腾讯云 SSL 证书服务申请免费证书
- 在 CDN 或 Nginx 中配置证书
- 开启强制 HTTPS

### Q3: 如何更新游戏内容？

**A**:
- 修改代码后重新提交：
  ```bash
  git add .
  git commit -m "更新游戏内容"
  git push
  ```
- 如果配置了 CI/CD，自动部署
- 或手动上传到 COS/CVM

---

## 总结

由于无法直接访问您的工蜂账户，我已经为您完成了：

✅ **已完成**：
1. 创建了完整的"智慧猜灯谜互动游戏"代码
2. 初始化了 Git 仓库并本地提交
3. 提供了详细的工蜂推送和部署指导

**您需要手动完成**：
1. 在工蜂创建项目并获取仓库地址
2. 推送代码到工蜂
3. 选择部署方案（COS+CDN 推荐）
4. 按照部署指南完成上线

**预期结果**：
完成后，您将获得一个正式的在线游戏链接，例如：
```
https://game.yourdomain.com/index.html
```

如有任何问题，请参考本文档或联系我！
