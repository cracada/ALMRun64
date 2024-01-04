除了将列表排序的 long 修改为 wxIntPtr 以通过编译 别的什么也没做.
使用的wxWidgets 3.1.0 编译时需要将 /MD 改为/MT
EveryThing使用了静态库

2023年的现在32位程序 地位急速下降.
例如使用32位ALMRun 执行的批处理是无法执行 Hyper-V的 vmconnect.exe 会找不到文件.可能和影射有关.
最后通过面向AI编程.弄出了这个64位的ALMRun.

====================
ALMRun
=======
*******
   [ALMRun]是一个快速启动软件，小巧绿色，简单易用，随用随忘，只要开启了它，完全不用在意到它的存在，你需要的时候随叫随到。

   基本功能：　快速启动，热键管理．  
   扩展功能：　使用LUA脚本来进行功能扩展，程序内置一些常用的API可直接调用（比如模拟键盘或鼠标输入、窗口管理、自动登录等），使用[luajit]作为LUA引擎，功能强大。  
   出生日期：　2013-03-31  



Requirement(编译环境)
======================
	vs2012
	cmake >= 2.8
	wxWidgets >=2.9.5

Build 编译方法
===================
1.  先用下载[wxWidget源码](https://www.wxwidgets.org/downloads/)

    需要**2.9.5**以上的版本,建议用**3.0.1**版的源码,直接解压到`d:\dev`目录下,
    然后打开`D:\dev\wxWidgets-3.0.1\build\msw\wx_vc11.sln`文件编译 **Release** 和 **Debug** 两个版本,直接编译就行了.

2. 下载[cmake](http://www.cmake.org/cmake/resources/software.html)(2.8以上的版本),直接安装.

3. 打开命令管理器(CMD.EXE)进入ALMRUN源码目录
```
	cd Build
	cmake ..
	ALMRun.sln
```

以后可以直接打开**ALMRun.sln**修改编译.

