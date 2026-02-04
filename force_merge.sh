#!/bin/bash
# 自动识别欧盟分支并强行合并逻辑
set -e

# 1. 自动识别本地包含 'eu' 关键字的分支
BRANCH_A=$(git branch | grep 'eu' | sed -n '1p' | xargs)
BRANCH_B=$(git branch | grep 'eu' | sed -n '2p' | xargs)

echo "识别到分支: $BRANCH_A 和 $BRANCH_B"

# 2. 硬刻强制合并（忽略冲突，以欧盟代码为准）
git checkout main
git merge $BRANCH_A --allow-unrelated-histories -X theirs --no-edit
git merge $BRANCH_B --allow-unrelated-histories -X theirs --no-edit

# 3. 提交并推送到云端节点
git push origin main
