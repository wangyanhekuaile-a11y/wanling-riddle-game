# 万灵灯谜游戏 - 工蜂推送和部署完整指南

## 📋 概述

本指南将引导您完成将"万灵灯谜"游戏代码推送到工蜂代码仓库,并按照业务发布流程进行部署的完整流程。

---

## 🔧 第一部分:准备工作

### 1.1 检查当前项目状态

```bash
# 确认在项目目录
cd /Users/hehewang/WorkBuddy/20260316115522

# 查看 Git 状态
git status
```

### 1.2 查看提交历史

```bash
# 查看最近的提交
git log --oneline -5
```

**预期输出:**
```
732f20a 升级到万灵灯谜v2.0版本
(之前的提交记录...)
```

### 1.3 确认代码完整性

```bash
# 查看项目文件
ls -la
```

**应该包含:**
- index.html (游戏主文件)
- README.md (项目文档)
- DEPLOYMENT_GUIDE.md (部署指南)
- QUICKSTART.md (快速开始)
- DELIVERY_CHECKLIST.md (交付清单)
- 推送到工蜂.md (工蜂推送指南)
- push-to-gitlab.sh (推送脚本)

---

## 🚀 第二部分:推送到工蜂

### 2.1 在工蜂创建项目

#### 步骤 1:访问工蜂
```
https://git.code.oa.com/
```

#### 步骤 2:创建新项目
1. 点击右上角 "New Project" 或 "新建项目"
2. 填写项目信息:
   - **Project name(项目名称)**:`wanling-riddle-game`
   - **Project description(项目描述)**:`万灵灯谜互动游戏 - 华丽东方幻想风格`
   - **Visibility Level(可见性)**:选择 `Internal`(内部可见)或 `Private`(私有)
3. 点击 "Create project" 或 "创建项目"

#### 步骤 3:复制仓库地址
创建成功后,复制 HTTPS 地址:
```
https://git.code.oa.com/yanhewang/wanling-riddle-game.git
```

### 2.2 配置 Git 远程仓库

```bash
# 添加远程仓库(替换为您的实际地址)
git remote add origin https://git.code.oa.com/yanhewang/wanling-riddle-game.git

# 验证远程仓库配置
git remote -v
```

### 2.3 获取 Personal Access Token

#### 为什么需要 Token?
工蜂不再支持使用登录密码进行 Git 操作,需要使用 Personal Access Token 进行身份验证。

#### 生成 Token 步骤:

1. **访问个人设置**
   - 登录工蜂后,点击右上角头像
   - 选择 "Settings" 或 "设置"

2. **生成访问令牌**
   - 左侧菜单选择 "Access Tokens" 或 "访问令牌"
   - 点击 "Add new token" 或 "添加新令牌"

3. **配置令牌**
   - **Token name(令牌名称)**:`wanling-riddle-game-deploy`
   - **Expiration date(过期日期)**:选择合适的时间(如 1 年)
   - **Scopes(权限范围)**:勾选以下权限:
     - ✅ `read_repository`(读取仓库)
     - ✅ `write_repository`(写入仓库)
   - 点击 "Create personal access token" 或 "创建令牌"

4. **复制令牌**
   - 令牌只显示一次,请立即复制并妥善保存
   - 格式类似:`glpat-xxxxxxxxxxxxxxxxxxxx`

### 2.4 推送代码到工蜂

```bash
# 推送代码(会提示输入用户名和密码)
git push -u origin main
```

**身份验证提示:**
```
Username for 'https://git.code.oa.com/yanhewang': yanhewang
Password for 'https://yanhewang@git.code.oa.com/yanhewang': [粘贴Personal Access Token]
```

**注意:** 密码处输入的是 Personal Access Token,不是工蜂登录密码!

### 2.5 验证推送成功

推送成功后会看到:
```
Enumerating objects: 25, done.
Counting objects: 100% (25/25), done.
Delta compression using up to 8 threads
Compressing objects: 100% (20/20), done.
Writing objects: 100% (25/25), 25.50 KiB | 3.62 MiB/s, done.
Total 25 (delta 8), reused 0 (delta 0)
To https://git.code.oa.com/yanhewang/wanling-riddle-game.git
 * [new branch]      main -> main
```

### 2.6 在工蜂确认

1. 访问工蜂项目页面
2. 查看 "Repository" → "Files"
3. 确认文件列表完整
4. 查看 "Commits" 确认提交历史

---

## 📦 第三部分:按照业务流程部署

