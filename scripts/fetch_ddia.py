#!/usr/bin/env python3
"""
Fetch all chapters of DDIA 2nd edition (Chinese) from ddia.vonng.com
and save as properly formatted Markdown source files.

Uses markdownify for HTML -> Markdown conversion to preserve structure.
"""

import os
import re
import time
import urllib.request
from datetime import date
from bs4 import BeautifulSoup
from markdownify import markdownify as md

BASE_URL = "https://ddia.vonng.com"
OUT_DIR = os.path.expanduser("~/personal/my-brain/sources/books/ddia")
os.makedirs(OUT_DIR, exist_ok=True)

TODAY = date.today().isoformat()

CHAPTERS = [
    ("ddia-preface", "/preface/",  "序言",                   0),
    ("ddia-ch01",    "/ch1/",      "数据系统架构中的权衡",    1),
    ("ddia-ch02",    "/ch2/",      "定义非功能性需求",        2),
    ("ddia-ch03",    "/ch3/",      "数据模型与查询语言",      3),
    ("ddia-ch04",    "/ch4/",      "存储与检索",              4),
    ("ddia-ch05",    "/ch5/",      "编码与演化",              5),
    ("ddia-ch06",    "/ch6/",      "复制",                    6),
    ("ddia-ch07",    "/ch7/",      "分片",                    7),
    ("ddia-ch08",    "/ch8/",      "事务",                    8),
    ("ddia-ch09",    "/ch9/",      "分布式系统的麻烦",        9),
    ("ddia-ch10",    "/ch10/",     "一致性与共识",           10),
    ("ddia-ch11",    "/ch11/",     "批处理",                 11),
    ("ddia-ch12",    "/ch12/",     "流处理",                 12),
    ("ddia-ch13",    "/ch13/",     "流式系统的哲学",         13),
    ("ddia-ch14",    "/ch14/",     "将事情做正确",           14),
]

HEADERS = {
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36",
    "Accept": "text/html,application/xhtml+xml",
    "Accept-Language": "zh-CN,zh;q=0.9",
}


def clean_markdown(text):
    """Post-process markdownify output for cleaner results."""
    # Remove anchor tags that become empty links like [](#something)
    text = re.sub(r'\[\]\(#[^\)]*\)', '', text)
    # Remove footnote reference links like [1](#fn:1)
    text = re.sub(r'\[\d+\]\(#fn[^\)]*\)', '', text)
    # Remove footnote definition lines like [^1]: ...
    text = re.sub(r'^\[\^\d+\]:.*$', '', text, flags=re.MULTILINE)
    # Collapse 3+ blank lines into 2
    text = re.sub(r'\n{3,}', '\n\n', text)
    # Remove lines that are just whitespace
    text = re.sub(r'^\s+$', '', text, flags=re.MULTILINE)
    return text.strip()


def fetch_chapter(slug, path, title, chapter_num):
    url = BASE_URL + path
    req = urllib.request.Request(url, headers=HEADERS)
    with urllib.request.urlopen(req, timeout=30) as resp:
        html = resp.read().decode("utf-8")

    soup = BeautifulSoup(html, "html.parser")

    # Get the main content div
    content_div = soup.find("div", class_="content")
    if not content_div:
        content_div = soup.find("article")

    # Remove nav elements, buttons, SVGs, permalink anchors
    for tag in content_div.find_all(["nav", "footer", "script", "style", "button", "svg"]):
        tag.decompose()

    # Remove the "Permalink for this section" links
    for a in content_div.find_all("a", string="#"):
        a.decompose()

    # Convert HTML -> Markdown
    raw_md = md(
        str(content_div),
        heading_style="ATX",        # ## style headings
        bullets="-",                # use - for bullets
        strip=["a"],                # strip <a> tags but keep text (avoids noise links)
        newline_style="backslash",
    )

    text = clean_markdown(raw_md)

    # Build frontmatter
    if chapter_num == 0:
        ch_title = f"DDIA 第二版 - {title}"
    else:
        ch_title = f"DDIA 第二版 - 第{chapter_num}章：{title}"

    frontmatter = f"""---
title: "{ch_title}"
url: {url}
date_added: {TODAY}
author: Martin Kleppmann (译：冯若航 Vonng)
type: book
book: "设计数据密集型应用（第二版）"
chapter: {chapter_num}
tags: [distributed-systems, databases, system-design]
---

"""

    out_path = os.path.join(OUT_DIR, f"{slug}.md")
    with open(out_path, "w", encoding="utf-8") as f:
        f.write(frontmatter + text)

    lines = text.count("\n")
    print(f"  [OK] {slug}: {lines} lines -> {out_path}")
    return lines


print("=== Re-fetching DDIA 2nd Edition (HTML -> Markdown) ===\n")

total = 0
failed = []

for slug, path, title, num in CHAPTERS:
    print(f"Fetching {slug} ({path})...")
    try:
        lines = fetch_chapter(slug, path, title, num)
        total += lines
        time.sleep(0.5)
    except Exception as e:
        print(f"  [ERROR] {slug}: {e}")
        failed.append(slug)

print(f"\n=== Done ===")
print(f"Fetched: {len(CHAPTERS) - len(failed)}/{len(CHAPTERS)} chapters")
print(f"Total lines: {total:,}")
if failed:
    print(f"Failed: {failed}")
