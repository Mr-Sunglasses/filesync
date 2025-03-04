#!/bin/bash

alias w:= watch
alias b:= build
alias install := install-dependencies
alias pack := package

APP_NAME := "filesync"
APP_VERSION :="0.7.15"
MINIMUM_STABLE_RUST_VERSION :="1.83.0"
BINARIES_PATH := "bin"
EXPORT_PATH := "packages"
SUPPORTED_PLATFORM :="android ios macos"


default: 
    @just --list --list-heading $'Available commands\n'

[doc('Install the application dependencies')]
install-dependencies: 
    echo "Installing dependencies"
    cargo install trunk --locked
    rustup target add wasm32-unknown-unknown


[doc('Lint')]
fmt:
    cargo fmt
    cargo clippy
    leptosfmt .
    cargo sort -w 
    cargo group-imports --fix 

[doc('Run the application in watch mode')]
watch target:
    #!/usr/bin/env sh
    export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
    export ANDROID_HOME="$HOME/Library/Android/sdk"
    export NDK_HOME="$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk)"
    # export RUSTFLAGS='-C target-feature=+atomics,+bulk-memory,+mutable-globals' 
    if [ {{target}} = "android" ]; then
        cargo tauri android dev 
    elif [ {{target}} = "ios" ]; then 
        cargo tauri ios dev 
    elif [ {{target}} = "styles" ]; then
        npx tailwindcss -i ./common/style/main.css -o ./common/style/app.css --watch --minify
    else
        cargo tauri dev
    fi

[doc('build the application ')]
[group('watch')]
build target:
    #!/usr/bin/env sh
    export ANDROID_HOME="$HOME/Library/Android/sdk"
    export NDK_HOME="$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk)"
    if [ {{target}} = "all" ]; then 
        for platform in {{SUPPORTED_PLATFORM}}
        do
            echo ">>>>>>>>>> Building $platform \n"
            just build $platform
        echo "Build completed"
        done 
    elif [ {{target}} = "android" ]; then
        cargo tauri android build --apk
    elif [ {{target}} = "ios" ]; then 
        cargo tauri ios build --aab
    else
        cargo tauri build 
    fi


[doc("Export binaries into $PWD/bin")]
ship target: 
    #!/usr/bin/env sh
    # mkdir bin 
    if [ {{target}} = "all" ]; then 
        for platform in {{SUPPORTED_PLATFORM}}
        do
            just export $platform
        echo "Export completed"
        done 
    elif [ {{target}} = "android" ]; then
        cp tauri/gen/android/app/build/outputs/apk/universal/release/app-universal-release.apk {{BINARIES_PATH}}/{{APP_NAME}}.apk
    elif [ {{target}} = "ios" ]; then 
        cp tauri/gen/android/app/build/outputs/bundle/universalRelease/app-universal-release.aab {{BINARIES_PATH}}/{{APP_NAME}}.aab
    elif [ {{target}} = "macos" ]; then
        cp target/release/bundle/dmg/filesync_{{APP_VERSION}}_aarch64.dmg {{BINARIES_PATH}}/{{APP_NAME}}-{{APP_VERSION}}.dmg
    else 
        echo "Unspported target"
        exit 1;
    fi


[doc("build and export all")]
package:
    #!/bin/bash
    just build all
    just export all
    echo date > release-date.text
    cp "{{BINARIES_PATH}}/*" "{{EXPORT_PATH}}/*"