### 方案一:使用腾讯云 COS + CDN(推荐)

这是最简单、成本最低的方案,适合静态网站。

#### 3.1.1 准备 COS 存储桶

1. **登录腾讯云控制台**
   ```
   https://console.cloud.tencent.com/cos
   ```

2. **创建存储桶**
   - 点击 "创建存储桶"
   - 名称:`wanling-riddle-game`(全局唯一)
   - 所属地域:选择离用户最近的地域(如:广州、上海)
   - 访问权限:**私有读写**(稍后配置静态网站)

3. **配置静态网站**
   - 进入存储桶 → "基础配置" → "静态网站"
   - 点击 "编辑"
   - 开启静态网站
   - 索引文档:`index.html`
   - 错误文档:`index.html`
   - 点击 "保存"

4. **上传文件**
   - 进入 "文件管理"
   - 上传 `index.html` 文件
   - 或使用 COSCMD 上传:
     ```bash
     # 安装 COSCMD
     pip install coscmd

     # 配置 COSCMD
     coscmd config

     # 上传文件
     coscmd upload index.html /index.html
     ```

#### 3.1.2 配置 CDN 加速

1. **进入 CDN 控制台**
   ```
   https://console.cloud.tencent.com/cdn
   ```

2. **添加域名**
   - 点击 "添加域名"
   - 源站类型:COS 源
   - 源站地址:选择你的 COS 存储桶
   - 加速域名:填写您的域名(如:riddle.yourdomain.com)
   - 点击 "提交"

3. **配置 HTTPS**(推荐)
   - 在域名管理中点击 "配置"
   - 添加 SSL 证书(可使用免费证书)
   - 开启强制 HTTPS

4. **CNAME 配置**
   - 复制 CDN 提供的 CNAME 记录
   - 在域名管理后台添加 CNAME 解析

#### 3.1.3 访问游戏

- 测试访问:使用 CDN 域名
  ```
  https://riddle.yourdomain.com/index.html
  ```

---

### 方案二:使用工蜂 CI/CD 自动部署

#### 3.2.1 创建 CI/CD 配置文件

在项目根目录创建 `.gitlab-ci.yml`:

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
    - coscmd config -a $COS_SECRET_ID -s $COS_SECRET_KEY -b $COS_BUCKET -r $COS_REGION
    - coscmd upload index.html /index.html -e
    - echo "部署到 COS 成功"
  when: manual
```

#### 3.2.2 配置环境变量

在工蜂项目设置中添加 CI/CD 变量:
- `COS_SECRET_ID`:腾讯云 API Secret ID
- `COS_SECRET_KEY`:腾讯云 API Secret Key
- `COS_BUCKET`:存储桶名称(如:`wanling-riddle-game-1234567890`)
- `COS_REGION`:存储桶地域(如:`ap-guangzhou`)

#### 3.2.3 提交 CI/CD 配置

```bash
# 创建 .gitlab-ci.yml 文件后提交
git add .gitlab-ci.yml
git commit -m "添加 CI/CD 自动部署配置"
git push origin main
```

#### 3.2.4 触发部署

1. 在工蜂项目页面点击 "CI/CD" → "Pipelines"
2. 查看最新流水线
3. 点击右侧的 "Play" 手动按钮触发部署
4. 等待部署完成

---

### 方案三:使用腾讯云 CVM + Nginx

适合需要服务器配置、自定义域名等场景。

#### 3.3.1 购买并配置 CVM

1. **登录腾讯云**
   ```
   https://console.cloud.tencent.com/cvm
   ```

2. **购买云服务器**
   - 实例规格:1核2GB 足够
   - 镜像:CentOS 7 或 Ubuntu 20.04
   - 网络计费:按流量或按带宽

3. **登录服务器**(使用 SSH):
   ```bash
   ssh root@your_server_ip
   ```

#### 3.3.2 安装 Nginx

```bash
# CentOS
yum install -y nginx

# Ubuntu
apt-get update
apt-get install -y nginx
```

#### 3.3.3 部署代码

```bash
# 创建网站目录
mkdir -p /var/www/wanling-riddle

# 上传文件到服务器
scp index.html root@your_server_ip:/var/www/wanling-riddle/

