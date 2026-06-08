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

# 快捷指令

当用户说 **"检查一下"** 时，使用 `.claude/agents/code-task.md` 子代理

