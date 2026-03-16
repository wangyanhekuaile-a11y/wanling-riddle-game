#!/bin/bash

# 万灵灯谜游戏 - 工蜂代码推送脚本
# 使用说明:请先在工蜂平台创建项目,然后替换下面的仓库地址

echo "========================================"
echo "  万灵灯谜游戏 - 工蜂代码推送工具"
echo "========================================"
echo ""

# 工蜂仓库地址(请替换为您的实际地址)
REPO_URL="https://git.code.oa.com/yanhewang/wanling-riddle-game.git"

# 检查是否已配置远程仓库
if git remote | grep -q "origin"; then
    echo "✓ 已配置远程仓库"
    git remote -v
    echo ""
else
    echo "正在添加远程仓库..."
    git remote add origin "$REPO_URL"
    echo "✓ 远程仓库已添加: $REPO_URL"
    echo ""
fi

# 推送代码
echo "正在推送代码到工蜂..."
echo "----------------------------------------"
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================"
    echo "✓ 代码推送成功!"
    echo "========================================"
    echo ""
    echo "📦 项目信息:"
    echo "  - 项目名称:万灵灯谜互动游戏"
    echo "  - 版本:v2.0"
    echo "  - 仓库地址:$REPO_URL"
    echo ""
    echo "🚀 下一步操作:"
    echo "  1. 访问工蜂项目页面查看代码"
    echo "  2. 按照 DEPLOYMENT_GUIDE.md 进行部署"
    echo "  3. 配置 CI/CD 流水线(可选)"
    echo ""
else
    echo ""
    echo "========================================"
    echo "✗ 推送失败"
    echo "========================================"
    echo ""
    echo "💡 可能的原因:"
    echo "  1. 仓库地址不正确"
    echo "  2. 身份验证失败(需要 Personal Access Token)"
    echo "  3. 网络连接问题"
    echo ""
    echo "📖 解决方案:"
    echo "  1. 检查并修改脚本中的 REPO_URL"
    echo "  2. 参考 '推送到工蜂.md' 获取 Personal Access Token"
    echo "  3. 确保网络连接正常"
    echo ""
fi
