---
title: "设计数据密集型应用（第二版）"
created: 2026-04-20
updated: 2026-04-20
tags: [distributed-systems, databases, system-design, storage-engines, consensus, transactions, stream-processing]
sources:
  - ../../sources/books/ddia-preface.md
  - ../../sources/books/ddia-ch01.md
  - ../../sources/books/ddia-ch02.md
  - ../../sources/books/ddia-ch03.md
  - ../../sources/books/ddia-ch04.md
  - ../../sources/books/ddia-ch05.md
  - ../../sources/books/ddia-ch06.md
  - ../../sources/books/ddia-ch07.md
  - ../../sources/books/ddia-ch08.md
  - ../../sources/books/ddia-ch09.md
  - ../../sources/books/ddia-ch10.md
  - ../../sources/books/ddia-ch11.md
  - ../../sources/books/ddia-ch12.md
  - ../../sources/books/ddia-ch13.md
  - ../../sources/books/ddia-ch14.md
related:
  - ../people/martin-kleppmann.md
---

## Summary

《设计数据密集型应用》（DDIA）第二版由 Martin Kleppmann 著，冯若航（Vonng）译。全书分三部分共14章，系统讲解现代数据系统的设计原则与权衡取舍——从单机存储引擎到分布式事务，再到流式数据处理与系统伦理。核心主题是：没有银弹，只有在具体约束下的最优权衡。

## 结构总览

### 第一部分：数据系统基础（第1-5章）

**第1章：数据系统架构中的权衡**
- 核心思想：任何架构决策都是权衡，没有完美方案
- 分析型 vs 事务型系统（OLAP vs OLTP）
- 云服务 vs 自托管；分布式 vs 单节点
- 数据系统需满足法律与社会约束

**第2章：定义非功能性需求**
- 可靠性（Reliability）：硬件故障、软件故障、人为错误的容错
- 可伸缩性（Scalability）：负载描述（QPS、读写比、并发连接数）；性能描述（吞吐量、响应时间百分位数 p50/p95/p99）
- 可维护性（Maintainability）：可操作性、简单性、可演化性
- 关键洞察：p99.9 延迟对高价值用户影响最大；尾延迟放大效应（fan-out 请求取最慢节点）

**第3章：数据模型与查询语言**
- 关系模型：SQL，表连接，声明式查询
- 文档模型：JSON/XML，局部性好，弱连接，模式灵活
- 图模型：顶点+边，适合多跳关系（社交网络、欺诈检测）
- 查询语言：SQL（声明式）、MapReduce（函数式）、Cypher/SPARQL（图）、Datalog
- 模式灵活性：写时模式（关系型）vs 读时模式（文档型/无模式）

**第4章：存储与检索**
- 日志结构存储：Append-only，LSM-Tree（MemTable + SSTable），适合写密集
  - 优化：布隆过滤器（减少无效读）、压缩策略（tiered/leveled）
- B-Tree：原地更新，WAL 保证持久性，适合读密集
- 列式存储（Column Store）：分析查询的压缩与向量化执行优势
- 索引类型：哈希索引、稀疏索引、多列索引、全文索引
- OLAP vs OLTP 存储引擎的本质区别

**第5章：编码与演化**
- 数据编码格式：JSON/XML（人类可读，冗余大）、Thrift/Protocol Buffers（二进制，schema evolution 友好）、Avro（schema registry，最紧凑）
- 模式演化规则：前向兼容（新代码读旧数据）、后向兼容（旧代码读新数据）
- 数据流模式：数据库、REST/RPC 服务、消息队列（异步）
- 滚动升级时的兼容性保证策略

### 第二部分：分布式数据（第6-10章）

**第6章：复制**
- 单主复制（Single-Leader）：写入路由主节点，读取可走从节点；复制滞后问题
  - 一致性保证：读己所写（Read-your-writes）、单调读（Monotonic reads）、一致前缀读
- 多主复制（Multi-Leader）：数据中心级别的写入并行；写冲突解决（LWW、CRDT、手动合并）
- 无主复制（Leaderless/Dynamo 风格）：法定人数读写（Quorum：w + r > n）；反熵、读修复
- 复制日志：基于语句、基于 WAL、基于行的逻辑日志

**第7章：分片（分区）**
- 分片策略：范围分区（Range）、哈希分区（Hash）、一致性哈希
- 热点问题：高度偏斜的键（如名人用户）需二级随机化
- 分区再平衡：固定分区数、动态分区、按节点比例分区
- 请求路由：客户端感知、路由层（ZooKeeper）、节点转发

**第8章：事务**
- ACID 语义：原子性（Atomicity）、一致性（Consistency）、隔离性（Isolation）、持久性（Durability）
- 隔离级别（从弱到强）：
  - 读未提交（Read Uncommitted）
  - 读已提交（Read Committed）：防脏读/脏写
  - 快照隔离（Snapshot Isolation / MVCC）：防不可重复读
  - 可串行化（Serializability）：防所有竞态条件
- 实际可串行化实现：两阶段锁（2PL）、串行执行（单线程如 VoltDB/Redis）、SSI（乐观并发控制）
- 写偏斜（Write Skew）和幻读（Phantom）：需谓词锁或 SSI 解决

**第9章：分布式系统的麻烦**
- 部分失败（Partial Failure）是分布式系统的本质
- 不可靠网络：数据包丢失、延迟不确定、无法区分节点宕机与网络分区
- 不可靠时钟：NTP 漂移；不应用挂钟比较因果顺序
- 真相由多数决定：不能相信单节点的自我判断，需要法定人数
- 拜占庭容错：假设节点可能撒谎（通常只在区块链/航空系统中考虑）

