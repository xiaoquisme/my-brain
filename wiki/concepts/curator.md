---
title: Curator
created: 2026-05-20
updated: 2026-05-20
type: concept
tags: [skills, agent, swe-tool, knowledge-management, hermes-agent]
sources: [sources/articles/hermes-agent-curator.md]
confidence: high
---

## Summary

Curator 是 Hermes Agent 的后台维护系统，负责管理 agent 创建的 skills。它追踪每个 skill 的查看、使用和修补频率，将长期未使用的 skill 通过 `active → stale → archived` 状态流转，并定期触发 LLM 审查以提出合并或修补建议。

## Key Points

### 核心机制

- **触发方式**: 非 cron，而是基于活动检查。CLI session 启动时和 gateway cron-ticker 线程中检查
- **两个条件同时满足**: 距上次运行超过 `interval_hours`（默认 7 天）+ agent 空闲超过 `min_idle_hours`（默认 2 小时）
- **运行方式**: 后台 fork AIAgent，在独立 prompt cache 中运行，不影响当前对话

### 两阶段处理

1. **自动状态转换**（确定性，无 LLM）
   - 30 天未使用 → `stale`
   - 90 天未使用 → 归档到 `~/.hermes/skills/.archive/`
2. **LLM 审查**（单次 aux-model pass，`max_iterations=8`）
   - 调查 agent 创建的 skills
   - 决定保留、修补、合并或归档

### 保护机制

- **Pinning**: `hermes curator pin <skill>` 保护 skill 不被删除
  - Curator 跳过 auto-transitions
  - agent 的 `skill_manage` 工具拒绝 `delete` 操作
  - 存储在 `~/.hermes/skills/.usage.json` 中的 `"pinned": true`
- **备份**: 每次运行前自动快照 `~/.hermes/skills/` 到 `.curator_backups/`
- **回滚**: `hermes curator rollback` 可撤销整个运行

### 使用遥测

`~/.hermes/skills/.usage.json` 记录每个 skill 的：
- `use_count` / `view_count` / `patch_count`
- `last_used_at` / `last_viewed_at` / `last_patched_at`
- `state`: active / stale / archived
- `pinned`: boolean

### Agent 创建的定义

Skill 被视为 agent 创建当且**不在**：
- `~/.hermes/skills/.bundled_manifest`
- `~/.hermes/skills/.hub/lock.json`

> **Warning**: 手写 skill 和 agent 自动保存的 skill 无法区分，都在 "agent-created" 桶中。

### 配置

```yaml
curator:
  enabled: true
  interval_hours: 168  # 7 days
  min_idle_hours: 2
  stale_after_days: 30
  archive_after_days: 90
  backup:
    enabled: true
    keep: 5
```

### CLI 命令

- `hermes curator status` — 查看状态
- `hermes curator run [--dry-run|--background]` — 触发审查
- `hermes curator pin/unpin <skill>` — 保护/取消保护
- `hermes curator restore <skill>` — 恢复归档的 skill
- `hermes curator pause/resume` — 暂停/恢复
- `hermes curator backup/rollback` — 备份/回滚

## Open Questions

- Curator 与 Memory review 的协作机制是什么？两者都运行 LLM 审查，如何避免冲突？
- 在大型 skill 库（100+）中，LLM 审查的效率如何？是否需要分批处理？

## Related Concepts

- [[skill-file]] — Curator 管理的核心对象
- [[harness-engineering]] — Curator 是 harness 层的一部分
- [[thin-harness-fat-skills]] — Curator 维护 "fat skills" 的质量
- [[skillify]] — 将失败转化为永久修复，Curator 确保这些修复不被遗忘
- [[agent-context-management]] — Curator 通过减少 skill 噪音优化上下文