# 或使用 git clone
cd /var/www
git clone https://git.code.oa.com/yanhewang/wanling-riddle-game.git wanling-riddle
```

#### 3.3.4 配置 Nginx

创建配置文件:
```bash
vi /etc/nginx/conf.d/wanling-riddle.conf
```

添加配置:
```nginx
server {
    listen 80;
    server_name riddle.yourdomain.com;  # 替换为你的域名

    root /var/www/wanling-riddle;
    index index.html;

    location / {
        try_files $uri $uri/ /index.html;
    }

    # 启用 gzip 压缩
    gzip on;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml;
}
```

重启 Nginx:
```bash
systemctl restart nginx
systemctl enable nginx
```

#### 3.3.5 配置域名解析

在域名管理后台添加 A 记录:
- 主机记录:riddle
- 记录类型:A
- 记录值:你的 CVM 公网 IP

---

## 🎯 第四部分:验证部署

### 4.1 功能测试

1. **访问游戏链接**
   ```
   https://riddle.yourdomain.com/index.html
   ```

2. **测试核心功能**
   - ✅ 开始界面正常显示
   - ✅ 难度选择功能正常
   - ✅ 答题功能正常
   - ✅ 提示功能正常
   - ✅ 计时器功能正常
   - ✅ 连击系统正常
   - ✅ 结算界面正常
   - ✅ 音效开关正常

3. **测试响应式**
   - ✅ 桌面端显示正常
   - ✅ 移动端显示正常
   - ✅ 平板端显示正常

### 4.2 性能测试

1. **页面加载速度**
   - 使用 Lighthouse 测试
   - 目标:首次加载 < 3s

2. **CDN 加速**
   - 检查 CDN 命中率
   - 目标:> 90%

---

## 📝 第五部分:项目交付

### 5.1 交付清单

根据 `DELIVERY_CHECKLIST.md` 确认:

- ✅ 代码已推送到工蜂
- ✅ 游戏已部署并可以访问
- ✅ 功能测试通过
- ✅ 响应式测试通过
- ✅ 性能测试通过
- ✅ 文档齐全(README.md, DEPLOYMENT_GUIDE.md, QUICKSTART.md)
- ✅ CI/CD 配置完成(如需要)

### 5.2 项目信息

- **项目名称**:万灵灯谜互动游戏
- **项目版本**:v2.0
- **工蜂仓库地址**:https://git.code.oa.com/yanhewang/wanling-riddle-game
- **游戏链接**:根据实际部署填写

### 5.3 维护说明

- **更新游戏内容**:
  ```bash
  # 修改代码后提交
  git add .
  git commit -m "更新游戏内容"
  git push origin main
  ```

- **自动部署**(如配置了 CI/CD):
  - 推送代码后自动触发部署
  - 或手动点击流水线运行

- **手动更新**(未配置 CI/CD):
  - 重新上传文件到 COS/CVM

---

## 🐛 常见问题

### Q1:推送代码时提示权限被拒绝?

**A**:
1. 检查是否配置了正确的远程仓库地址
2. 使用 Personal Access Token,不是登录密码
3. 确认你有该仓库的写入权限
4. 检查 Token 是否过期

### Q2:如何配置 HTTPS?

**A**:
1. 在腾讯云 SSL 证书服务申请免费证书
2. 在 CDN 或 Nginx 中配置证书
3. 开启强制 HTTPS

### Q3:CI/CD 部署失败?

**A**:
1. 检查环境变量配置是否正确
2. 查看 Pipeline 日志定位错误
3. 确认 COS 权限配置正确
4. 检查存储桶名称和地域

### Q4:如何更新游戏题目?

**A**:
1. 修改 `index.html` 中的 `riddles` 对象
2. 测试修改后的功能
3. 提交并推送代码
4. 触发自动部署或手动更新

### Q5:CDN 不生效?

**A**:
1. 检查域名解析是否正确
2. 确认 CDN 域名状态
3. 刷新 CDN 缓存
4. 检查 SSL 证书配置

---

## 📞 需要帮助?

如遇到问题,请参考:

- `DEPLOYMENT_GUIDE.md`:详细的部署指南
- `QUICKSTART.md`:快速开始指南
- `推送到工蜂.md`:工蜂推送详细步骤
- 工蜂文档:https://git.code.oa.com/help
- 腾讯云文档:https://cloud.tencent.com/document/product

---

## ✅ 总结

完成以上步骤后,您将拥有:

1. ✅ 代码已安全存储在工蜂代码仓库
2. ✅ 游戏已部署上线并可以访问
3. ✅ 配置了自动化部署流程(可选)
4. ✅ 完整的项目文档和交付清单

**祝部署顺利!** 🎉🏮
