# Story Lingo Kids

## 项目名称

Story_Lingo_Kids

## 项目简介

StoryLingoKids: Educational fun, AI-enabled interaction, leading the early childhood English learning experience.

StoryLingoKids：寓教于乐、AI智能交互、引领幼儿英语启蒙教育体验。

![](assets/Logo.png)

> ***Relevant course***
> * Human Computer Interface 2024 (2024年同济大学用户交互技术)

## 成员分工

| 姓名 | 学号 | 分工 | 工作量 |
| :---: | :---: | :---: | :---: |
| 林继申 | 2250758 | 框架搭建、技术开发、幻灯片制作、艺术设计 | 25% |
| 王麒懿 | 2252090 | 技术开发、艺术设计 | 25% |
| 李沅衡 | 2253551 | 文档撰写、艺术设计 | 25% |
| 张泰宇 | 2056174 | 文档撰写、艺术设计 | 25% |

```
git log --format='%aN' | sort -u | while read name; do echo -en "$name\t"; git log --author="$name" --pretty=tformat: --numstat | awk '{ add += $1; subs += $2; loc += $1 - $2 } END { printf "added lines: %s, removed lines: %s, total lines: %s\n", add, subs, loc }' -; done
```

## 项目组成

* `/assets`
存放 `README.md` 和 `StoryLingoKids_Documentation.md` 文件所需的相关图片资源

* `/storylingokids`
项目源代码

  * `/android`
  Android 平台特定的代码和配置文件

  * `/assets`
  项目资源文件

  * `/lib`
  项目 Dart 代码文件

  * `/web`
  Web 平台特定的代码和配置文件

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

* `Final_Defense.pptx`
结题答辩

* `Opening_Defense.pptx`
开题答辩

* `StoryLingoKids_Documentation.md`
StoryLingoKids 项目文档

## 免责声明

The code and materials contained in this repository are intended for personal learning and research purposes only and may not be used for any commercial purposes. Other users who download or refer to the content of this repository must strictly adhere to the **principles of academic integrity** and must not use these materials for any form of homework submission or other actions that may violate academic honesty. I am not responsible for any direct or indirect consequences arising from the improper use of the contents of this repository. Please ensure that your actions comply with the regulations of your school or institution, as well as applicable laws and regulations, before using this content. If you have any questions, please contact me via [email](mailto:minmuslin@outlook.com).

本仓库包含的代码和资料仅用于个人学习和研究目的，不得用于任何商业用途。请其他用户在下载或参考本仓库内容时，严格遵守**学术诚信原则**，不得将这些资料用于任何形式的作业提交或其他可能违反学术诚信的行为。本人对因不恰当使用仓库内容导致的任何直接或间接后果不承担责任。请在使用前务必确保您的行为符合所在学校或机构的规定，以及适用的法律法规。如有任何问题，请通过[电子邮件](mailto:minmuslin@outlook.com)与我联系。

## 文档更新日期

2024年6月17日