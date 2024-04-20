#!/bin/bash

set -e

defaults write com.apple.dt.Xcode AutomaticallyCheckSpellingWhileTyping -bool YES

defaults write com.apple.dt.Xcode DVTTextEditorTrimTrailingWhitespace -bool YES
defaults write com.apple.dt.Xcode DVTTextEditorTrimWhitespaceOnlyLines -bool YES

defaults write com.apple.dt.Xcode DVTTextIndentTabWidth -int 4
defaults write com.apple.dt.Xcode DVTTextIndentWidth -int 4

defaults write com.apple.dt.Xcode DVTTextPageGuideLocation -int 100

# 스크립트가 SwiftLint 설치 및 설정 파일 복사를 자동으로 수행합니다.
if ! which swiftlint > /dev/null; then
    brew install swiftlint
fi
cp YourPackagePath/.swiftlint.yml .
