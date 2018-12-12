#!/usr/bin/env sh

sudo wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -

sudo apt-add-repository "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-7 main"

sudo apt update && sudo apt install clang-7 lld-7 lldb-7 clang-7-doc clang-format-7 clang-tidy-7 clang-tools-7

sudo update-alternatives --install /usr/bin/clang        clang        /usr/bin/clang-7        70
sudo update-alternatives --install /usr/bin/lldb         lldb         /usr/bin/lldb-7         70
sudo update-alternatives --install /usr/bin/clang-format clang-format /usr/bin/clang-format-7 70
sudo update-alternatives --install /usr/bin/clang-tidy   clang-tidy   /usr/bin/clang-tidy-7   70
sudo update-alternatives --install /usr/bin/clangd       clangd       /usr/bin/clangd-7       70

