# 🐋 工蜂部署操作手册 - 万灵灯谜游戏

## 📋 部署流程总览

```
1. 在工蜂创建项目
   ↓
2. 获取 Personal Access Token
   ↓
3. 推送代码到工蜂
   ↓
4. 配置工蜂 Pages 或使用 COS+CDN
   ↓
5. 获取正式链接并测试
```

---

## 🎯 快速操作命令

**一键推送**(先完成步骤 1-2 后执行):

```bash
cd /Users/hehewang/WorkBuddy/20260316115522 && \
git remote add origin https://git.code.oa.com/yanhewang/wanling-riddle-game.git && \
git push -u origin main
```

---

## 📝 详细操作步骤

### 步骤 1:在工蜂创建项目

#### 1.1 访问工蜂
```
https://git.code.oa.com/
```

#### 1.2 创建新项目
1. 点击右上角 **"New Project"** 或 **"新建项目"**
2. 填写项目信息:
   - **Project name(项目名称)**: `wanling-riddle-game`
   - **Project description(项目描述)**: `万灵灯谜互动游戏 - 华丽东方幻想风格`
   - **Visibility Level(可见性)**:
     - 选择 `Internal`(内部可见,推荐)
     - 或 `Private`(私有)
3. 点击 **"Create project"** 或 **"创建项目"**

#### 1.3 复制仓库地址
创建成功后,会显示仓库地址,复制 HTTPS 地址:
```
https://git.code.oa.com/yanhewang/wanling-riddle-game.git
```

**保存这个地址,后面会用到!**

---

### 步骤 2:获取 Personal Access Token

#### 2.1 为什么需要 Token?
工蜂不再支持使用登录密码进行 Git 操作,必须使用 Personal Access Token 进行身份验证。

#### 2.2 生成 Token 步骤:

1. **访问个人设置**
   - 登录工蜂后,点击右上角头像
   - 选择 **"Settings"** 或 **"设置"**

2. **进入访问令牌页面**
   - 左侧菜单选择 **"Access Tokens"** 或 **"访问令牌"**

3. **创建新令牌**
   - 点击 **"Add new token"** 或 **"添加新令牌"**

4. **配置令牌**
   - **Token name(令牌名称)**: `wanling-riddle-game-deploy`
   - **Expiration date(过期日期)**: 选择合适的时间(如 `1 year`)
   - **Scopes(权限范围)**: 勾选以下权限:
     - ✅ `read_repository`(读取仓库)
     - ✅ `write_repository`(写入仓库)
   - 点击 **"Create personal access token"** 或 **"创建令牌"**

5. **复制令牌**
   - 令牌**只显示一次**,请立即复制
   - 格式类似: `glpat-xxxxxxxxxxxxxxxxxxxx`
   - **妥善保存,不要泄露!**

**保存这个 Token,后面推送时会用到!**

---

### 步骤 3:推送代码到工蜂

#### 3.1 配置远程仓库

在终端执行:

```bash
# 进入项目目录
cd /Users/hehewang/WorkBuddy/20260316115522

# 添加远程仓库(替换为您复制的实际地址)
git remote add origin https://git.code.oa.com/yanhewang/wanling-riddle-game.git

# 验证远程仓库配置
git remote -v
```

**预期输出:**
```
origin	https://git.code.oa.com/yanhewang/wanling-riddle-game.git (fetch)
origin	https://git.code.oa.com/yanhewang/wanling-riddle-game.git (push)
```

#### 3.2 推送代码

```bash
# 推送代码到远程仓库
git push -u origin main
```

#### 3.3 身份验证

推送时会提示输入用户名和密码:

```
Username for 'https://git.code.oa.com/yanhewang': yanhewang
Password for 'https://yanhewang@git.code.oa.com/yanhewang': [粘贴Personal Access Token]
```

**重要提示:**
- **Username**: 输入您的工蜂账号 `yanhewang`
- **Password**: 粘贴刚才生成的 **Personal Access Token**(不是登录密码!)
- 输入密码时**不会显示任何字符**,直接粘贴并回车

#### 3.4 验证推送成功

推送成功后会看到类似输出:

```
Enumerating objects: 30, done.
Counting objects: 100% (30/30), done.
Delta compression using up to 8 threads
Compressing objects: 100% (25/25), done.
Writing objects: 100% (30/30), 30.50 KiB | 3.62 MiB/s, done.
Total 30 (delta 10), reused 0 (delta 0)
To https://git.code.oa.com/yanhewang/wanling-riddle-game.git
 * [new branch]      main -> main
```

#### 3.5 在工蜂确认

