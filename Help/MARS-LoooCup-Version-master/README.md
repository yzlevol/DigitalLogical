## MARS_Looo_signal_final_V1.0

- 修改时间：2021-08-21

- 基于最新版MARS 4.5源码修改
- 修改版能够支持[龙芯杯](http://www.nscscc.org/)个人赛的程序运行
  - 代码空间 0x8000_0000 — 0x803F_FFFF
  - 数据空间 0x8040_0000 — 0x807F_FFFF
- 如何打开MARS
  - 当前README.md文档的同级目录下的**MARS_Looo_signal_final_V1.0.jar**，是打包后的程序，可以单独下载该文件
  - 在Windows环境下双击即可打开，注意，**需要jdk 1.8及以上版本的Java环境**，请自行配置
    - 若双击打不开，可以双击**MARS_Launch.bat**运行MARS（需要和jar文件在同级目录下）
- 需要注意的设置，打开MARS，选择 settings
  - Permit extended (pseudo) instructions and formats 启用伪指令：建议勾选，也可不勾选
  - Delayed branching 启用延迟槽：如果你设计的CPU执行延迟槽指令，则必须勾选
  - Initialize Program Counter to global 'main' if defined：**不要**勾选
  - 其他选项勾选与否随意，可以不修改按照默认值即可
- 关于帮助文档，请查看[MRAS官网][6]或者菜单栏的help按钮
- 该程序主要是为了龙芯杯个人赛决赛的现场编程使用，方便进行**单步调试**以快速定位程序问题
  - 程序不支持串口，只能使用数据空间和代码空间，目前不支持将文件加载到数据和代码空间
  - 对于所有的、不访问串口的程序，其实都是支持的
  - 就NSCSCC2020和2021两届来说，目前还没有使用串口的程序，但是往后不好说
  - 注意，**MARS不支持`#define`语法**，这一点还是挺坑的，define使得MIPS程序的书写得到简化，视觉上也更加方便，更容易找到错误，对它的支持是必要的，否则对于本就复杂的汇编程序来说，没有define简直是场灾难
- 对于个人赛程序，结尾指令是`jr $ra` `nop`，在MARS执行到这里的时候，会显示Error in : invalid program counter value: 0x00000000并退出，这是正常的，因为没有上层kernel程序，没法返回，测试的时候，只要看见能够执行到这里就可以了
- clone该仓库后，可以使用IDEA 2020打开本项目，自行修改源码

_____

本程序后续应该会继续更新，敬请期待，或者如果你有好的想法，欢迎提交PR。

_____

遵循MIT LICENSE，原作者是 [Pete Sanderson ][4]and [Ken Vollmar][5] .

## MARS Assembler

[MARS][1] is a lightweight interactive development environment (IDE) for programming in MIPS assembly language, intended for educational-level use with Patterson and Hennessy's Computer Organization and Design.

MARS has been jointly developed by [Pete Sanderson][4] (programming) and [Ken Vollmar][5] (details and paperwork).

## Download
You can download the latest version [at the official website][6].

## Purpose of this repo
This repo is a mirror of the source code of MARS Assembler. Though the source code is into the "MARS.jar" file at the download page, this is a mirror for people who wants to have the source code forked or that stuff.

I'm not going to accept any pull request. This source code is not maintained by me but the original developers. If you want to contribute to the project, you should talk with them [going here][8].

## Documentation (included in the repo)
 - Go to the [documentation][7].
 - In order to run or compile MARS v4.XX, **MARS requires Java J2SE 1.5 (or later) SDK installed on your computer**.

## How to run MARS
 - **Option A**: Desktop. Save the jar file on the desktop. Run MARS by double-clicking the icon.
 - **Option B**: DOS shell using jar file. Save the jar file in some folder. Open a DOS shell in that folder. Rename the jar file to "Mars.jar" for convenience. Run MARS with the DOS command  java -jar Mars.jar
 - **Option C**: DOS shell using Java classes. Save the jar file in some folder. Open a DOS shell in that folder. Rename the jar file to "Mars.jar" for convenience. Extract MARS files with the DOS command  jar -xf Mars.jar Run MARS with the DOS command  java Mars

## How to compile
 - **Windows**: execute "CreateMarsJar.bat" file to generate an executable.
 - **GNU/Linux** and **Mac**: execute the "CreateMarsJar.sh" to generate an executable. If you can't due of permissions, do a "**chmod +x CreateMarsJar.sh**" (Thanks to [@aesptux][8] to be the tester in Mac).

## License
[MIT][2]. Chech the [LICENSE][3] file. All the credits go to the original developers.

[1]: http://courses.missouristate.edu/KenVollmar/MARS/index.htm
[2]: http://www.opensource.org/licenses/mit-license.html
[3]: https://github.com/adolphenom/MARS_Assembler/blob/master/LICENSE
[4]: http://faculty.otterbein.edu/PSanderson/
[5]: http://courses.missouristate.edu/KenVollmar/
[6]: http://courses.missouristate.edu/KenVollmar/MARS/download.htm
[7]: http://courses.missouristate.edu/KenVollmar/MARS/Help/MarsHelpIntro.html
[8]: http://twitter.com/aesptux