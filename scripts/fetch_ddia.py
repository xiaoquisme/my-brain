#!/usr/bin/env python3
"""
Fetch all chapters of DDIA 2nd edition (Chinese) from ddia.vonng.com
and save as source files in ~/personal/my-brain/sources/books/
"""

import os
import time
import urllib.request
from bs4 import BeautifulSoup
from datetime import date

BASE_URL = "https://ddia.vonng.com"
OUT_DIR = os.path.expanduser("~/personal/my-brain/sources/books")
os.makedirs(OUT_DIR, exist_ok=True)

TODAY = date.today().isoformat()

CHAPTERS = [
    ("preface",  "/preface/",  "序言",                   0),
    ("ch01",     "/ch1/",      "数据系统架构中的权衡",    1),
    ("ch02",     "/ch2/",      "定义非功能性需求",        2),
    ("ch03",     "/ch3/",      "数据模型与查询语言",      3),
    ("ch04",     "/ch4/",      "存储与检索",              4),
    ("ch05",     "/ch5/",      "编码与演化",              5),
    ("ch06",     "/ch6/",      "复制",                    6),
    ("ch07",     "/ch7/",      "分片",                    7),
    ("ch08",     "/ch8/",      "事务",                    8),
    ("ch09",     "/ch9/",      "分布式系统的麻烦",        9),
    ("ch10",     "/ch10/",     "一致性与共识",           10),
    ("ch11",     "/ch11/",     "批处理",                 11),
    ("ch12",     "/ch12/",     "流处理",                 12),
    ("ch13",     "/ch13/",     "流式系统的哲学",         13),
    ("ch14",     "/ch14/",     "将事情做正确",           14),
]

HEADERS = {
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36",
    "Accept": "text/html,application/xhtml+xml",
    "Accept-Language": "zh-CN,zh;q=0.9",
}

def fetch_chapter(slug, path, title, chapter_num):
    url = BASE_URL + path
    req = urllib.request.Request(url, headers=HEADERS)
    with urllib.request.urlopen(req, timeout=30) as resp:
        html = resp.read().decode("utf-8")

    soup = BeautifulSoup(html, "html.parser")

    # Extract main article content
    article = soup.find("article") or soup.find("main") or soup.find("div", class_="content")
    if not article:
        print(f"  WARNING: no <article> found for {slug}, using body")
        article = soup.find("body")

    # Remove nav, footer, script, style elements
    for tag in article.find_all(["nav", "footer", "script", "style", "button", "svg"]):
        tag.decompose()

    # Convert to clean text - preserve structure
    text = article.get_text(separator="\n", strip=True)

    # Build frontmatter
    if chapter_num == 0:
        ch_title = title
        tags = "distributed-systems, databases, system-design"
    else:
        ch_title = f"第{chapter_num}章：{title}"
        tags = "distributed-systems, databases, system-design"

    frontmatter = f"""---
title: "DDIA 第二版 - {ch_title}"
url: {url}
date_added: {TODAY}
author: Martin Kleppmann (译：冯若航 Vonng)
type: book
book: "设计数据密集型应用（第二版）"
chapter: {chapter_num}
tags: [distributed-systems, databases, system-design]
---

"""

    out_path = os.path.join(OUT_DIR, f"ddia-{slug}.md")
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(frontmatter + text)

    word_count = len(text)
    print(f"  [OK] {slug}: {word_count} chars -> {out_path}")
    return word_count

print("=== Fetching DDIA 2nd Edition ===")
print(f"Output dir: {OUT_DIR}\n")

total_chars = 0
failed = []

for slug, path, title, num in CHAPTERS:
    print(f"Fetching {slug} ({path})...")
    try:
        chars = fetch_chapter(slug, path, title, num)
        total_chars += chars
        time.sleep(0.5)  # polite delay
    except Exception as e:
        print(f"  [ERROR] {slug}: {e}")
        failed.append(slug)

print(f"\n=== Done ===")
print(f"Fetched: {len(CHAPTERS) - len(failed)}/{len(CHAPTERS)} chapters")
print(f"Total content: {total_chars:,} chars")
if failed:
    print(f"Failed: {failed}")
