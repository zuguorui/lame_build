# lame编译Android版动态库

## 0. 准备工作

- 准备NDK，r21及以上的，确保cmake已经安装。
- 下载mp3lame源码。
- 下载此工程。

## 1. 编译步骤

- 打开`build_for_android.sh`进行编辑
- 修改`SOURCE_PATH`为lame源码目录。
- 修改`NDK`为你的NDK目录。
- 根据你的系统修改`HOST_TAG`。其实就是NDK里的一个目录名。
- 根据你的需求修改`API`。
- 保存并运行`build_for_android.sh`。

成功的话，库和头文件都会在该目录`android`文件夹下。