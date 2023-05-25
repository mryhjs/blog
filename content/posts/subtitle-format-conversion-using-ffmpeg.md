---
title: "使用 ffmpeg 进行字幕格式转换"
date: 2023-05-25T15:54:16+08:00
draft: false
description: "ffmpeg 内置了多种字幕格式的支持，比如常见的 srt、ass、vtt 等。。。"
categories:
- ffmpeg
tags:
- ffmpeg
- subtitle
- srt
- ass
- vtt
---

我们制作视频的时候经常会使用到字幕，而常见的字幕又有多种格式，例如 srt、ass、vtt 等

- srt 简单、兼容性好，是最被广泛使用的格式
- ass 支持颜色、文字特效，拥有比 srt 更多的高级功能
- vtt 这种格式和 srt 几乎没什么太大区别

### 查看 ffmpeg 中所支持的字幕格式

使用下面的命令可以查看 ffmpeg 中所支持的字幕格式列表，以大写 `S` 开头的表示字幕格式

```
ffmpeg -encoders
```

### ffmpeg 字幕格式转换命令

在 ffmpeg 中使用以下这样的命令格式来对字幕文件进行操作

```
ffmpeg -i <原字幕文件> <新字幕文件>
```

**一些 ffmpeg 字幕格式转换示例**

这里只列出了部分格式的示例，其他格式也是类似的使用方法

1. srt 转 ass

```
ffmpeg -i BladeRunner2049.srt BladeRunner2049.ass
```

2. ass 转 srt

```
ffmpeg -i BladeRunner2049.ass BladeRunner2049.srt
```

3. srt 转 vtt

```
ffmpeg -i BladeRunner2049.srt BladeRunner2049.vtt
```

**关于中文字幕编码的错误**

如果使用 ffmpeg 转换字幕时出现类似下面这样的错误信息

```
Invalid UTF-8 in decoded subtitles text; maybe missing -sub_charenc option
Error while decoding stream #0:0: Invalid data found when processing input
```

则需要为原字幕文件指定 GBK/GB2312 字符集编码

```
ffmpeg -sub_charenc GBK -i BladeRunner2049.srt BladeRunner2049.vtt
```