1. 访问工蜂项目页面:
   ```
   https://git.code.oa.com/yanhewang/wanling-riddle-game
   ```

2. 确认以下内容:
   - ✅ 查看 "Repository" → "Files" 确认文件列表
   - ✅ 查看 "Commits" 确认提交历史
   - ✅ 确认 `index.html` 文件已上传

---

### 步骤 4:部署上线(选择一种方案)

#### 方案 A:使用工蜂 Pages(推荐,最简单)

**适用场景**: 快速部署静态网站,无需额外配置

##### 4A.1 开启工蜂 Pages

1. 在工蜂项目页面
2. 点击左侧菜单 **"Deployments"** → **"Pages"**
3. 如果是首次使用,点击 **"Get started"**
4. 选择项目:`wanling-riddle-game`
5. 选择分支:`main`
6. 构建命令:留空(因为纯静态文件)
7. 输出目录:`.` (当前目录)
8. 点击 **"Save"** 或 **"Create"**

##### 4A.2 等待部署

- 工蜂会自动构建和部署
- 通常需要 1-2 分钟
- 部署状态会显示为 "Running" → "Success"

##### 4A.3 获取访问链接

部署成功后,工蜂 Pages 会提供:
```
https://yanhewang.gitlab.io/wanling-riddle-game
```

**这就是您的正式游戏链接!** 🎉

---

#### 方案 B:使用腾讯云 COS + CDN(推荐,稳定)

**适用场景**: 生产环境,需要稳定性和性能

##### 4B.1 创建 COS 存储桶

1. 登录腾讯云控制台:
   ```
   https://console.cloud.tencent.com/cos
   ```

2. 创建存储桶:
   - 点击 **"创建存储桶"**
   - 名称:`wanling-riddle-game`(全局唯一)
   - 所属地域:选择最近的地域(如:`广州`)
   - 访问权限:**私有读写**(稍后配置静态网站)

##### 4B.2 配置静态网站

1. 进入存储桶 → **"基础配置"** → **"静态网站"**
2. 点击 **"编辑"**
3. 开启静态网站
4. 索引文档:`index.html`
5. 错误文档:`index.html`
6. 点击 **"保存"**

##### 4B.3 上传文件

**方法一:通过工蜂 CI/CD 自动上传** (推荐)

1. 在项目根目录创建 `.gitlab-ci.yml`:
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
         - coscmd upload README.md /README.md -e
         - echo "部署到 COS 成功"
       when: manual
   ```

2. 在工蜂项目设置添加 CI/CD 变量:
   - `COS_SECRET_ID`: 腾讯云 API Secret ID
   - `COS_SECRET_KEY`: 腾讯云 API Secret Key
   - `COS_BUCKET`: 存储桶名称(如:`wanling-riddle-game-1234567890`)
   - `COS_REGION`: 存储桶地域(如:`ap-guangzhou`)

3. 提交配置文件并推送:
   ```bash
   git add .gitlab-ci.yml
   git commit -m "添加工蜂 CI/CD 配置"
   git push origin main
   ```

4. 在工蜂手动触发部署:
   - 进入 CI/CD → Pipelines
   - 点击最新流水线的 Play 按钮

**方法二:手动上传**

1. 在 COS 控制台进入存储桶
2. 点击 **"文件管理"** → **"上传文件"**
3. 选择 `index.html` 文件上传
4. 等待上传完成

##### 4B.4 配置 CDN 加速

1. 进入 CDN 控制台:
   ```
   https://console.cloud.tencent.com/cdn
   ```

2. 添加域名:
   - 点击 **"添加域名"**
   - 源站类型:**COS 源**
   - 源站地址:选择你的 COS 存储桶
   - 加速域名:填写您的域名(如:`riddle.yourdomain.com`)
   - 点击 **"提交"**

3. 配置 HTTPS:
   - 在域名管理中点击 **"配置"**
   - 添加 SSL 证书(可使用腾讯云免费证书)
   - 开启强制 HTTPS

4. CNAME 配置:
   - 复制 CDN 提供的 CNAME 记录
   - 在域名管理后台添加 CNAME 解析

##### 4B.5 访问游戏

```
https://riddle.yourdomain.com/index.html
```

---

#### 方案 C:使用工蜂 CI/CD + 对外服务器

**适用场景**: 需要部署到公司内部服务器

##### 4C.1 配置工蜂 CI/CD

1. 创建 `.gitlab-ci.yml`:
   ```yaml
   stages:
     - deploy

   deploy_to_server:
       stage: deploy
       image: alpine:latest
       only:
         - main
       script:
         - apk add --no-cache openssh-client
         - eval $(ssh-agent -s)
         - echo "$SSH_PRIVATE_KEY" | tr -d '\r' | ssh-add -
         - mkdir -p ~/.ssh
         - chmod 700 ~/.ssh
         - ssh-keyscan your-server.com >> ~/.ssh/known_hosts
         - chmod 644 ~/.ssh/known_hosts
         - scp index.html user@your-server.com:/var/www/wanling-riddle/
         - echo "部署到服务器成功"
       when: manual
   ```

2. 在工蜂添加 CI/CD 变量:
   - `SSH_PRIVATE_KEY`: 服务器的 SSH 私钥
   - `SSH_HOST`: 服务器地址
   - `SSH_USER`: 服务器用户名

3. 手动触发部署

---

### 步骤 5:测试验证

#### 5.1 访问游戏

使用获得的访问链接:
- 工蜂 Pages: `https://yanhewang.gitlab.io/wanling-riddle-game`
- COS+CDN: `https://riddle.yourdomain.com/index.html`

