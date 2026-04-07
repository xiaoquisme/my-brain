---
title: "Harness Design for Long-Running Application Development"
url: https://www.anthropic.com/engineering/harness-design-long-running-apps
date_added: 2026-04-07
type: article
tags: [harness-engineering, multi-agent, anthropic, claude, frontend-design]
author: Prithvi Rajasekaran (Anthropic Labs)
published: 2026-03-24
---

Anthropic 工程师的实践：通过多 agent harness 设计提升 Claude 在复杂长时间任务上的表现。核心思路：把生成器和评估器分离，类似 GAN 的对抗反馈循环。

## 两个核心问题

### 1. Context Management（上下文管理）
- 上下文窗口填满时模型性能下降
- Claude Sonnet 4.5 出现"context anxiety"——感知到上下文极限时提前结束工作
- Compaction（压缩）保持连续性，但 context reset（重置）提供更干净的状态

### 2. Self-Evaluation Bias（自我评估偏差）
- Agent 倾向于过度赞美自己的输出
- 将评估从生成中分离，比提高自我批评更可行
- 外部评估器可以通过迭代 prompt 调优来偏向怀疑

## 前端设计应用：GAN 式反馈循环

四个可评分标准：
1. **Design Quality**: 视觉一致性（颜色、排版、布局）
2. **Originality**: 避免模板默认值和可识别的 AI 模式
3. **Craft**: 技术执行（层次、间距、对比度）
4. **Functionality**: 可用性和任务完成度

迭代中后期有时会出现意外的创意转变——一个艺术博物馆网站从常规暗色主题演变为沉浸式 3D 空间体验。

## 全栈架构：三个专门 Agent

### Planner（规划者）
将 1-4 句 prompt 扩展为全面产品规范，包括 AI 功能机会

### Generator（生成者）
使用 React/Vite/FastAPI/PostgreSQL 迭代实现，带自我评估检查点

### Evaluator（评估者）
通过 Playwright 进行功能测试，对照协商的 sprint 合同验证，有硬性成功阈值

Agent 之间通过结构化文件通信，桥接高级规范和详细实现。

## 对比结果

### Retro Game Maker (Opus 4.5)
- 单独运行：20 分钟，$9 → 功能有限，核心玩法坏了
- 完整 harness：6 小时，$200 → 精致、功能丰富、玩法正常
- 20 倍成本，但用户体验质的飞跃

### DAW Project (Opus 4.6 V2)
- 3 小时 50 分钟，$124.70
- Agent 保持连续会话，自动上下文压缩
- 评估器捕获持续问题：时间线交互存根、缺失效果可视化、音频录制不完整

## 演进与简化

Opus 4.6 的能力提升 → harness 可以简化：
- 移除基于 sprint 的分解（模型能处理更长的连贯性）
- 合并评估器 pass（简单任务减少开销）
- Sprint 集中在仍处于能力边界的任务上

## 关键洞察

1. **Harness 假设需要压力测试** — 模型能力提升时，减少脚手架
2. **标准措辞影响输出** — "museum quality" 直接影响了设计方向
3. **评估器调优需要迭代** — 通过日志分析和 prompt 调优建立怀疑态度
4. **结构分离实现反馈循环** — 生成器-评估器动态优于自我改进
5. **持续实验** — 生产级任务 + 详细 trace 分析 + 方法论组件测试
