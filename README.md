# Story Lingo Kids

## 项目名称

Story_Lingo_Kids

## 项目简介

StoryLingoKids: Educational fun, AI-enabled interaction, leading the early childhood English learning experience.

StoryLingoKids：寓教于乐、AI智能交互、引领幼儿英语启蒙教育体验。

> ***Relevant course***
> * Human Computer Interface 2024 (2024年同济大学用户交互技术)

## 成员分工

| 姓名 | 学号 | 分工 | 工作量 |
| :---: | :---: | :---: | :---: |
| 林继申 | 2250758 |  | 25% |
| 王麒懿 | 2252090 |  | 25% |
| 李沅衡 | 2253551 |  | 25% |
| 张泰宇 | 2056174 |  | 25% |

```
git log --format='%aN' | sort -u | while read name; do echo -en "$name\t"; git log --author="$name" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -; done
```

## 项目组成

* `/storylingokids`
项目源代码

  * `/android`
  Android 平台特定的代码和配置文件

  * `/assets`
  项目资源文件

  * `/ios`
  iOS 平台特定的代码和配置文件

  * `/lib`
  项目 Dart 代码文件

  * `/linux`
  Linux 平台特定的代码和配置文件

  * `/macos`
  macOS 平台特定的代码和配置文件

  * `/web`
  Web 平台特定的代码和配置文件

  * `/windows`
  Windows 平台特定的代码和配置文件

  * `.metadata`
  项目 Flutter 属性文件

  * `analysis_options.yaml`
  项目代码分析工具配置文件

  * `pubspec.lock`
  项目依赖配置文件

  * `pubspec.yaml`
  项目 Flutter 配置文件

  * `storylingokids.iml`
  项目结构配置文件

* `Opening_Defense.pptx`
开题答辩

## 联系我们

Email: minmuslin@outlook.com

## 文档更新日期

2024年6月8日