#### 5.2 功能测试

- ✅ 开始界面正常显示
- ✅ 难度选择功能正常
- ✅ 答题功能正常
- ✅ 提示功能正常
- ✅ 计时器功能正常
- ✅ 连击系统正常
- ✅ 结算界面正常
- ✅ 音效开关正常

#### 5.3 兼容性测试

- ✅ 桌面端显示正常
- ✅ 移动端显示正常
- ✅ 平板端显示正常

---

## 🆘 常见问题

### Q1: 推送时提示 "Permission denied" 或 "Authentication failed"

**解决方案:**
1. 确认用户名正确(工蜂账号)
2. 确认使用 Personal Access Token,不是登录密码
3. 检查 Token 权限是否包含 `write_repository`
4. 如果 Token 过期,重新生成新的 Token

### Q2: 推送时提示 "remote origin already exists"

**解决方案:**
```bash
# 查看当前远程仓库
git remote -v

# 如果地址不对,先删除再添加
git remote remove origin

# 重新添加正确的地址
git remote add origin https://git.code.oa.com/yanhewang/wanling-riddle-game.git
```

### Q3: 工蜂 Pages 部署失败

**解决方案:**
1. 检查项目是否启用了 Pages 功能
2. 确认输出目录配置正确(应为 `.`)
3. 查看构建日志定位错误
4. 确保 `index.html` 文件存在

### Q4: COS 上传失败

**解决方案:**
1. 检查 Secret ID 和 Secret Key 是否正确
2. 确认存储桶名称和地域是否正确
3. 检查存储桶权限配置
4. 查看错误日志定位问题

### Q5: 如何更新游戏内容?

**解决方案:**
```bash
# 修改代码
# 测试功能
git add .
git commit -m "更新游戏内容"
git push origin main

# 如果配置了 CI/CD,自动部署
# 或手动上传文件到 COS/服务器
```

---

## 📊 部署方案对比

| 方案 | 优势 | 劣势 | 适用场景 | 时间 |
|------|------|------|----------|------|
| 工蜂 Pages | 简单、免费、自动 | 可能不够稳定 | 快速部署、测试 | 5 分钟 |
| COS+CDN | 稳定、快速、安全 | 需要配置 | 生产环境 | 30 分钟 |
| 服务器 | 灵活、可控 | 需要维护 | 内部部署 | 20 分钟 |

---

## ✅ 检查清单

### 推送前
- [ ] 已在工蜂创建项目
- [ ] 已获取 Personal Access Token
- [ ] 仓库地址确认无误
- [ ] 代码已本地提交

### 推送后
- [ ] 工蜂项目页面显示正常
- [ ] 文件列表完整
- [ ] 提交历史正确

### 部署后
- [ ] 游戏可以正常访问
- [ ] 所有功能测试通过
- [ ] 响应式显示正常
- [ ] HTTPS 配置完成

---

## 🎯 预期结果

完成部署后,您将拥有:

### 工蜂仓库
```
https://git.code.oa.com/yanhewang/wanling-riddle-game
```

### 在线游戏链接(根据选择的方案)
```
工蜂 Pages: https://yanhewang.gitlab.io/wanling-riddle-game
COS+CDN: https://riddle.yourdomain.com/index.html
```

### 自动化部署流程
```
代码推送 → 自动部署 → 在线访问
```

---

## 📞 需要帮助?

- **推送问题**: 查看步骤 3 的详细说明
- **部署问题**: 参考选择的部署方案
- **工蜂文档**: https://git.code.oa.com/help
- **腾讯云文档**: https://cloud.tencent.com/document/product

---

**祝部署顺利!** 🎉🐋🏮
