#!/bin/bash

# GitHub + Vercel 部署脚本
# 使用方法: ./github-vercel-deploy.sh

echo "========================================="
echo "  GitHub + Vercel 部署助手"
echo "========================================="
echo ""

# 当前目录
PROJECT_DIR="/Users/hehewang/WorkBuddy/20260316115522"
cd "$PROJECT_DIR"

# 步骤 1:检查 Git 状态
echo "📋 步骤 1:检查项目状态..."
echo ""
git status
echo ""

# 步骤 2:查看远程仓库
echo "📋 步骤 2:查看远程仓库配置..."
echo ""
git remote -v
echo ""

# 步骤 3:查看最近的提交
echo "📋 步骤 3:查看最近的提交..."
echo ""
git log --oneline -5
echo ""

echo "========================================="
echo "  接下来需要您手动操作:"
echo "========================================="
echo ""
echo "✅ 已完成:"
echo "  - 代码已提交到本地 Git 仓库"
echo "  - GitHub 远程仓库已配置"
echo ""
echo "⏳ 待操作:"
echo ""
echo "  1. 创建 GitHub 仓库:"
echo "     https://github.com/new"
echo "     - 仓库名: wanling-riddle-game"
echo "     - 选择: Public"
echo ""
echo "  2. 推送代码到 GitHub:"
echo "     cd $PROJECT_DIR"
echo "     git push -u github master"
echo ""
echo "     💡 身份验证:"
echo "        Username: yanhewang"
echo "        Password: 使用 Personal Access Token"
echo "        (在 https://github.com/settings/tokens 生成)"
echo ""
echo "  3. 在 Vercel 导入项目:"
echo "     https://vercel.com/new"
echo "     - 点击 Continue with GitHub"
echo "     - 选择 wanling-riddle-game 仓库"
echo "     - 点击 Import → Deploy"
echo ""
echo "  4. 部署成功后访问:"
echo "     https://wanling-riddle-game.vercel.app"
echo ""
echo "========================================="
echo "  详细操作指南请查看:"
echo "========================================="
echo ""
echo "  📖 GITHUB_VERCEL_DEPLOY_GUIDE.md"
echo ""
echo "========================================="