**第10章：一致性与共识**
- 一致性保证谱系：最终一致性 → 因果一致性 → 顺序一致性 → 线性一致性
- 线性一致性（Linearizability）：系统表现得像只有一份数据，所有操作原子生效；CAP 定理中的 C
- 因果一致性（Causal Consistency）：保序因果关系，比线性一致性开销小，可跨分区
- 全序广播（Total Order Broadcast）：所有节点以相同顺序收到消息；等价于共识
- 共识算法：Paxos、Raft（更易理解）；用于 Leader 选举、分布式锁、原子提交（2PC）
- FLP 不可能定理：异步系统中无法同时保证安全性和活性

### 第三部分：派生数据（第11-14章）

**第11章：批处理**
- Unix 哲学：小工具组合、stdin/stdout、不可变输入
- MapReduce：Map（过滤/映射）→ Shuffle（按键分组）→ Reduce（聚合）
- 批处理用途：搜索索引构建、机器学习特征工程、ETL、数据仓库
- 新一代批处理框架：Spark（内存计算）、Flink（统一批流）、Beam
- 关键特性：幂等性（可重跑）、输出与输入解耦（派生数据）

**第12章：流处理**
- 流 vs 批：流处理无界输入，低延迟；批处理有界输入，高吞吐
- 消息代理类型：AMQP/JMS（传统，消费后删除）vs 日志型（Kafka，持久化，可回放）
- 流处理语义：
  - 事件时间 vs 处理时间：乱序数据处理，水位线（Watermark）
  - 窗口类型：滚动窗口、滑动窗口、会话窗口
- 流-流 Join、流-表 Join（数据库 CDC 物化）
- 容错：微批（Spark Streaming）vs 检查点（Flink）；精确一次语义（Exactly-once）

**第13章：流式系统的哲学**
- Lambda 架构（批处理 + 流处理并行）的局限：维护两套代码
- Kappa 架构：一切皆流，批处理是流处理的特例
- 数据库与流的统一视角：变更数据捕获（CDC）= 将数据库变为事件日志
- 事件溯源（Event Sourcing）：以不可变事件为核心，当前状态是事件的物化视图
- 松耦合系统：通过日志（Kafka）连接，消费者独立演化
- 端到端精确一次（End-to-End Exactly-Once）：幂等写入 + 事务性发布

**第14章：将事情做正确**
- 伦理责任：工程师对系统后果负责，不能以"只是执行命令"为借口
- 数据隐私：数据收集目的限制、最小化原则、匿名化的局限性
- 监控与可观测性：系统的"道德"运行
- 大数据与权力不对称：数据集中带来的歧视性算法风险
- 系统设计的价值观嵌入：架构选择本身就是价值判断

## 核心概念索引

| 概念 | 章节 | 一句话说明 |
|------|------|------------|
| OLTP vs OLAP | Ch1, Ch4 | 事务型 vs 分析型，决定存储引擎选择 |
| SLO/SLA | Ch2 | 服务等级目标，用百分位延迟定义 |
| LSM-Tree vs B-Tree | Ch4 | 写优化 vs 读优化，LSM 写放大小，B-Tree 读放大小 |
| 列式存储 | Ch4 | 分析查询压缩比高，向量化执行快 |
| Protobuf/Avro | Ch5 | 二进制序列化，支持模式演化 |
| 单主/多主/无主复制 | Ch6 | 可用性与一致性的三角权衡 |
| 法定人数 Quorum | Ch6 | w+r>n 保证读到最新值 |
| 哈希分片 vs 范围分片 | Ch7 | 均匀分布 vs 范围查询友好 |
| MVCC | Ch8 | 多版本并发控制，实现快照隔离 |
| SSI | Ch8 | 串行化快照隔离，乐观并发控制 |
| 2PL | Ch8 | 两阶段锁，悲观并发控制 |
| 写偏斜 / 幻读 | Ch8 | 快照隔离无法防止的竞态条件 |
| 线性一致性 | Ch10 | 最强一致性保证，牺牲可用性 |
| 因果一致性 | Ch10 | 保序因果关系，比线性一致性弱但更高效 |
| Raft/Paxos | Ch10 | 共识算法，用于 Leader 选举和全序广播 |
| 2PC | Ch10 | 两阶段提交，分布式原子事务 |
| MapReduce | Ch11 | 批处理编程模型，无状态 Map + 聚合 Reduce |
| Kafka | Ch12 | 持久化日志型消息队列，支持回放 |
| 水位线 Watermark | Ch12 | 流处理中处理乱序事件的机制 |
| CDC | Ch13 | 变更数据捕获，将数据库变为事件流 |
| 事件溯源 | Ch13 | 不可变事件日志为核心，状态是派生 |

## Open Questions

- DDIA 第二版新增了哪些第一版没有的内容？（第2章非功能性需求框架是新的，第13/14章是全新章节）
- SSI（串行化快照隔离）在实际系统中（PostgreSQL、CockroachDB）的实现细节？
- Raft 与 Paxos 在实际工程权衡上的异同？

---
## Evidence Timeline

- **2026-04-20**: 完整抓取 DDIA 第二版中文译本（ddia.vonng.com）15个章节，共 577,730 字符。保存为 sources/books/ddia-*.md。创建本综合 wiki 页。
