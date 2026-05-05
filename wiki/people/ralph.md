---
title: Ralph (AI Agent Loop)
created: 2026-05-02
updated: 2026-05-02
type: entity
tags: [agent, swe-tool, code-gen]
sources: [../../sources/articles/snarktank-ralph-github-2026.md, ../../sources/articles/snarktank-ralph-ralph-sh-2026.md]
confidence: high
---

# Ralph

Ralph 是一个**自主 AI 编码 Agent 循环**——反复调用 AI 编码工具（Amp 或 Claude Code），每轮迭代用全新实例，直到 PRD 中所有用户故事完成。灵感来自 [[geoffrey-huntley]] 提出的 [Ralph 模式](https://ghuntley.com/ralph/)。

仓库：https://github.com/snarktank/ralph ｜ 许可：MIT ｜ 作者：[[ryan-carson]]

## 工作原理

Ralph 的核心是一个 113 行的 bash 脚本 `ralph.sh`：

1. **读取 PRD** — `prd.json` 定义项目名、分支名、用户故事列表（含 ID、标题、描述、验收标准、优先级、passes 状态）
2. **循环迭代** — 默认最多 10 轮，每轮：
   - 将 `prompt.md`（Amp）或 `CLAUDE.md`（Claude Code）作为系统指令喂给 AI
   - AI 实现最高优先级的未完成故事
   - 质量检查（typecheck / lint / test）通过后 commit，更新 `prd.json`（passes: true）
   - 写入 `progress.txt` 追加日志（含 learnings 供后续迭代复用）
3. **完成信号** — AI 输出 `<promise>COMPLETE</promise>` 时终止循环
4. **记忆机制** — 无持久 context，依赖 git 历史 + `progress.txt`（模式发现/学习记录）+ `prd.json`（进度状态）

## PRD 格式示例

```json
{
  "project": "MyApp",
  "branchName": "ralph/task-priority",
  "description": "Task Priority System",
  "userStories": [
    {
      "id": "US-001",
      "title": "Add priority field",
      "acceptanceCriteria": ["Add priority column", "Typecheck passes"],
      "priority": 1,
      "passes": false
    }
  ]
}
```

## 设计特征

| 特征 | 说明 |
|------|------|
| **迭代隔离** | 每轮都是全新 AI 实例，无 context 累积 |
| **记忆外化** | 所有状态存于文件系统（git + progress.txt + prd.json） |
| **故事粒度** | 要求一个故事在一个 context window 内可完成 |
| **模式沉淀** | `progress.txt` 的 "Codebase Patterns" 区积累可复用知识 |
| **分支归档** | 切换分支时自动归档上一轮的 prd.json 和 progress.txt |

## 相关页面

- [[geoffrey-huntley]] — Ralph 模式的原始提出者
- [[ryan-carson]] — Ralph 仓库的作者和维护者
- [[agent-loop-pattern]] — Ralph 体现的 Agent 循环迭代模式
- [[agent-context-management]] — 每轮清空 context 的设计选择
- [[coding-agents]] — 更广泛的 AI 编码 Agent 概念
- [[codebase-qna]]
