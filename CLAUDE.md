# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.


# 项目结构

MSCustomAi/                          ← Repository root
├── MSCustomAi.podspec               ← Pod metadata: name, version, source_files glob, dependency
├── LICENSE                          ← MIT license file
├── README.md                        ← Project readme
├── .gitignore                       ← Git exclusion rules (Xcode artifacts, build outputs)
├── .travis.yml                      ← CI configuration (Travis CI)
├── _Pods.xcodeproj                  ← Symlink to Example/Pods/Pods.xcodeproj
│
├── MSCustomAi/                      ← Library source root (what gets shipped to consumers)
│   ├── Assets/                      ← Reserved for bundled resources (images, JSON, etc.)
│   │   └── .gitkeep                 ← Placeholder so Git tracks the empty directory
│   └── Classes/                     ← All Swift source files live here
│       └── MSUtils/                 ← Single namespace grouping all utility modules
│           ├── tools/               ← Concrete classes and helpers
│           │   ├── MSThemeHelper.swift
│           │   └── MSTapImageView.swift
│           └── uikits/              ← Extensions on Foundation/UIKit types
│               └── Dictionary+attribute.swift
│
└── Example/                         ← Standalone demo app and test harness
    ├── Podfile                      ← Declares MSCustomAi as a development pod
    ├── Podfile.lock                 ← Locked dependency versions
    ├── MSCustomAi.xcworkspace       ← Open this (not .xcodeproj) in Xcode
    ├── MSCustomAi.xcodeproj         ← Example app project file
    ├── MSCustomAi/                  ← Example app source
    │   ├── AppDelegate.swift
    │   ├── ViewController.swift
    │   ├── Base.lproj/
    │   ├── Images.xcassets/
    │   └── Info.plist
    └── Tests/                       ← Unit test target
        ├── Tests.swift
        └── Info.plist
```

```

# 知识库 (zread wiki)

本项目有一个 zread 生成的知识库，位于：
`MSCustomAi/Classes/.zread/wiki/versions/2026-06-08-153507/`

## 何时命中知识库

当用户提问涉及以下内容时，必须先读取对应的 wiki 页面再回答：

| 用户问题关键词 | 应读取的 wiki 页面 |
|---|---|
| 主题/换肤/暗黑模式/颜色/theme | `6-understanding-the-theme-architecture-with-swifttheme.md` |
| 颜色色值/色板/品牌色 | `8-brand-and-main-color-palette-reference.md` |
| 黑白色阶/black/white | `9-black-and-white-scale-theme-colors.md` |
| 背景色/background | `10-background-theme-colors.md` |
| CGColor/图层颜色 | `11-cgcolor-theme-pickers-for-core-animation-layers.md` |
| 图片点击/MSTapImageView | `14-tappable-image-view-with-closure-based-interaction.md` |
| 字典/Dictionary/JSON转换 | `16-converting-a-dictionary-to-a-json-string.md` |
| 合并字典/merge | `19-merging-dictionaries-with-conflict-resolution-strategies.md` |
| 项目结构/架构/模块 | `21-pod-library-design-and-module-boundaries.md` |
| 如何接入/安装/CocoaPods | `3-installing-via-cocoapods.md` |
| 项目概览/这个库是什么 | `1-overview.md` |

wiki 页面路径前缀：`MSCustomAi/Classes/.zread/wiki/versions/2026-06-08-153507/`

## 使用规则
1. 先读 wiki，再结合源码回答，确保答案准确且有上下文
2. 如果 wiki 内容与源码有出入，以源码为准
3. 回答时引用 wiki 页面名称，方便用户追溯

# 快捷指令

当用户说 **"检查一下"** 时，使用 `.claude/agents/code-task.md` 子代理
当用户说 **"lint code"** 时，使用 `.claude/agents/code-lint.md` 子代理

