% !TEX program = xelatex
% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{textbook-cn}[By Lyu Guanlin]

%%%%%%%%%%%%%%%%%%%% 自定义命令宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{xkeyval,kvoptions,etoolbox,ifthen,xifthen,xparse,expl3,letltxmacro}%设置键和键值%自定义命令
\SetupKeyvalOptions{family=TextBook,prefix=TextBook@,setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{TextBook}{#1}}
%%声明颜色键及默认值%%
\DeclareStringOption[blue]{themecolor}
\DeclareVoidOption{blue}{\ekv{themecolor=blue}}
\DeclareVoidOption{green}{\ekv{themecolor=green}}
\DeclareVoidOption{red}{\ekv{themecolor=red}}
\DeclareVoidOption{purple}{\ekv{themecolor=purple}}
\DeclareVoidOption{gray}{\ekv{themecolor=gray}}
\DeclareVoidOption{orange}{\ekv{themecolor=orange}}
\DeclareVoidOption{yellow}{\ekv{themecolor=yellow}}
\DeclareVoidOption{colorful}{\ekv{themecolor=colorful}}
%%声明参考文献生成方式布尔键%%
\DeclareBoolOption[false]{splitbib}
%%加载book作为基础文档类%%
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax
\LoadClass[12pt]{book}

%%%%%%%%%%%%%%%%%%%% 文本内容风格宏包 %%%%%%%%%%%%%%%%%%%%
%%浮动环境设置%%
\renewcommand*{\textfraction}{0.05}
%%设置顶端和底端的浮动环境的最大比例%%
\renewcommand*{\topfraction}{0.9}
\renewcommand*{\bottomfraction}{0.8}
%%设置浮动环境占页比例阈值%%
\renewcommand*{\floatpagefraction}{0.85}%\floatpagefraction的数值必须小于\topfraction
%%
\RequirePackage[table,dvipsnames,svgnames,x11names]{xcolor}%颜色宏包，必须放在tikz之前
%%蓝色主题%%
\ifdefstring{\TextBook@themecolor}{blue}{
\definecolor{ColorA}{RGB}{68,114,210}
\definecolor{ColorB}{rgb}{0.3,0.52,1.0}
\colorlet{ColorC}{RoyalBlue}
\colorlet{ColorD}{RoyalBlue}
\colorlet{ColorE}{RoyalBlue3}
\colorlet{ColorF}{DodgerBlue2}
\colorlet{ColorG}{SteelBlue2}
\colorlet{ColorH}{DodgerBlue1}
\colorlet{ColorI}{CornflowerBlue}
}{\relax}
%%红色主题%%
\ifdefstring{\TextBook@themecolor}{red}{
\colorlet{ColorA}{Firebrick2}
\colorlet{ColorB}{Brown2}
\colorlet{ColorC}{Crimson}
\colorlet{ColorD}{Tomato3}
\colorlet{ColorE}{Red}
\colorlet{ColorF}{Brown3}
\colorlet{ColorG}{Firebrick3}
\colorlet{ColorH}{Red2}
\colorlet{ColorI}{Red3}
}{\relax}
%%绿色主题%%
\ifdefstring{\TextBook@themecolor}{green}{
\definecolor{ColorA}{rgb}{0.3,0.6,0.3}
\definecolor{ColorB}{rgb}{0.4,0.7,0.4}
\colorlet{ColorC}{ForestGreen}
\colorlet{ColorD}{PaleGreen4}
\colorlet{ColorE}{SeaGreen4}
\colorlet{ColorF}{SpringGreen4}
\colorlet{ColorG}{Green4}
\colorlet{ColorH}{Chartreuse4}
\colorlet{ColorI}{Chartreuse3}
}{\relax}
%%紫色主题%%
\ifdefstring{\TextBook@themecolor}{purple}{
\definecolor{ColorA}{RGB}{147,75,201}
\definecolor{ColorB}{RGB}{192,113,217}
\colorlet{ColorC}{BlueViolet}
\colorlet{ColorD}{Violet}
\colorlet{ColorE}{MediumOrchid3}
\colorlet{ColorF}{SlateBlue3}
\colorlet{ColorG}{DarkOrchid3}
\colorlet{ColorH}{MediumPurple}
\colorlet{ColorI}{MediumOrchid}
}{\relax}
%%橙色主题%%
\ifdefstring{\TextBook@themecolor}{orange}{
\colorlet{ColorA}{Firebrick2}
\colorlet{ColorB}{Dandelion}
\colorlet{ColorC}{DarkOrange}
\colorlet{ColorD}{BurntOrange}
\colorlet{ColorE}{Chocolate2}
\colorlet{ColorF}{Tomato2}
\colorlet{ColorG}{Sienna1}
\colorlet{ColorH}{DarkOrange1}
\colorlet{ColorI}{OrangeRed}
}{\relax}
%%黄色主题%%
\ifdefstring{\TextBook@themecolor}{yellow}{
\colorlet{ColorA}{Dandelion}
\colorlet{ColorB}{Goldenrod1}
\colorlet{ColorC}{Gold}
\colorlet{ColorD}{Gold1}
\colorlet{ColorE}{YellowOrange}
\colorlet{ColorF}{Goldenrod}
\colorlet{ColorG}{DarkGoldenrod}
\colorlet{ColorH}{Goldenrod2}
\colorlet{ColorI}{DarkGoldenrod2}
}{\relax}
%%棕色主题%%
\ifdefstring{\TextBook@themecolor}{brown}{
\definecolor{ColorA}{RGB}{132,60,12}
\definecolor{ColorB}{RGB}{180,90,0}
\definecolor{ColorC}{RGB}{99,45,9}
\definecolor{ColorD}{RGB}{61,28,5}
\definecolor{ColorE}{RGB}{135,61,11}
\definecolor{ColorF}{RGB}{197,80,17}
\definecolor{ColorG}{RGB}{237,122,43}
\definecolor{ColorH}{RGB}{107,49,9}
\definecolor{ColorI}{RGB}{151,69,13}
}{\relax}
%%彩色主题%%
\ifdefstring{\TextBook@themecolor}{colorful}{
\definecolor{ColorA}{RGB}{132,60,12}
\definecolor{ColorB}{RGB}{180,90,0}
\definecolor{ColorC}{RGB}{84,130,53}
\definecolor{ColorD}{RGB}{192,0,0}
\definecolor{ColorE}{RGB}{240,146,82}
\definecolor{ColorF}{RGB}{0,122,59}
\definecolor{ColorG}{RGB}{68,114,196}
\definecolor{ColorH}{RGB}{231,120,12}
\definecolor{ColorI}{RGB}{171,68,171}
}{\relax}

\makeatletter
%%定义书籍信息%%
\newcommand{\coverimage}[1]{\long\def\@coverimage{#1}}
\newcommand{\backimage}[1]{\long\def\@backimage{#1}}
\newcommand{\series}[1]{\long\def\@series{#1}}
\newcommand{\version}[1]{\long\def\@version{#1}}
\newcommand{\subtitle}[1]{\long\def\@subtitle{#1}}
\newcommand{\englishtitle}[1]{\long\def\@englishtitle{\MakeUppercase{#1}}}
\newcommand{\englishsubtitle}[1]{\long\def\@englishsubtitle{\MakeUppercase{#1}}}
\newcommand{\presslogo}[1]{\long\def\@presslogo{#1}}
\newcommand{\pressname}[1]{\long\def\@pressname{#1}}
\makeatother

%%%%%%%%%%%%%%%%%%%% 字体设置 %%%%%%%%%%%%%%%%%%%%
\RequirePackage[fontset=none]{ctex}%中文文本
%%%%
\xeCJKsetup{
CJKecglue={\hspace{0.25em plus 0.1em minus 0.08em}}%中英文间距微调推荐值
}
%%%%
\RequirePackage{fontspec}%字体设置宏包
\RequirePackage{mathptmx}%数学字体设置宏包
%%设置英文字体%%
%%主字体
\setmainfont[
Path=fonts/,
BoldFont=LinLibertineRB.otf,
ItalicFont=LinLibertineRI.otf,
BoldItalicFont=LinLibertineRBI.otf,
]{LinLibertineR.otf}
%%无衬线字体
\setsansfont[
Path=fonts/,
BoldFont=GOTHICB.ttf,
ItalicFont=GOTHICI.ttf,
BoldItalicFont=GOTHICBI.ttf
]{GOTHIC.ttf}
%%等宽字体
\setmonofont[
Path=fonts/,
BoldFont=courbd.ttf,
ItalicFont=couri.ttf,
BoldItalicFont=courbi.ttf
]{cour.ttf}

%%设置中文字体%%
%%主字体
\setCJKmainfont[
Path=fonts/,
BoldFont=Source Han Serif SC Heavy.otf,
ItalicFont=Source Han Serif SC Regular Italic.ttf,
BoldItalicFont=Source Han Serif SC Heavy Italic.ttf
]{Source Han Serif SC Regular.otf}
%%无衬线字体
\setCJKsansfont[
Path=fonts/,
BoldFont=Source Han Sans SC Heavy.otf,
ItalicFont=Source Han Sans SC Regular Italic.ttf,
BoldItalicFont=Source Han Sans SC Heavy Italic.ttf
]{Source Han Sans SC Regular.otf}
%%等宽字体
\setCJKmonofont[
Path=fonts/,
BoldFont=FZCukai.ttf,
ItalicFont=FZKai.ttf,
BoldItalicFont=FZCukai.ttf
]{FZKai.ttf}

%%楷体设置
\newCJKfontfamily\kaiti{FZKai.ttf}[
Path=fonts/,
BoldFont=FZCukai.ttf]

%%简化字体命令%%
\newcommand{\FontSizeSet}[2]{\fontsize{#1}{#2}\selectfont}
%%字号设置%%
\newcommand{\PartLabelFont}{\rmfamily\bfseries\FontSizeSet{34pt}{40.8pt}}%部分标签字体
\newcommand{\PartNameFont}{\rmfamily\bfseries\FontSizeSet{32pt}{38.4pt}}%部分名称字体
\newcommand{\ChapterLabelFont}{\rmfamily\bfseries\FontSizeSet{27pt}{32.4pt}}%章标签字体
\newcommand{\ChapterNameFont}{\rmfamily\bfseries\FontSizeSet{25pt}{30pt}}%章名称字体
\newcommand{\ChapterSayingFont}{\itshape\kaiti\FontSizeSet{13pt}{15.6pt}}%章谚语字体
\newcommand{\SectionFont}{\rmfamily\bfseries\FontSizeSet{18pt}{21.6pt}}%节字体
\newcommand{\SubsectionFont}{\rmfamily\bfseries\FontSizeSet{15pt}{19.5pt}}%小节字体
\newcommand{\SubsubsectionFont}{\rmfamily\bfseries\FontSizeSet{14.5pt}{17.4pt}}%小小节字体
\newcommand{\ParagraphNameFont}{\rmfamily\bfseries\FontSizeSet{14pt}{16.8pt}}%段落名称字体
\newcommand{\HeaderFont}{\rmfamily\bfseries\FontSizeSet{13pt}{16.9pt}}%页眉字体
\newcommand{\FooterFont}{\rmfamily\bfseries\FontSizeSet{13pt}{16.9pt}}%页脚字体
\newcommand{\PageNumberFont}{\sffamily\bfseries\FontSizeSet{16pt}{19.2pt}}%页码字体
\newcommand{\PartNumberFont}{\rmfamily\bfseries\FontSizeSet{14pt}{18.2pt}}%部分标签字体
\newcommand{\ThumbFont}{\rmfamily\bfseries\FontSizeSet{14pt}{18.2pt}}%侧标字体
\newcommand{\CaptionFont}{\rmfamily\FontSizeSet{13pt}{19.5pt}}%图表标签字体
\newcommand{\TocPartFont}{\rmfamily\bfseries\FontSizeSet{14.5pt}{18.85pt}}%目录部分字体
\newcommand{\TocChapterFont}{\rmfamily\bfseries\FontSizeSet{14pt}{18.2pt}}%目录章字体
\newcommand{\TocSectionFont}{\rmfamily\FontSizeSet{14pt}{15.6pt}}%目录节字体
\newcommand{\TocSubsectionFont}{\rmfamily\FontSizeSet{14pt}{15.6pt}}%目录小节字体
\newcommand{\LofFont}{\rmfamily\FontSizeSet{14pt}{15.6pt}}%图列表字体
\newcommand{\LotFont}{\rmfamily\FontSizeSet{14pt}{15.6pt}}%表列表字体
\newcommand{\LTocTitleFont}{\rmfamily\bfseries\FontSizeSet{14pt}{15.6pt}}%小目录标题
\newcommand{\TocLChapterFont}{\rmfamily\bfseries\FontSizeSet{14pt}{15.6pt}}%小目录章字体
\newcommand{\TocLSectionFont}{\rmfamily\FontSizeSet{14pt}{15.6pt}}%小目录节字体
\newcommand{\TocLSubsectionFont}{\rmfamily\FontSizeSet{14pt}{15.6pt}}%小目录节字体
\newcommand{\ContentPageNumFont}{\sffamily\FontSizeSet{14pt}{15.6pt}}%目录页码字体
\newcommand{\CiteNumFont}{\rmfamily}%引用字体
\newcommand{\LineNumFont}{\sffamily\bfseries\FontSizeSet{10pt}{12pt}}%行号字体
\newcommand{\ListNumFont}{\sffamily\bfseries\FontSizeSet{12pt}{14.4pt}}%列表序号字体
\newcommand{\HeadingFont}{\rmfamily\bfseries\FontSizeSet{13pt}{16.9pt}}%一般标题字体
\newcommand{\EgLabelFont}{\rmfamily\bfseries\FontSizeSet{13pt}{15.6pt}}%例题标签字体
\newcommand{\BoxTitleFont}{\rmfamily\bfseries\FontSizeSet{13pt}{16.9pt}}%盒子标题字体
\newcommand{\BoxSubtitleFont}{\rmfamily\bfseries\FontSizeSet{13pt}{16.9pt}}%盒子副标题字体
\newcommand{\BoxLogoFont}{\rmfamily\bfseries\FontSizeSet{16pt}{24pt}}%盒子logo字体
\newcommand{\BoxSublogoFont}{\rmfamily\bfseries\FontSizeSet{14pt}{15.6pt}}%盒子小logo字体
\newcommand{\MarginNoteFont}{\itshape\kaiti\FontSizeSet{13pt}{16.9pt}}%边注字体
\newcommand{\FootNoteFont}{\itshape\kaiti\FontSizeSet{13pt}{16.9pt}}%脚注字体
\newcommand{\ItemFont}{\kaiti}%列表字体
\newcommand{\MainFont}{\FontSizeSet{14pt}{21pt}}%正文字体

%%%%%%%%%%%%%%%%%%%% 页面布局设定宏包 %%%%%%%%%%%%%%%%%%%%
\makeatletter
\RequirePackage{calc}%优化长度计算和设置
\RequirePackage{fp}%浮点数计算
\RequirePackage{ragged2e}%更美观的对齐设置
\gdef\@MarginColumn@Ratio{0.3}
\FPeval\@MainColumn@Ratio{round(1-\@MarginColumn@Ratio:2)}
\RequirePackage{multicol,paracol}%双栏%分栏、边注、中英对照
\columnratio{\@MainColumn@Ratio}
\footnotelayout{c}
\twosided[pcm]
%%设置栏间距和分割线颜色%%
\setlength{\columnsep}{2.0em}
\setlength{\columnseprule}{0em}
\renewcommand{\columnseprulecolor}{\color{ColorA}}
%%设置默认正文分栏环境%%
\newenvironment{Paracol}[1][2]{\begin{paracol}{#1}}{\end{paracol}}
%%页面布局设置%%
\newlength{\@paperwidthlen}
\newlength{\@paperheightlen}
\newlength{\@innerlen}
\newlength{\@outerlen}
\newlength{\@toplen}
\newlength{\@botlen}
\newlength{\@handseplen}
\newlength{\@footskiplen}
\newlength{\@textwidthlen}
\newlength{\@marginparwidthlen}
\newlength{\@marginparseplen}
%%%%
\setlength{\@paperwidthlen}{8.5in}
\setlength{\@paperheightlen}{11.0in}
\setlength{\@innerlen}{2.5cm}
\setlength{\@outerlen}{2.25cm}
\setlength{\@toplen}{2.5cm}
\setlength{\@botlen}{2.5cm}
\setlength{\@handseplen}{0.875cm}
\setlength{\@footskiplen}{0.95cm}
\setlength{\@textwidthlen}{\@paperwidthlen-\@innerlen-\@outerlen}
\setlength{\@marginparwidthlen}{\dimeval{\@MarginColumn@Ratio\@textwidthlen-0.75em}}
\setlength{\@marginparseplen}{-\@marginparwidthlen}
%%%%
\RequirePackage{geometry}
\geometry{paperwidth=\@paperwidthlen,paperheight=\@paperheightlen,inner=\@innerlen,outer=\@outerlen,top=\@toplen,bottom=\@botlen,headsep=\@handseplen,footskip=\@footskiplen,marginparwidth=\@marginparwidthlen,marginparsep=\@marginparseplen,reversemarginpar,heightrounded}
\makeatother
%%%%
\RequirePackage{fancyhdr,extramarks}%页眉页脚样式设置%创建额外的标记，使用方法类似于\markboth和\markright
\RequirePackage[strict]{changepage}%临时修改页面的尺寸
%%边注格式%%
\let\originmarginpar\marginpar
\renewcommand{\marginpar}[1]{\originmarginpar{%
\setlength{\parindent}{2.0em}%
\MarginNoteFont#1}}
%%脚注格式%%
\gdef\footnoterule{}
\gdef\footnotesize{\color{ColorB}\FootNoteFont}
\makeatletter
%%\strut盒子高度调整%%
\newcommand{\AdjustStrut}[1]{
\setbox\strutbox\hbox{
\vrule height #1\ht\strutbox depth #1\dp\strutbox width\z@
}}
\makeatother

%%%%%%%%%%%%%%%%%%%% 图表插入宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}%插入图片路径
\RequirePackage{caption}%图表标签
\RequirePackage{subcaption}%图表标签
%%设置图片和表格格式%%
\renewcommand{\captionfont}{\color{ColorB}\CaptionFont}
%%
\makeatletter
\@removefromreset{figure}{chapter}%移除figure对chapter的依赖
\@addtoreset{figure}{section}%添加figure对section的依赖
%%
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
%%
\renewcommand{\thefigure}{%
\if@mainmatter%	
\the@prenumber.\arabic{figure}%
\fi}
\renewcommand{\thetable}{%
\if@mainmatter%	
\the@prenumber.\arabic{table}%
\fi}
%%
\def\fnum@figure{{\color{ColorB!50}\faSquare}\nobreakspace\figurename\nobreakspace{\sffamily\@Environment@Mark\thefigure}}
\def\fnum@table{{\color{ColorB!50}\faSquare}\nobreakspace\tablename\nobreakspace{\sffamily\@Environment@Mark\thetable}}
%%
\renewcommand{\subfigurename}{图}
\renewcommand{\subtablename}{表}
%%定义非浮动体标签%%
\newcommand{\nonfloatfigcaption}{\setcaptiontype{figure}\caption} 
\newcommand{\nonfloattabcaption}{\setcaptiontype{table}\caption}
\makeatother

%%%%%%%%%%%%%%%%%%%% 目录宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage[explicit,newparttoc,notocpart*]{titlesec}%设置标题格式
\RequirePackage{titletoc}%目录格式设置
\RequirePackage{shorttoc}%简洁目录设置
\def\shorttocname#1{#1}%定义简洁目录标题宏
\renewcommand{\contentsname}{目录}%更改目录标题
\renewcommand{\listfigurename}{插图目录}%更改图片目录标题
\renewcommand{\listtablename}{表格目录}%更改表格目录标题
\renewcommand{\shorttocname}{内容概览}%更改简洁目录标题
%%目录计数器%%
\setcounter{secnumdepth}{3}
%\setcounter{tocdepth}{2}
\makeatletter
%%重定义\tableofcontents%%
\RenewDocumentCommand{\tableofcontents}{s O{1} O{1}}{
\begingroup%确保计数器值只在局部生效
\chapter*{\contentsname}
\c@tocdepth=#3%预设目录深度为1
\IfBooleanTF{#1}{
\begin{paracol}{2}
\@starttoc{toc}
\end{paracol}}
{\ifnum#2=1%
\@starttoc{toc}
\else
\begin{multicols}{#2}
\@starttoc{toc}
\end{multicols}
\fi}
\endgroup}
%%重定义\listoffigures%%
\RenewDocumentCommand{\listoffigures}{s O{1}}{
\chapter*{\listfigurename}
\IfBooleanTF{#1}{
\begin{paracol}{2}
\@starttoc{lof}
\end{paracol}}
{\ifnum#2=1
\@starttoc{lof}
\else
\begin{multicols}{#2}
\@starttoc{lof}
\end{multicols}
\fi}
}
%%重定义\listoftables%%
\RenewDocumentCommand{\listoftables}{s O{1}}{
\chapter*{\listtablename}
\IfBooleanTF{#1}{
\begin{paracol}{2}
\@starttoc{lot}
\end{paracol}}
{\ifnum#2=1
\@starttoc{lot}
\else
\begin{multicols}{#2}
\@starttoc{lot}
\end{multicols}
\fi}
}
%%重定义\shorttableofcontents%%
\RenewDocumentCommand{\shorttableofcontents}{s O{1} O{0}}{
\begingroup%确保计数器值只在局部生效
\chapter*{\shorttocname}
\c@tocdepth=#3%预设目录深度为0
\IfBooleanTF{#1}{
\begin{paracol}{2}
\@startshorttoc{toc}
\end{paracol}}
{\ifnum#2=1%
\@startshorttoc{toc}
\else
\begin{multicols}{#2}
\@startshorttoc{toc}
\end{multicols}
\fi}
\endgroup}
\makeatother


%%%%%%%%%%%%%%%%%%%% 数学符号宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath,amsfonts,amssymb,mathrsfs,array,bm,upgreek}%数学宏包
%%定义罗马数字%%
\makeatletter
\newcommand{\rmnum}[1]{\romannumeral #1}
\newcommand{\Rmnum}[1]{\expandafter\@slowromancap\romannumeral #1@}
\makeatother

%%%%%%%%%%%%%%%%%%%% 盒子和列表宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage[most]{tcolorbox}%彩色盒子
\tcbuselibrary{xparse}
\tcbuselibrary{minted}
\RequirePackage{empheq}%数学公式盒子
\RequirePackage{adjustbox,varwidth}%自动调整字体大小的盒子%固定可变长度盒子
\RequirePackage{enumitem,hlist}%控制列表环境格式%对齐列表环境
\RequirePackage{listings,minted}%伪代码环境
\usemintedstyle{xcode}
%为了使宏包minted正常工作，需要在xelatex编译器参数中添加-shell-escape
\RequirePackage{lineno}%行号宏包
\renewcommand{\linenumberfont}{\color{ColorA}\LineNumFont}%修改行号字体
\setlength{\linenumbersep}{5.5mm}%修改行号与正文的间距

%%%%%%%%%%%%%%%%%%%% 绘图与表格宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{pifont,fontawesome5}%图标
\RequirePackage{anyfontsize}%自由调整字体大小
\RequirePackage{pgfplots,tikz,tikzpagenodes,tkz-euclide,eso-pic}%绘图
\usetikzlibrary{fit,calc,math,scopes,backgrounds,positioning,intersections,decorations,shadows,shadings,fadings,arrows,arrows.meta,patterns.meta,patterns,shapes.geometric,decorations.footprints}
\makeatletter
%%修改addtolength的作用域%%
\newcommand{\gaddtolength}[1]{\calc@assign@skip{\global\advance#1}}
%%修改setlength的作用域%%
\gdef\gsetlength#1#2{%
\begingroup
\setlength\skip@{#2}
\global#1=\skip@
\endgroup}
%%测量节点node尺寸%%
%%
\def\pgfgetnodeheight(#1)#2{
\begin{pgfinterruptboundingbox}
\path($(#1.south)-(#1.north)$);
\end{pgfinterruptboundingbox}
\pgfmathsetmacro#2{veclen(\pgf@x,\pgf@y)}
\edef#2{#2pt}}
%%
\def\pgfgetnodewidth(#1)#2{
\begin{pgfinterruptboundingbox}
\path($(#1.east)-(#1.west)$);
\end{pgfinterruptboundingbox}
\pgfmathsetmacro#2{veclen(\pgf@x,\pgf@y)}
\edef#2{#2pt}}
%%测量任意两点的距离%%
\def\pgfgetdistance(#1)(#2)#3{
\begin{pgfinterruptboundingbox}
\path($(#1)-(#2)$);
\end{pgfinterruptboundingbox}
\pgfmathsetmacro#3{veclen(\pgf@x,\pgf@y)}
\edef#3{#3pt}}
\makeatother

%%%%%%%%%%%%%%%%%%%% 超链接宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{url}%超链接
\RequirePackage[hidelinks,pagebackref]{hyperref}%超链接设置

%%%%%%%%%%%%%%%%%%%% 计数器宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{totcount}%获取计数器的最大值
%%定义计数器%%
\makeatletter
\newcounter{@Thumb@Number}%记录侧标数
\regtotcounter{@Thumb@Number}%获取侧标数最大值，需要编译两次才能正确获取
\newcounter{@egnum}[section]
\newcounter{@varnum}[section]
\newcounter{@def}[section]
\newcounter{@thm}[section]
\newcounter{@axm}[section]
\newcounter{@lem}[section]
\newcounter{@colry}[section]
\newcounter{@prop}[section]
\newcounter{@check}
\newcounter{@comprehension}
\newcounter{@cloze}
\makeatother
\renewcommand{\thesubfigure}{\thefigure.\Alph{subfigure}}
\renewcommand{\thesubtable}{\thetable.\Alph{subtable}}
\renewcommand{\thepart}{\arabic{part}}
\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\arabic{subsection}}
\renewcommand{\thesubsubsection}{\arabic{subsubsection}}

%%%%%%%%%%%%%%%%%%%% 列表环境 %%%%%%%%%%%%%%%%%%%%%%
%%设置不编号点样式%%
\newcommand*{\UnnumberedLabel}{%
\tikz[baseline=-0.4em]{%
\node[circle,fill=white,draw=ColorA,ultra thick,anchor=base,minimum size=1.0em,inner sep=0mm,outer sep=0mm]{};%
\node[circle,fill=ColorA,draw=ColorA,anchor=base,minimum size=0.5em,inner sep=0mm,outer sep=0mm]{};%
}}
%%设置编号点样式%%
\newcommand*{\NumberedLabel}[1]{%
\tikz[baseline=-0.1em]{%
\node[circle,fill=ColorA,draw=ColorA,ultra thick,anchor=base,minimum size=1.0em,align=center,inner sep=0mm,outer sep=0mm,font=\ListNumFont,text=white]{\maxsizebox{0.9em}{!}{#1}};}}
%%%%
%%无编号列表环境%%
\NewDocumentEnvironment{UnnumberedItem}{O{1}}{%
\ifnum#1=1%
\begin{itemize}[labelsep=0.5em,labelwidth=1.0em,itemsep=0em,itemindent=1.6em,leftmargin=0.8em,label=\protect\UnnumberedLabel]%
\else%
\setlength{\multicolsep}{0pt}%
\setlength{\columnsep}{0.7em}%
\begin{multicols}{#1}%
\ItemFont%
\begin{itemize}[labelsep=0.5em,labelwidth=1.0em,itemsep=0em,itemindent=1.6em,leftmargin=0.8em,label=\protect\UnnumberedLabel]%
\fi%
}{%
\ifnum#1=1%
\end{itemize}%
\else%
\end{itemize}%
\end{multicols}%
\fi}
%%编号列表环境%%
\NewDocumentEnvironment{NumberedItem}{O{1}}{%
\ifnum#1=1%
\begin{enumerate}[labelsep=0.5em,labelwidth=1.0em,itemsep=0em,itemindent=1.6em,leftmargin=0.8em,label=\protect\NumberedLabel{\arabic*}]%
\else%
\setlength{\multicolsep}{0pt}%
\setlength{\columnsep}{0.7em}%
\begin{multicols}{#1}%
\ItemFont%
\begin{enumerate}[labelsep=0.5em,labelwidth=1.0em,itemsep=0em,itemindent=1.6em,leftmargin=0.8em,label=\protect\NumberedLabel{\arabic*}]%
\fi%
}{%
\ifnum#1=1%
\end{enumerate}%
\else%
\end{enumerate}%
\end{multicols}%
\fi}

%%题序号环境%%
\makeatletter
%临时计数器，储存每个列表环境的最后一条item的序号%
\newcounter{@temp@item}[section]
\setcounter{@temp@item}{0}
%%%%
\NewDocumentEnvironment{QuestionItem}{O{1}}{%
\ifnum#1=1%
\begin{enumerate}[labelsep=0em,labelwidth=2.0em,itemsep=0em,itemindent=2.0em,leftmargin=0.8em,label={\protect\raisebox{0.1em}{\parbox{2.0em}{\sffamily\bfseries\color{ColorA}\arabic*.}}}]%
\setcounter{enumi}{\value{@temp@item}}%
\else%
\setlength{\multicolsep}{0pt}%
\setlength{\columnsep}{0.7em}%
\begin{multicols}{#1}%
\begin{enumerate}[labelsep=0em,labelwidth=2.0em,itemsep=0em,itemindent=2.0em,leftmargin=0.8em,label={\protect\raisebox{0.1em}{\parbox{2.0em}{\sffamily\bfseries\color{ColorA}\arabic*.}}}]%
\setcounter{enumi}{\value{@temp@item}}%
\fi%
}{%
\ifnum#1=1%
\setcounter{@temp@item}{\value{enumi}}%
\end{enumerate}%
\else%
\setcounter{@temp@item}{\value{enumi}}%
\end{enumerate}%
\end{multicols}%
\fi}
\makeatother

%%设置星级%%
\NewDocumentCommand{\score}{m m O{ColorB}}{
\begingroup%
\tikz[baseline]{%
\foreach \i in {1,...,#1}{
\pgfmathparse{\i<=#2 ? "#3" : "white"}
\edef\circlecolor{\pgfmathresult}
\draw(\i*1.25em,0)node[name=circle\i,circle,inner sep=0mm,minimum size=0.35cm,draw=#3,very thick,fill=\circlecolor]{};}
}%
\endgroup}

%%设置答题卡%%
\NewDocumentCommand{\AnswerSheet}{+O{选择题答题区域} m m O{\linewidth} O{0.7cm}}{
\begin{flushleft}
\UnnumberedLabel~{\color{ColorA}\bfseries#1}\\
\vspace*{0.5em}
\begin{tikzpicture}[yscale=-1]
% 计算总高度
\pgfmathsetlengthmacro{\totalheight}{#2*#5}
% 绘制表格外框
\draw[ColorA,fill=ColorB!5,very thick,rounded corners](0,0)rectangle(#4,\totalheight);
% 绘制水平线
\ifnum#2=1
\relax
\else
\foreach \row in {2,...,#2}{
\draw[ColorA,very thick](0,\row*#5-#5)--(#4,\row*#5-#5);
}
\fi
% 绘制垂直线
\ifnum#3=1
\relax
\else
\foreach \col in {2,...,#3}{
\draw[ColorA,very thick](\col*#4/#3-#4/#3,0)--(\col*#4/#3-#4/#3,\totalheight);
}
\fi
% 添加题号
\foreach \row in {1,...,\numexpr#2\relax}{
\foreach \col in {1,...,\numexpr#3\relax}{
\FPeval\Num{round((\row+1)/2*\col:0)}
\ifthenelse{\isodd{\row}}{
\node[text=ColorA,font=\bfseries]at({(\col-0.5)*#4/#3},{(\row-0.5)*#5}){\Num};
}{\relax}
}}
\end{tikzpicture}
\end{flushleft}
}
%%%%%%%%%%%%%%%%%% 页面样式 %%%%%%%%%%%%%%%%%%%%%%%%
%%BookPressLogo%%
\newcommand{\BookPressLogo}{%
\path[fill=ColorB,even odd rule]
(26.1,7.4)--(24.3,-0.5)--(16.9,-0.4)..controls(16.8,-0.2)and(16.8,0.0)..(16.7,0.2)--(23.6,0.3)--(25.4,7.2)--cycle;
%%%%
\path[fill=ColorA,even odd rule]
(24.2,9.4)--(24.1,8.9)..controls(23.8,7.7)and(23.5,6.7)..(23.2,5.4)..controls(22.6,3.5)and(22.7,2.9)..(21.5,2.2)..controls(20.2,1.7)and(19.2,1.5)..(16.1,0.8)--(16.4,-0.9)--(25.0,-1.8)--(26.4,4.7)--(27.1,4.6)--(25.6,-2.6)--(24.9,-2.5)..controls(21.6,-2.1)and(19.5,-1.9)..(16.1,-1.2)--(15.9,-0.9)..controls(15.5,-0.1)and(15.4,0.3)..(15.5,0.7)--(17.8,5.4)--(17.9,5.4)..controls(19.1,5.7)and(22.4,8.0)..(24.2,9.4)--cycle;
}
%%定义部分总数（序言、前言视作一个部分，目录、插图目录、表格目录视作一个部分，绪论、有编号部分、无编号部分以及后记）,编译两次可以得到正确的页面框架%%
\makeatletter
%%页眉和侧标的默认值%%
\newcommand{\DefaultMark}{
\markboth{\protect\@subtitle}{\protect\@subtitle}
}
\makeatother
%%设置新长度%%
\newlength{\DeltaH}%第一个侧标与最后一个侧标的中心点到页面最上端和最下端的垂直距离
\newlength{\SepH}%相邻两个侧标中心点之间的距离
\newlength{\MarkY}%侧标中心点距页面最上端的垂直距离
\setlength{\DeltaH}{6.0cm}
\AtBeginDocument{
\makeatletter
\ifthenelse{\totvalue{@Thumb@Number}=0\or\totvalue{@Thumb@Number}=1}
{\setlength{\SepH}{0cm}
\setlength{\MarkY}{-\paperheight/2}}
{\setlength{\SepH}{\dimexpr(\paperheight-2\DeltaH)/(\totvalue{@Thumb@Number}-1)\relax}%设置侧标每次移动的距离
\setlength{\MarkY}{-\DeltaH}}%设置侧标上下两侧锚点坐标的初值
\pagestyle{empty}
\DefaultMark
\makeatother}

%%%%
\makeatletter
%%绘制页面框架%%
\newlength{\@ThumbMinimumHeight}
\setlength{\@ThumbMinimumHeight}{1.2cm}
\newlength{\@FrameWidth}
\setlength{\@FrameWidth}{1.0cm}
\newlength{\@GutterWidth}
\setlength{\@GutterWidth}{\@innerlen-1.5cm}
\newlength{\@PageNumWidth}
\setlength{\@PageNumWidth}{\@toplen-\@handseplen+1.0mm}
%%%%
\newcommand{\partlabelfront}{第~}
\newcommand{\partlabelback}{~部分}
\newcommand{\chapterlabelfront}{第~}
\newcommand{\chapterlabelback}{~章}
\newcommand{\sectionlabelfront}{第}
\newcommand{\sectionlabelback}{节}
\newcommand{\subsectionlabelfront}{课时}
\newcommand{\subsectionlabelback}{}
\renewcommand{\headrulewidth}{0pt}
\RenewDocumentCommand{\chaptermark}{ +m }{
\if@mainmatter
\markboth{\chapterlabelfront{\sffamily\thechapter}\chapterlabelback\quad#1}{\chapterlabelfront{\sffamily\thechapter}\chapterlabelback\quad#1}
\else
\markboth{#1}{#1}
\fi}
\RenewDocumentCommand{\sectionmark}{+m}{\markright{\sectionlabelfront{\sffamily\thesection}\sectionlabelback\quad#1}}
%%%%
%%绘制主页面样式%%
\newcommand{\@Main@PageStyle}{
\begin{tikzpicture}[remember picture,overlay]
\pgfdeclarelayer{@MainPage@Top}%
\pgfsetlayers{main,@MainPage@Top}%
%%根据页数的奇偶生成%%
\ifodd\value{page}
\coordinate(A)at(current page.north west);
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
\coordinate(D)at(current page.south west);
\coordinate(E)at([xshift=\@GutterWidth,yshift=\@FrameWidth]current page.south west);
\coordinate(F)at([xshift=-\@FrameWidth,yshift=\@FrameWidth]current page.south east);
\coordinate(G)at([xshift=-\@FrameWidth,yshift=-\@FrameWidth]current page.north east);
\coordinate(H)at([xshift=\@GutterWidth,yshift=-\@FrameWidth]current page.north west);
\coordinate(I)at(current page.south);
%%绘制页面框架%%
\draw[ColorB!7.5,fill=ColorB!7.5,sharp corners]
(A)--(B)--(C)--(D)--cycle
(E)[rounded corners=5.0mm]--(F)[rounded corners=5.0mm]--(G)[sharp corners]--(H)[sharp corners]--cycle;
%%绘制页码%%
\path[fill=ColorA!60!ColorB]
([xshift=-\@outerlen+0.25cm]B)[rounded corners=1.5mm]--
([xshift=-\@outerlen+0.25cm,yshift=-\@PageNumWidth]B)[rounded corners=1.5mm]--
([xshift=-\@FrameWidth+0.15cm,yshift=-\@PageNumWidth]B)[sharp corners]--
([xshift=-\@FrameWidth+0.15cm]B)--cycle;
%%%%
\path[pattern={Lines[angle=45,distance=5.0pt,line width=4.0pt]},pattern color=ColorA]
([xshift=-\@outerlen+0.25cm]B)[rounded corners=1.5mm]--
([xshift=-\@outerlen+0.25cm,yshift=-\@PageNumWidth]B)[rounded corners=1.5mm]--
([xshift=-\@FrameWidth+0.15cm,yshift=-\@PageNumWidth]B)[sharp corners]--
([xshift=-\@FrameWidth+0.15cm]B)--cycle;
%%%%
\node[font=\PageNumberFont,text=white,anchor=south,inner ysep=2.0mm](P)at([xshift=-\@outerlen/2-\@FrameWidth/2+0.2cm,yshift=-\@PageNumWidth]B){\maxsizebox{0.8cm}{!}{\centering\thepage}};
%%绘制侧标%%
\begin{pgfonlayer}{@MainPage@Top}
\node[font=\ThumbFont,text=white,outer sep=0mm,inner xsep=2.5mm,inner ysep=3.5mm,anchor=east](T)at([yshift=\MarkY]B){%
\rotatebox[origin=c]{90}{%
\begin{varwidth}{\DeltaH}
\centering\strut\@title\strut
\end{varwidth}}%
};
\end{pgfonlayer}
%%%%
\path[fill=ColorA!60!ColorB](T.north west)--(T.north east)--(T.south east)[rounded corners=1.75mm]--(T.south west)[rounded corners=1.75mm]--cycle;
%%%%
\path[pattern={Lines[angle=45,distance=5.0pt,line width=4.0pt]},pattern color=ColorA](T.north west)--(T.north east)--(T.south east)[rounded corners=1.75mm]--(T.south west)[rounded corners=1.75mm]--cycle;
%%%%
\if@partnumbermark
%%绘制部分序号标签%%
\begin{pgfonlayer}{@MainPage@Top}
\node[font=\PartNumberFont,text=white,outer sep=0mm,inner xsep=3.5mm,inner ysep=2.5mm,anchor=south](PTN)at([yshift=0.1cm]I){%
\begin{varwidth}{\textwidth/3}%
\centering\strut\firstrightxmark\strut
\end{varwidth}};
\end{pgfonlayer}
%%%%
\path[fill=ColorA!60!ColorB]([yshift=-0.1cm]PTN.south west)[rounded corners=2.0mm]--(PTN.north west)[rounded corners=2.0mm]--(PTN.north east)[sharp corners]--([yshift=-0.1cm]PTN.south east)--cycle;
%%%%
\path[pattern={Lines[angle=45,distance=5.0pt,line width=4.0pt]},pattern color=ColorA]([yshift=-0.1cm]PTN.south west)[rounded corners=2.0mm]--(PTN.north west)[rounded corners=2.0mm]--(PTN.north east)[sharp corners]--([yshift=-0.1cm]PTN.south east)--cycle;
\fi
%%%%
\else
\coordinate(A)at(current page.north east);
\coordinate(B)at(current page.north west);
\coordinate(C)at(current page.south west);
\coordinate(D)at(current page.south east);
\coordinate(E)at([xshift=-\@GutterWidth,yshift=\@FrameWidth]current page.south east);
\coordinate(F)at([xshift=\@FrameWidth,yshift=\@FrameWidth]current page.south west);
\coordinate(G)at([xshift=\@FrameWidth,yshift=-\@FrameWidth]current page.north west);
\coordinate(H)at([xshift=-\@GutterWidth,yshift=-\@FrameWidth]current page.north east);
\coordinate(I)at(current page.south);
%%绘制页面框架%%
\draw[ColorB!7.5,fill=ColorB!7.5,sharp corners]
(A)--(B)--(C)--(D)--cycle
(E)[rounded corners=5.0mm]--(F)[rounded corners=5.0mm]--(G)[sharp corners]--(H)[sharp corners]--cycle;
%%绘制页码%%
\path[fill=ColorA!60!ColorB]
([xshift=\@outerlen-0.25cm]B)[rounded corners=1.5mm]--
([xshift=\@outerlen-0.25cm,yshift=-\@PageNumWidth]B)[rounded corners=1.5mm]--
([xshift=\@FrameWidth-0.15cm,yshift=-\@PageNumWidth]B)[sharp corners]--
([xshift=\@FrameWidth-0.15cm]B)--cycle;
%%%%
\path[pattern={Lines[angle=-45,distance=5.0pt,line width=4.0pt]},pattern color=ColorA]
([xshift=\@outerlen-0.25cm]B)[rounded corners=1.5mm]--
([xshift=\@outerlen-0.25cm,yshift=-\@PageNumWidth]B)[rounded corners=1.5mm]--
([xshift=\@FrameWidth-0.15cm,yshift=-\@PageNumWidth]B)[sharp corners]--
([xshift=\@FrameWidth-0.15cm]B)--cycle;
%%%%
\node[font=\PageNumberFont,text=white,anchor=south,inner ysep=2.0mm](P)at([xshift=\@FrameWidth/2+\@outerlen/2-0.2cm,yshift=-\@PageNumWidth]B){\maxsizebox{0.8cm}{!}{\centering\thepage}};
%%绘制侧标%%
\begin{pgfonlayer}{@MainPage@Top}
\node[font=\ThumbFont,text=white,outer sep=0mm,inner xsep=2.5mm,inner ysep=3.5mm,anchor=west](T)at([yshift=\MarkY]B){%
\rotatebox[origin=c]{-90}{%
\begin{varwidth}{\DeltaH}
\centering\strut\@title\strut
\end{varwidth}}%
};
\end{pgfonlayer}
%%%%
\path[fill=ColorA!60!ColorB](T.north west)[rounded corners=1.75mm]--(T.north east)[rounded corners=1.75mm]--(T.south east)[sharp corners]--(T.south west)--cycle;
%%%%
\path[pattern={Lines[angle=-45,distance=5.0pt,line width=4.0pt]},pattern color=ColorA](T.north west)[rounded corners=1.75mm]--(T.north east)[rounded corners=1.75mm]--(T.south east)[sharp corners]--(T.south west)--cycle;
%%%%
\if@partnumbermark
%%绘制部分序号标签%%
\begin{pgfonlayer}{@MainPage@Top}
\node[font=\PartNumberFont,text=white,outer sep=0mm,inner xsep=3.5mm,inner ysep=2.5mm,anchor=south](PTN)at([yshift=0.1cm]I){%
\begin{varwidth}{\textwidth/3}%
\centering\strut\firstleftxmark\strut
\end{varwidth}};
\end{pgfonlayer}
%%%%
\path[fill=ColorA!60!ColorB]([yshift=-0.1cm]PTN.south west)[rounded corners=2.0mm]--(PTN.north west)[rounded corners=2.0mm]--(PTN.north east)[sharp corners]--([yshift=-0.1cm]PTN.south east)--cycle;
%%%%
\path[pattern={Lines[angle=-45,distance=5.0pt,line width=4.0pt]},pattern color=ColorA]([yshift=-0.1cm]PTN.south west)[rounded corners=2.0mm]--(PTN.north west)[rounded corners=2.0mm]--(PTN.north east)[sharp corners]--([yshift=-0.1cm]PTN.south east)--cycle;
\fi
%%
\fi
\end{tikzpicture}%
}
%%
%%定义主页面样式%%
\fancypagestyle{MainPage}{
\fancyhf{}
\fancyfoot[C]{\@Main@PageStyle}
\fancyhead[RO]{\HeaderFont\color{ColorA}\rightmark}
\fancyhead[LE]{\HeaderFont\color{ColorA}\leftmark}}
%%绘制空白页面样式%%
\newcommand{\@Sub@PageStyle}{%
\AddToShipoutPictureBG*{%
\AtPageLowerLeft{%
\begin{tikzpicture}[remember picture]
\draw[ColorB!7.5,fill=ColorB!7.5](0,0)rectangle(\paperwidth,\paperheight);
\node[opacity=0.075](L)at(current page.center){\tikz{\BookPressLogo}};
\end{tikzpicture}}}
}
%%
%%重定义空白页面样式%%
\fancypagestyle{SubPage}{%
\fancyhf{}%清除所有页眉页脚
\fancyfoot[C]{\@Sub@PageStyle}%
}
\makeatother

%%%%%%%%%%%%%%%%%%%% 书籍层次样式 %%%%%%%%%%%%%%%%%%%%%%
%%部分页样式%%
%%编号部分页样式%%
\makeatletter
\newlength{\@Part@StripeWidth}
\newlength{\@Part@BlockWidth}
\newlength{\@Part@TopOuterBlockLength}
\newlength{\@Part@MiddleOuterBlockLength}
\setlength{\@Part@StripeWidth}{0.35cm}
\setlength{\@Part@BlockWidth}{1.75cm}
\setlength{\@Part@TopOuterBlockLength}{7.0cm}
\setlength{\@Part@MiddleOuterBlockLength}{4.0cm}
%%
%%部分介绍%%
\newcommand{\partintro}[1]{\long\def\@partintro{\hspace*{2.0em}#1}}
\newcommand{\partimage}[1]{\long\def\@partimage{#1}}
\newcommand{\partsubtitle}[1]{\long\def\@partsubtitle{#1}}
\partintro{}
\partimage{}
\partsubtitle{}
%%
%%奇数页布局%%
\NewDocumentCommand{\@Part@OddPage@Style}{ +m +m }{
\begin{pgfonlayer}{@Part@Top}
%%右上角色块坐标%%
\coordinate(A)at(current page.north east);
\coordinate(B)at([xshift=-\@Part@BlockWidth]current page.north east);
\coordinate(C)at([xshift=-\@Part@BlockWidth,yshift=-\@Part@TopOuterBlockLength]current page.north east);
\coordinate(D)at([yshift=-\@Part@TopOuterBlockLength]current page.north east);
%%右上角色块%%
\path[fill=ColorA,opacity=0.9](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\@Part@StripeWidth]D);
\coordinate(R)at([xshift=-\@Part@MiddleOuterBlockLength]Q);
\coordinate(T)at([yshift=-\@Part@BlockWidth]Q);
\coordinate(S)at([xshift=-\@Part@MiddleOuterBlockLength]T);
%%右侧色块%%
\path[fill=ColorB,opacity=0.2](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\@Part@StripeWidth]T);
\coordinate(F)at([xshift=-\@Part@BlockWidth]E);
\coordinate(H)at(current page.south east);
\coordinate(G)at([xshift=-\@Part@BlockWidth]H);
%%右下角色块%%
\path[fill=ColorA,opacity=0.9](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
\end{pgfonlayer}
%%%%
%%左上角色块坐标%%
\coordinate(I)at([xshift=-\@Part@StripeWidth]B);
\coordinate(J)at(current page.north west);
\coordinate(K)at([yshift=-\@Part@TopOuterBlockLength]J);
\coordinate(L)at([xshift=-\@Part@StripeWidth]C);
%%左上角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](I)--(J)--(K)[rounded corners=2.5mm]--(L)[sharp corners]--cycle;
%%左下角色块坐标%%
\coordinate(M)at([xshift=-\@Part@StripeWidth]F);
\coordinate(N)at([xshift=-\paperwidth]E);
\coordinate(O)at(current page.south west);
\coordinate(P)at([xshift=-\@Part@StripeWidth]G);
%%左下角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](M)[sharp corners]--(N)--(O)--(P)[rounded corners=2.5mm]--cycle;
%%%%
%%章节图片%%
\node[anchor=south west,outer sep=0mm,inner sep=0mm](Pic)at(current page.south west){\@partimage};
%%%%
\begin{pgfonlayer}{@Part@Top}
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=-\@Part@StripeWidth]R);
\coordinate(X)at([xshift=-\@Part@StripeWidth]S);
%%部分编号%%
\node[align=flush right,anchor=south east,font=\PartLabelFont,text=ColorA,inner xsep=0mm](NL)at([yshift=\@Part@StripeWidth+0.25cm]U){%
\begin{varwidth}{\textwidth-5.0cm}%
\strut#1\strut
\end{varwidth}};
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(NL)\NLWidth
\coordinate(V)at([xshift=-\NLWidth]U);
\coordinate(W)at([xshift=-\NLWidth]X);
%%
%%页面中部色块%%
\path[fill=ColorB,opacity=0.5,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=-\@Part@StripeWidth]V);
\coordinate(Z)at([yshift=-\@Part@StripeWidth]K);
\coordinate(YY)at([yshift=\@Part@StripeWidth]N);
\coordinate(ZZ)at([xshift=-\@Part@StripeWidth]W);
%%左侧色块%%
\path[fill=ColorB,opacity=0.2](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%部分名%%
\node[align=flush right,anchor=north east,font=\PartNameFont,text=ColorA,inner xsep=0mm](PT)at([yshift=-\@Part@StripeWidth-0.25cm]X){%
\begin{varwidth}{\textwidth-2.45cm}%
\strut#2\strut
\end{varwidth}};
%%部分简介%%
\node[align=flush right,anchor=north east,font=\itshape\kaiti,text=ColorA,inner xsep=0mm](IT)at([yshift=-0.5cm]PT.south east){%
\begin{varwidth}{\textwidth-2.45cm}%
\@partintro
\end{varwidth}};
%%部分目录%%
\node[inner sep=0mm,outer sep=0mm,anchor=south west](SC)at([xshift=\@innerlen+5.0mm,yshift=\@botlen]current page.south west){%
\begin{varwidth}{\textwidth/2}%
\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}
\end{varwidth}};
\end{pgfonlayer}}
%%
%%偶数页布局%%
\NewDocumentCommand{\@Part@EvenPage@Style}{ +m +m }{
\begin{pgfonlayer}{@Part@Top}
%%右上角色块坐标%%
\coordinate(A)at(current page.north west);
\coordinate(B)at([xshift=\@Part@BlockWidth]current page.north west);
\coordinate(C)at([xshift=\@Part@BlockWidth,yshift=-\@Part@TopOuterBlockLength]current page.north west);
\coordinate(D)at([yshift=-\@Part@TopOuterBlockLength]current page.north west);
%%右上角色块%%
\path[fill=ColorA,opacity=0.9](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\@Part@StripeWidth]D);
\coordinate(R)at([xshift=\@Part@MiddleOuterBlockLength]Q);
\coordinate(T)at([yshift=-\@Part@BlockWidth]Q);
\coordinate(S)at([xshift=\@Part@MiddleOuterBlockLength]T);
%%右侧色块%%
\path[fill=ColorB,opacity=0.2](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\@Part@StripeWidth]T);
\coordinate(F)at([xshift=\@Part@BlockWidth]E);
\coordinate(H)at(current page.south west);
\coordinate(G)at([xshift=\@Part@BlockWidth]H);
%%右下角色块%%
\path[fill=ColorA,opacity=0.9](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
\end{pgfonlayer}
%%%%
%%左上角色块坐标%%
\coordinate(I)at([xshift=\@Part@StripeWidth]B);
\coordinate(J)at(current page.north east);
\coordinate(K)at([yshift=-\@Part@TopOuterBlockLength]J);
\coordinate(L)at([xshift=\@Part@StripeWidth]C);
%%左上角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](I)--(J)--(K)[rounded corners=2.5mm]--(L)[sharp corners]--cycle;
%%左下角色块坐标%%
\coordinate(M)at([xshift=\@Part@StripeWidth]F);
\coordinate(N)at([xshift=\paperwidth]E);
\coordinate(O)at(current page.south east);
\coordinate(P)at([xshift=\@Part@StripeWidth]G);
%%左下角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](M)[sharp corners]--(N)--(O)--(P)[rounded corners=2.5mm]--cycle;
%%%%
%%章节图片%%
\node[anchor=south east,outer sep=0mm,inner sep=0mm](Pic)at(current page.south east){\@partimage};
%%%%
\begin{pgfonlayer}{@Part@Top}
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=\@Part@StripeWidth]R);
\coordinate(X)at([xshift=\@Part@StripeWidth]S);
%%部分编号%%
\node[align=flush left,anchor=south west,font=\PartLabelFont,text=ColorA,inner xsep=0mm](NL)at([yshift=\@Part@StripeWidth+0.25cm]U){%
\begin{varwidth}{\textwidth-5.0cm}%
\strut#1\strut
\end{varwidth}};
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(NL)\NLWidth
\coordinate(V)at([xshift=\NLWidth]U);
\coordinate(W)at([xshift=\NLWidth]X);
%%
%%页面中部色块%%
\path[fill=ColorB,opacity=0.5,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=\@Part@StripeWidth]V);
\coordinate(Z)at([yshift=-\@Part@StripeWidth]K);
\coordinate(YY)at([yshift=\@Part@StripeWidth]N);
\coordinate(ZZ)at([xshift=\@Part@StripeWidth]W);
%%左侧色块%%
\path[fill=ColorB,opacity=0.2](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%
%%部分名%%
\node[align=flush left,anchor=north west,font=\PartNameFont,text=ColorA,inner xsep=0mm](PT)at([yshift=-\@Part@StripeWidth-0.25cm]X){%
\begin{varwidth}{\textwidth-2.45cm}%
\strut#2\strut
\end{varwidth}};
%%部分简介%%
\node[align=flush left,anchor=north west,font=\itshape\kaiti,text=ColorA,inner xsep=0mm](IT)at([yshift=-0.5cm]PT.south west){%
\begin{varwidth}{\textwidth-2.45cm}%
\@partintro
\end{varwidth}};
%%部分目录%%
\node[inner sep=0mm,outer sep=0mm,minimum width=4.0cm,anchor=south east](SC)at([xshift=-\@innerlen-5.0mm,yshift=\@botlen]current page.south east){%
\begin{varwidth}{\textwidth/2}%
\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}
\end{varwidth}};
\end{pgfonlayer}}
%%
\NewDocumentCommand{\@PartStyle}{ +m +m }{
\begin{tikzpicture}[remember picture,overlay]
\pgfdeclarelayer{@Part@Top}
\pgfdeclarelayer{@Part@Bottom}
\pgfsetlayers{@Part@Bottom,main,@Part@Top}
%%白色背景%%
\draw[white,fill=white](current page.south west)rectangle(current page.north east);
\ifodd\value{page}%判断奇偶页
\@Part@OddPage@Style{#1}{#2}
\else
\@Part@EvenPage@Style{#1}{#2}
\fi
\end{tikzpicture}
}
%%
%%定义小半圆%%
\newcommand{\@HalfCircle@Label}[2]{
\tikz{\draw[#1,fill=#1,sharp corners](0,0)arc(90:-90:#2)--cycle;}}
%%
%%奇数页布局%%
\NewDocumentCommand{\@Part@Star@OddPage@Style}{ +m }{
\begin{pgfonlayer}{@Part@Star@Top}
%%右上角色块坐标%%
\coordinate(A)at(current page.north east);
\coordinate(B)at([xshift=-\@Part@BlockWidth]current page.north east);
\coordinate(C)at([xshift=-\@Part@BlockWidth,yshift=-\@Part@TopOuterBlockLength]current page.north east);
\coordinate(D)at([yshift=-\@Part@TopOuterBlockLength]current page.north east);
%%右上角色块%%
\path[fill=ColorA,opacity=0.9](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\@Part@StripeWidth]D);
\coordinate(R)at([xshift=-\@Part@MiddleOuterBlockLength]Q);
\coordinate(T)at([yshift=-\@Part@BlockWidth]Q);
\coordinate(S)at([xshift=-\@Part@MiddleOuterBlockLength]T);
%%右侧色块%%
\path[fill=ColorB,opacity=0.2](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\@Part@StripeWidth]T);
\coordinate(F)at([xshift=-\@Part@BlockWidth]E);
\coordinate(H)at(current page.south east);
\coordinate(G)at([xshift=-\@Part@BlockWidth]H);
%%右下角色块%%
\path[fill=ColorA,opacity=0.9](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
\end{pgfonlayer}
%%左上角色块坐标%%
\coordinate(I)at([xshift=-\@Part@StripeWidth]B);
\coordinate(J)at(current page.north west);
\coordinate(K)at([yshift=-\@Part@TopOuterBlockLength]J);
\coordinate(L)at([xshift=-\@Part@StripeWidth]C);
%%左上角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](I)--(J)--(K)[rounded corners=2.5mm]--(L)[sharp corners]--cycle;
%%左下角色块坐标%%
\coordinate(M)at([xshift=-\@Part@StripeWidth]F);
\coordinate(N)at([xshift=-\paperwidth]E);
\coordinate(O)at(current page.south west);
\coordinate(P)at([xshift=-\@Part@StripeWidth]G);
%%左下角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](M)[sharp corners]--(N)--(O)--(P)[rounded corners=2.5mm]--cycle;
%%%%
%%章节图片%%
\node[anchor=south west,outer sep=0mm,inner sep=0mm](Pic)at(current page.south west){\@partimage};
%%%%
\begin{pgfonlayer}{@Part@Star@Top}%
\begingroup%
\PartNameFont%
\def\@Part@Star@LabelRadius{\dimexpr0.75\expandafter\baselineskip/2\relax}%
\def\@Part@Star@LabelYShift{\dimexpr0.25\expandafter\baselineskip/2-0.1em\relax}%
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=-\@Part@StripeWidth]R);
\coordinate(X)at([xshift=-\@Part@StripeWidth]S);
%%标题%%
\node[inner sep=0mm,anchor=south east](ZZ)at([yshift=\@Part@StripeWidth+5.0mm]U){%
\tikz{%
\node[inner sep=0mm,outer sep=0mm,anchor=south west](HC1){\@HalfCircle@Label{ColorA}{\@Part@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC2)at(HC1.east){\@HalfCircle@Label{ColorA!80}{\@Part@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC3)at(HC2.east){\@HalfCircle@Label{ColorA!60}{\@Part@Star@LabelRadius}};
\node[align=flush left,inner sep=0mm,outer sep=0mm,anchor=north west,text=ColorA,font=\PartNameFont](PST)at([xshift=0.5cm,yshift=\@Part@Star@LabelYShift]HC3.north east){%
\begin{varwidth}{\textwidth-5.0cm}
\strut#1\strut
\end{varwidth}};}};
\endgroup%
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(ZZ)\ZZWidth
\coordinate(V)at([xshift=-\ZZWidth]U);
\coordinate(W)at([xshift=-\ZZWidth]X);
%%
%%页面中部色块%%
\path[fill=ColorB,opacity=0.5,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=-\@Part@StripeWidth]V);
\coordinate(Z)at([yshift=-\@Part@StripeWidth]K);
\coordinate(YY)at([yshift=\@Part@StripeWidth]N);
\coordinate(ZZ)at([xshift=-\@Part@StripeWidth]W);
%%左侧色块%%
\path[fill=ColorB,opacity=0.2](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%
%%部分副标题%%
\node[align=flush left,anchor=north east,font=\PartNameFont,text=ColorA,inner xsep=0mm](PSST)at([yshift=-\@Part@StripeWidth-0.25cm]X){%
\begin{varwidth}{\textwidth-2.45cm}%
\expandafter\ifblank\expandafter{\@partsubtitle}{\relax}{\strut\@partsubtitle\strut}%要展开宏再进行非空判断
\end{varwidth}};
%%部分简介%%
\node[align=flush left,anchor=north east,font=\itshape\kaiti,text=ColorA,inner xsep=0mm](IT)at([yshift=-0.5cm]PSST.south east){%
\begin{varwidth}{\textwidth-2.45cm}%
\@partintro
\end{varwidth}};
%%部分目录%%
\node[inner sep=0mm,outer sep=0mm,anchor=south west](SC)at([xshift=\@innerlen+5.0mm,yshift=\@botlen]current page.south west){
\begin{varwidth}{\textwidth/2}
\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}
\end{varwidth}};
\end{pgfonlayer}}
%%
%%偶数页布局%%
\NewDocumentCommand{\@Part@Star@EvenPage@Style}{ +m }{
\begin{pgfonlayer}{@Part@Star@Top}
%%右上角色块坐标%%
\coordinate(A)at(current page.north west);
\coordinate(B)at([xshift=\@Part@BlockWidth]current page.north west);
\coordinate(C)at([xshift=\@Part@BlockWidth,yshift=-\@Part@TopOuterBlockLength]current page.north west);
\coordinate(D)at([yshift=-\@Part@TopOuterBlockLength]current page.north west);
%%右上角色块%%
\path[fill=ColorA,opacity=0.9](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\@Part@StripeWidth]D);
\coordinate(R)at([xshift=\@Part@MiddleOuterBlockLength]Q);
\coordinate(T)at([yshift=-\@Part@BlockWidth]Q);
\coordinate(S)at([xshift=\@Part@MiddleOuterBlockLength]T);
%%右侧色块%%
\path[fill=ColorB,opacity=0.2](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\@Part@StripeWidth]T);
\coordinate(F)at([xshift=\@Part@BlockWidth]E);
\coordinate(H)at(current page.south west);
\coordinate(G)at([xshift=\@Part@BlockWidth]H);
%%右下角色块%%
\path[fill=ColorA,opacity=0.9](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
\end{pgfonlayer}
%%左上角色块坐标%%
\coordinate(I)at([xshift=\@Part@StripeWidth]B);
\coordinate(J)at(current page.north east);
\coordinate(K)at([yshift=-\@Part@TopOuterBlockLength]J);
\coordinate(L)at([xshift=\@Part@StripeWidth]C);
%%左上角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](I)--(J)--(K)[rounded corners=2.5mm]--(L)[sharp corners]--cycle;
%%左下角色块坐标%%
\coordinate(M)at([xshift=\@Part@StripeWidth]F);
\coordinate(N)at([xshift=\paperwidth]E);
\coordinate(O)at(current page.south east);
\coordinate(P)at([xshift=\@Part@StripeWidth]G);
%%左下角色块%%
\draw[ColorB!7.5,fill=ColorB!7.5](M)[sharp corners]--(N)--(O)--(P)[rounded corners=2.5mm]--cycle;
%%%%
%%章节图片%%
\node[anchor=south east,outer sep=0mm,inner sep=0mm](Pic)at(current page.south east){\@partimage};
%%%%
\begin{pgfonlayer}{@Part@Star@Top}%
\begingroup%
\PartNameFont%
\def\@Part@Star@LabelRadius{\dimexpr0.75\expandafter\baselineskip/2\relax}%
\def\@Part@Star@LabelYShift{\dimexpr0.25\expandafter\baselineskip/2-0.1em\relax}%
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=\@Part@StripeWidth]R);
\coordinate(X)at([xshift=\@Part@StripeWidth]S);
%%标题%%
\node[inner sep=0mm,anchor=south west](ZZ)at([yshift=\@Part@StripeWidth+5.0mm]U){%
\tikz{%
\node[inner sep=0mm,outer sep=0mm,anchor=south west](HC1){\@HalfCircle@Label{ColorA}{\@Part@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC2)at(HC1.east){\@HalfCircle@Label{ColorA!80}{\@Part@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC3)at(HC2.east){\@HalfCircle@Label{ColorA!60}{\@Part@Star@LabelRadius}};
\node[align=flush left,inner sep=0mm,outer sep=0mm,anchor=north west,text=ColorA,font=\PartNameFont](PST)at([xshift=0.5cm,yshift=\@Part@Star@LabelYShift]HC3.north east){%
\begin{varwidth}{\textwidth-5.0cm}
\strut#1\strut
\end{varwidth}};}};
\endgroup%
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(ZZ)\ZZWidth
\coordinate(V)at([xshift=\ZZWidth]U);
\coordinate(W)at([xshift=\ZZWidth]X);
%%
%%页面中部色块%%
\path[fill=ColorB,opacity=0.5,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=\@Part@StripeWidth]V);
\coordinate(Z)at([yshift=-\@Part@StripeWidth]K);
\coordinate(YY)at([yshift=\@Part@StripeWidth]N);
\coordinate(ZZ)at([xshift=\@Part@StripeWidth]W);
%%左侧色块%%
\path[fill=ColorB,opacity=0.2](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%
%%部分副标题%%
\node[align=flush left,anchor=north west,font=\PartNameFont,text=ColorA,inner xsep=0mm](PSST)at([yshift=-\@Part@StripeWidth-0.25cm]X){%
\begin{varwidth}{\textwidth-2.45cm}%
\expandafter\ifblank\expandafter{\@partsubtitle}{\relax}{\strut\@partsubtitle\strut}%要展开宏再进行非空判断
\end{varwidth}};
%%部分简介%%
\node[align=flush left,anchor=north west,font=\itshape\kaiti,text=ColorA,inner xsep=0mm](IT)at([yshift=-0.5cm]PSST.south west){%
\begin{varwidth}{\textwidth-2.45cm}%
\@partintro
\end{varwidth}};
%%部分目录%%
\node[inner sep=0mm,outer sep=0mm,minimum width=4.0cm,anchor=south east](SC)at([xshift=-\@innerlen-5.0mm,yshift=\@botlen]current page.south east){%
\begin{varwidth}{\textwidth/2}%
\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}
\end{varwidth}};
\end{pgfonlayer}}
%%
%%不编号部分页样式%%
\NewDocumentCommand{\@PartStarStyle}{ +m }{%
\begin{tikzpicture}[remember picture,overlay]
\pgfdeclarelayer{@Part@Star@Top}%
\pgfdeclarelayer{@Part@Star@Bottom}%
\pgfsetlayers{@Part@Star@Bottom,main,@Part@Star@Top}%
%%白色背景%%
\draw[white,fill=white](current page.south west)rectangle(current page.north east);
\ifodd\value{page}%判断奇偶页
\@Part@Star@OddPage@Style{#1}%
\else%
\@Part@Star@EvenPage@Style{#1}%
\fi
\end{tikzpicture}
}
%%
%%编号部分页%%
\newif\if@partnumbermark
\titleformat{\part}
{}{}{0em}
{\startcontents[part]%开启小目录
\@PartStyle{\partlabelfront{\sffamily\thepart}\partlabelback}{#1}%部分样式
\global\@partnumbermarktrue%生成页面底部的部分索引
\thispagestyle{empty}%部分页的页面样式为空白
}
[\global\partintro{}%清空\partintro
\global\partimage{}]%清空\partimage
%%不编号部分页%%
\titleformat{name=\part,numberless}
{}{}{0em}
{\startcontents[part]%开启小目录
\@PartStarStyle{#1}%部分样式
\global\@partnumbermarktrue%生成页面底部的部分索引
\thispagestyle{empty}%部分页的页面样式为空白
}
[\global\partintro{}%清空\partintro
\global\partimage{}%清空\partimage
\global\partsubtitle{}]%清空\partsubtitle
%%间距设置%%
\titlespacing*{\part}{0pt}{0pt}{0pt}
%%页面风格设置%%
\assignpagestyle{\part}{SubPage}%部分页后面的空白页样式设置

%%为\part*添加短页眉%%
\NewCommandCopy{\OriginPart}{\part}
\RenewDocumentCommand{\part}{s +O{#3} +m}{
\IfBooleanTF{#1}
{\OriginPart*{#3\@mkboth{\@subtitle}{\@subtitle}}
\extramarks{#2}{#2}
}{\if@mainmatter%
\OriginPart[#2]{#3\@mkboth{\@subtitle}{\@subtitle}}
\extramarks{\partlabelfront{\sffamily\thepart}\partlabelback\quad#2}{\partlabelfront{\sffamily\thepart}\partlabelback\quad#2}%
\else%
\phantomsection%
\OriginPart*{#3\@mkboth{\@subtitle}{\@subtitle}\addcontentsline{toc}{part}{#2}}%
\extramarks{#2}{#2}
\fi}
}
%%部分结束命令%%
\newcommand{\PartEnd}{\stopcontents[part]}

%%章节页样式%%
\newlength{\@Chapter@BlockHeight}
\newlength{\@Chapter@VSpace}
\newlength{\@Chapter@StripeWidth}
\newlength{\@Chapter@LabelSep}
\newlength{\@Chapter@LabelYShift@Down}
\newlength{\@Chapter@PageSize}
\newlength{\@Chapter@SayingBlockWidth}
\newlength{\@Chapter@LabelYShift@Up}
\setlength{\@Chapter@StripeWidth}{0.35cm}
\setlength{\@Chapter@LabelSep}{0.5cm}
\setlength{\@Chapter@LabelYShift@Down}{0.65cm}
\setlength{\@Chapter@LabelYShift@Up}{0.5cm}
\setlength{\@Chapter@PageSize}{1.1cm}
\setlength{\@Chapter@SayingBlockWidth}{\@FrameWidth+1.0cm}
%%%%
\newcommand{\chaptersaying}[1]{\long\def\@chaptersaying{#1}}
\newcommand{\chaptersubtitle}[1]{\long\def\@chaptersubtitle{#1}}
\newcommand{\chapterimage}[1]{\long\def\@chapterimage{#1}}
\chaptersaying{}
\chaptersubtitle{}
\chapterimage{}
%%编号章节页样式%%
\NewDocumentCommand{\@ChapterStyle}{ +m +m }{
\begin{tikzpicture}[remember picture,overlay]
\pgfdeclarelayer{@Chapter@Top}
\pgfdeclarelayer{@Chapter@Bottom}
\pgfsetlayers{@Chapter@Bottom,main,@Chapter@Top}
\ifodd\value{page}%判断奇偶页
%%坐标%%
\coordinate(A)at(current page.north west);
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
\coordinate(D)at(current page.south west);
\coordinate(E)at([xshift=\@GutterWidth,yshift=\@Chapter@SayingBlockWidth]D);
\coordinate(F)at([xshift=-5.0cm,yshift=\@Chapter@SayingBlockWidth]C);
\coordinate(G)at([xshift=-3.0cm,yshift=\@FrameWidth]C);
\coordinate(H)at([xshift=-\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(N)at([yshift=\@Chapter@LabelYShift@Up]current page text area.north east);
\coordinate(Q1)at([xshift=-1.75cm,yshift=1.75cm]C);
\coordinate(Q2)at([xshift=\@Chapter@PageSize,yshift=-\@Chapter@PageSize]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
\begin{pgfonlayer}{@Chapter@Top}
%%编号%%
\draw[ColorA,fill=ColorA,sharp corners]node[append after command={(T.south west)[rounded corners=2.5mm]--(T.south east)[sharp corners]--([yshift=\@toplen-\@Chapter@LabelYShift@Up]T.north east)--([yshift=\@toplen-\@Chapter@LabelYShift@Up]T.north west)[rounded corners=2.5mm]--cycle},anchor=north east,font=\ChapterLabelFont,text=white,inner xsep=\@Chapter@LabelSep,inner ysep=0mm,outer sep=0mm](T)at([yshift=\@Chapter@LabelYShift@Up]N){
\begin{varwidth}{\textwidth/3}
\strut#1\strut
\end{varwidth}};
%%渐变带%%
\path[fill=ColorB,opacity=0.4]([xshift=\@outerlen,yshift=-3\@Chapter@LabelYShift@Down/4]T.south east)rectangle([xshift=-\@innerlen-\textwidth,yshift=-3\@Chapter@LabelYShift@Down/4-\@Chapter@StripeWidth]T.south east);
%%标题%%
\node[inner sep=0mm,anchor=north east,font=\ChapterNameFont,text=ColorA](P)at([yshift=-4\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]T.south east){\begin{varwidth}{\textwidth}
\strut#2\strut
\end{varwidth}};
\end{pgfonlayer}
%%%%
\coordinate(I)at([xshift=\@outerlen-\@FrameWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south east);
\coordinate(J)at([xshift=-\@innerlen-\textwidth+\@GutterWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south east);
%%%%
%%获取标题区域的高度%%
\pgfgetdistance(A)(J)\DistanceAJ
\gsetlength{\@Chapter@BlockHeight}{\DistanceAJ}
\gsetlength{\@Chapter@VSpace}{\@Chapter@BlockHeight-\@toplen-0.8cm}
\begin{pgfonlayer}{@Chapter@Bottom}
%%框架1%%
\draw[ColorB!7.5,fill=ColorB!7.5,sharp corners](A)rectangle(C);
%%章节图片%%
\node[anchor=north west,outer sep=0mm,inner sep=0mm](U)at(A){\@chapterimage};
%%框架2%%
\draw[white,fill=white](J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=0,out=180]to(F)[sharp corners]--(E)--cycle;
\end{pgfonlayer}
%%
\begin{pgfonlayer}{@Chapter@Top}
%%底部文字%%
\node[anchor=west,font=\ChapterSayingFont,text=ColorA,text width=\paperwidth-\@innerlen-5.0cm,inner sep=0mm,outer sep=0mm](S)at([xshift=\@innerlen,yshift=\@FrameWidth/2+0.5cm]D){\@chaptersaying};
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=2.0mm](Q1)rectangle(Q2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\@Chapter@PageSize-0.3cm}{!}{\thepage}};
\end{pgfonlayer}
\else
\coordinate(A)at(current page.north east);
\coordinate(B)at(current page.north west);
\coordinate(C)at(current page.south west);
\coordinate(D)at(current page.south east);
\coordinate(E)at([xshift=-\@GutterWidth,yshift=\@Chapter@SayingBlockWidth]D);
\coordinate(F)at([xshift=5.0cm,yshift=\@Chapter@SayingBlockWidth]C);
\coordinate(G)at([xshift=3.0cm,yshift=\@FrameWidth]C);
\coordinate(H)at([xshift=\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(N)at([yshift=\@Chapter@LabelYShift@Up]current page text area.north west);
\coordinate(Q1)at([xshift=1.75cm,yshift=1.75cm]C);
\coordinate(Q2)at([xshift=-\@Chapter@PageSize,yshift=-\@Chapter@PageSize]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
\begin{pgfonlayer}{@Chapter@Top}
%%编号%%
\draw[ColorA,fill=ColorA,sharp corners]node[append after command={(T.south west)[rounded corners=2.5mm]--(T.south east)[sharp corners]--([yshift=\@toplen-\@Chapter@LabelYShift@Up]T.north east)--([yshift=\@toplen-\@Chapter@LabelYShift@Up]T.north west)[rounded corners=2.5mm]--cycle},anchor=north west,font=\ChapterLabelFont,text=white,inner xsep=\@Chapter@LabelSep,inner ysep=0mm,outer sep=0mm](T)at([yshift=\@Chapter@LabelYShift@Up]N){%
\begin{varwidth}{\textwidth/3}%
\strut#1\strut
\end{varwidth}};
%%渐变带%%
\path[fill=ColorB,opacity=0.4]([xshift=-\@outerlen,yshift=-3\@Chapter@LabelYShift@Down/4]T.south west)rectangle([xshift=\@innerlen+\textwidth,yshift=-3\@Chapter@LabelYShift@Down/4-\@Chapter@StripeWidth]T.south west);
%%标题%%
\node[inner sep=0mm,anchor=north west,font=\ChapterNameFont,text=ColorA](P)at([yshift=-4\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]T.south west){\begin{varwidth}{\textwidth}
\strut#2\strut
\end{varwidth}};
\end{pgfonlayer}
%%%%
\coordinate(I)at([xshift=-\@outerlen+\@FrameWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south west);
\coordinate(J)at([xshift=\@innerlen+\textwidth-\@GutterWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south west);
%%%%
%%获取标题区域的高度%%
\pgfgetdistance(A)(J)\DistanceAJ
\gsetlength{\@Chapter@BlockHeight}{\DistanceAJ}
\gsetlength{\@Chapter@VSpace}{\@Chapter@BlockHeight-\@toplen-0.8cm}
\begin{pgfonlayer}{@Chapter@Bottom}
%%框架1%%
\draw[ColorB!7.5,fill=ColorB!7.5,sharp corners](A)rectangle(C);
%%章节图片%%
\node[anchor=north east,outer sep=0mm,inner sep=0mm](U)at(A){\@chapterimage};
%%框架2%%
\draw[white,fill=white](J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=180,out=0]to(F)[sharp corners]--(E)--cycle;
\end{pgfonlayer}
%%
\begin{pgfonlayer}{@Chapter@Top}
%%底部文字%%
\node[anchor=east,font=\ChapterSayingFont,text=ColorA,text width=\paperwidth-\@innerlen-5.0cm,inner sep=0mm,outer sep=0mm](S)at([xshift=-\@innerlen,yshift=\@FrameWidth/2+0.5cm]D){\@chaptersaying};
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=2.0mm](Q1)rectangle(Q2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\@Chapter@PageSize-0.3cm}{!}{\thepage}};
\end{pgfonlayer}
\fi
\end{tikzpicture}
}
%%
%%不编号章节样式%%
\newlength{\@Chapter@Star@LabelNameXSep}
\newlength{\@Chapter@Star@LabelYShift@Up}
\newlength{\@Chapter@Star@SayingBlockWidth}
\setlength{\@Chapter@Star@LabelNameXSep}{4.0mm}
\setlength{\@Chapter@Star@LabelYShift@Up}{5.0mm}
\setlength{\@Chapter@Star@SayingBlockWidth}{\@FrameWidth+1.0cm}
\NewDocumentCommand{\@ChapterStarStyle}{ +m +m }{
\begin{tikzpicture}[remember picture,overlay]
\pgfdeclarelayer{@Chapter@Star@Top}
\pgfdeclarelayer{@Chapter@Star@Bottom}
\pgfsetlayers{@Chapter@Star@Bottom,main,@Chapter@Star@Top}
\ifodd\value{page}%判断奇偶页
%%坐标点%%
\coordinate(A)at(current page.north west);
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
\coordinate(D)at(current page.south west);
\coordinate(E)at([xshift=\@GutterWidth,yshift=\@Chapter@Star@SayingBlockWidth]D);
\coordinate(F)at([xshift=-5.0cm,yshift=\@Chapter@Star@SayingBlockWidth]C);
\coordinate(G)at([xshift=-3.0cm,yshift=\@FrameWidth]C);
\coordinate(H)at([xshift=-\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(N)at([yshift=\@Chapter@Star@LabelYShift@Up]current page text area.north west);
\coordinate(Q1)at([xshift=-1.75cm,yshift=1.75cm]C);
\coordinate(Q2)at([xshift=\@Chapter@PageSize,yshift=-\@Chapter@PageSize]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
%%
\begin{pgfonlayer}{@Chapter@Star@Top}%
\begingroup%
\ChapterLabelFont%
\def\@Chapter@Star@LabelRadius{\dimexpr0.75\expandafter\baselineskip/2\relax}%
\def\@Chapter@Star@LabelYShift{\dimexpr0.25\expandafter\baselineskip/2-0.1em\relax}%
%%标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north west,text width=\textwidth,align=flush left](TT)at([yshift=\@Chapter@Star@LabelYShift@Up]N){%
\tikz{%
\node[inner sep=0mm,outer sep=0mm,anchor=north west](P1){\@HalfCircle@Label{ColorA}{\@Chapter@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](P2)at(P1.east){\@HalfCircle@Label{ColorA!80}{\@Chapter@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=north west,text=ColorA,font=\ChapterLabelFont](P3)at([xshift=\@Chapter@Star@LabelNameXSep,yshift=\@Chapter@Star@LabelYShift]P2.north east){
\begin{varwidth}{\textwidth-2\@Chapter@Star@LabelRadius-\@Chapter@Star@LabelNameXSep}
\strut#1\strut
\end{varwidth}};}};
\endgroup%
%%
%%渐变带%%
\path[fill=ColorB,opacity=0.4]([xshift=-\@innerlen,yshift=-3\@Chapter@LabelYShift@Down/4]TT.south west)rectangle([xshift=\@outerlen,yshift=-3\@Chapter@LabelYShift@Down/4-\@Chapter@StripeWidth]TT.south east);
%%
%%副标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north east,text=ColorA,font=\ChapterNameFont,align=flush right](P)at([yshift=-4\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]TT.south east){
\begin{varwidth}{2\textwidth/3}
\strut#2\strut
\end{varwidth}};
\end{pgfonlayer}
%%%%
\coordinate(I)at([xshift=\@outerlen-\@FrameWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south east);
\coordinate(J)at([xshift=-\textwidth-\@innerlen+\@GutterWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south east);
%%%%
%%获取标题区域的高度%%
\pgfgetdistance(A)(J)\DistanceAJ
\gsetlength{\@Chapter@BlockHeight}{\DistanceAJ}
\gsetlength{\@Chapter@VSpace}{\@Chapter@BlockHeight-\@toplen-0.8cm}
\begin{pgfonlayer}{@Chapter@Star@Bottom}
%%框架1%%
\draw[ColorB!7.5,fill=ColorB!7.5,sharp corners](A)rectangle(C);
%%章节图片%%
\node[anchor=north west,outer sep=0mm,inner sep=0mm](U)at(A){\@chapterimage};
%%框架2%%
\draw[white,fill=white](J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=0,out=180]to(F)[sharp corners]--(E)--cycle;
\end{pgfonlayer}
%%
\begin{pgfonlayer}{@Chapter@Star@Top}
%%底部文字%%
\node[anchor=west,font=\ChapterSayingFont,text=ColorA,text width=\paperwidth-\@innerlen-5.0cm,inner sep=0mm,outer sep=0mm](S)at([xshift=\@innerlen,yshift=\@FrameWidth/2+0.5cm]D){\@chaptersaying};
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=2.0mm](Q1)rectangle(Q2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\@Chapter@PageSize-0.3cm}{!}{\thepage}};
\end{pgfonlayer}
\else
%%坐标点%%
\coordinate(A)at(current page.north east);
\coordinate(B)at(current page.north west);
\coordinate(C)at(current page.south west);
\coordinate(D)at(current page.south east);
\coordinate(E)at([xshift=-\@GutterWidth,yshift=\@Chapter@Star@SayingBlockWidth]D);
\coordinate(F)at([xshift=5.0cm,yshift=\@Chapter@Star@SayingBlockWidth]C);
\coordinate(G)at([xshift=3.0cm,yshift=\@FrameWidth]C);
\coordinate(H)at([xshift=\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(N)at([yshift=\@Chapter@Star@LabelYShift@Up]current page text area.north east);
\coordinate(Q1)at([xshift=1.75cm,yshift=1.75cm]C);
\coordinate(Q2)at([xshift=-\@Chapter@PageSize,yshift=-\@Chapter@PageSize]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
%%
\begin{pgfonlayer}{@Chapter@Star@Top}%
\begingroup%
\ChapterLabelFont%
\def\@Chapter@Star@LabelRadius{\dimexpr0.75\expandafter\baselineskip/2\relax}%
\def\@Chapter@Star@LabelYShift{\dimexpr0.25\expandafter\baselineskip/2-0.1em\relax}%
%%标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north east,text width=\textwidth,align=flush right](TT)at(N){%
\tikz{%
\node[inner sep=0mm,outer sep=0mm,anchor=north west](P1){\@HalfCircle@Label{ColorA}{\@Chapter@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](P2)at(P1.east){\@HalfCircle@Label{ColorA!80}{\@Chapter@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=north west,text=ColorA,font=\ChapterLabelFont](P3)at([xshift=\@Chapter@Star@LabelNameXSep,yshift=\@Chapter@Star@LabelYShift]P2.north east){
\begin{varwidth}{\textwidth-2\@Chapter@Star@LabelRadius-\@Chapter@Star@LabelNameXSep}
\strut#1\strut
\end{varwidth}};
}};
\endgroup%
%%
%%渐变带%%
\path[fill=ColorB,opacity=0.4]([xshift=\@innerlen,yshift=-3\@Chapter@LabelYShift@Down/4]TT.south east)rectangle([xshift=-\@outerlen,yshift=-3\@Chapter@LabelYShift@Down/4-\@Chapter@StripeWidth]TT.south west);
%%
%%副标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north west,text=ColorA,font=\ChapterNameFont,align=flush left](P)at([yshift=-4\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]TT.south west){
\begin{varwidth}{2\textwidth/3}
\strut#2\strut
\end{varwidth}};
\end{pgfonlayer}
%%%%
\coordinate(I)at([xshift=-\@outerlen+\@FrameWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south west);
\coordinate(J)at([xshift=\textwidth+\@innerlen-\@GutterWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south west);
%%%%
%%获取标题区域的高度%%
\pgfgetdistance(A)(J)\DistanceAJ
\gsetlength{\@Chapter@BlockHeight}{\DistanceAJ}
\gsetlength{\@Chapter@VSpace}{\@Chapter@BlockHeight-\@toplen-0.8cm}
\begin{pgfonlayer}{@Chapter@Star@Bottom}
%%框架1%%
\draw[ColorB!7.5,fill=ColorB!7.5,sharp corners](A)rectangle(C);
%%章节图片%%
\node[anchor=north east,outer sep=0mm,inner sep=0mm](U)at(A){\@chapterimage};
%%框架2%%
\draw[white,fill=white](J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[rounded corners=2.5mm]--(G)[in=180,out=0]to(F)[sharp corners]--(E)--cycle;
\end{pgfonlayer}
%%
\begin{pgfonlayer}{@Chapter@Star@Top}
%%底部文字%%
\node[anchor=east,font=\ChapterSayingFont,text=ColorA,text width=\paperwidth-\@innerlen-5.0cm,inner sep=0mm,outer sep=0mm](S)at([xshift=-\@innerlen,yshift=\@FrameWidth/2+0.5cm]D){\@chaptersaying};
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=2.0mm](Q1)rectangle(Q2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\@Chapter@PageSize-0.3cm}{!}{\thepage}};
\end{pgfonlayer}
\fi
\end{tikzpicture}
}

%%侧标更新规则%%
\newcommand{\@Thumb@Update@Rule}{
\stepcounter{@Thumb@Number}%侧标数计数
\ifnum\value{@Thumb@Number}=1%
\relax%
\else%
\gaddtolength{\MarkY}{-\SepH}%更新侧标位置
\fi%
}

%%编号章节页%%
\titleformat{\chapter}
{}{}{0em}
{\@Thumb@Update@Rule%
\@ChapterStyle{\chapterlabelfront{\sffamily\thechapter}\chapterlabelback}{#1}%章样式
\enlargethispage{-0.75cm}%修改页面大小
}
[\global\chapterimage{}%清空\chapterimage
\global\chaptersaying{}]%清空\chaptersaying
%%不编号章节页%%
\titleformat{name=\chapter,numberless}
{}{}{0em}
{\@Thumb@Update@Rule%
\@ChapterStarStyle{#1}{\@chaptersubtitle}%章样式
\enlargethispage{-0.75cm}%修改页面大小
}
[\global\chaptersubtitle{}%清空\chaptersubtitle
\global\chapterimage{}%清空\chapterimage
\global\chaptersaying{}]%清空\chaptersaying
%%间距设置%%
\titlespacing*{\chapter}{0pt}{0pt}{0pt}
%%页面风格设置%%
\assignpagestyle{\chapter}{empty}

%%为\chapter*添加短页眉%%
\NewCommandCopy{\OriginChapter}{\chapter}
%%
\RenewDocumentCommand{\chapter}{s +O{#3} +m}{%
\IfBooleanTF{#1}%
{\OriginChapter*{#3\@mkboth{#2}{#2}}}%
{\OriginChapter[#2]{#3}}%
\addvspace{\@Chapter@VSpace}%
}

%%节样式%%
%%编号节样式%%
\newlength{\@Section@LabelXSep}
\newlength{\@Section@LabelNameXSep}
\setlength{\@Section@LabelXSep}{2.0mm}
\setlength{\@Section@LabelNameXSep}{7.5mm}
%%
\newlength{\@Section@Star@LabelXSep}
\newlength{\@Section@Star@LabelNameXSep}
\setlength{\@Section@Star@LabelXSep}{2.5mm}
\setlength{\@Section@Star@LabelNameXSep}{5.0mm}
%%编号节样式%%
\titleformat{\section}[hang]{%
\vspace*{0.5cm}%
\SectionFont%
\def\@Section@LabelRadius{\dimexpr\baselineskip/2\relax}}{%
\sectionlabelfront%
\hspace{\@Section@LabelXSep}%
\tikz[baseline=-0.4em]{%
\draw[ColorA,fill=ColorA](0,0)circle(\@Section@LabelRadius);
\node[circle,outer sep=0mm,inner sep=0mm,font=\SectionFont\sffamily,text=white]at(0,0){\maxsizebox{2\@Section@LabelRadius}{!}{\thesection}};}%
\hspace{\@Section@LabelXSep}%
\sectionlabelback%
}{\@Section@LabelNameXSep}{#1}
%%不编号节样式%%
\titleformat{name=\section,numberless}[hang]{%
\vspace*{0.5cm}%
\SectionFont\color{ColorA}%
\def\@Section@Star@LabelRadius{\dimexpr\baselineskip/2\relax}}{%
\tikz[baseline=-0.4em]{%
\draw[ColorA!50,fill=ColorA!50](0,0)circle(\@Section@Star@LabelRadius);
\draw[white,fill=ColorA,line width=2.75pt](0,0)circle(7*\@Section@Star@LabelRadius/12);
}}{\@Section@Star@LabelNameXSep}{#1}
%%间距设置%%
\titlespacing*{\section}{0pt}{0pt}{2.0cm}
%%修改章节断页方式，使\section另起一页，而\section*不换页，并且为\section*添加短页眉%%
\NewCommandCopy{\OriginSection}{\section}
\RenewDocumentCommand{\section}{s +O{#3} +m}{%
\IfBooleanTF{#1}
{\OriginSection*{#3\markright{#2}}}
{\if@mainmatter%
\clearpage\OriginSection[#2]{#3}%
\else%
\phantomsection
\OriginSection*{#3\markright{#2}\addcontentsline{toc}{section}{#2}}%
\fi}}

%%小节标题样式%%
%%编号小节标题样式%%
%%设置\subsection的标题%%
\newlength{\@Subsection@LabelCriticWidth}
\newlength{\@Subsection@LabelHSkip}
\setlength{\@Subsection@LabelCriticWidth}{4.0cm}
\setlength{\@Subsection@LabelHSkip}{1.6em}
%%%%
\NewDocumentCommand{\@SubsectionStyle}{ +m +m +m }{%
\begingroup%
\raggedright%
\begin{tikzpicture}%
\SubsectionFont%
\def\@Subsection@Radius{\dimexpr\baselineskip/2\relax}%0.9
\def\@Subsection@BRadius{\dimexpr\baselineskip/2+6.5pt\relax}
\pgfdeclarelayer{@Subsection@Bottom}%
\pgfsetlayers{@Subsection@Bottom,main}%
\node[text=white,font=\SubsectionFont,inner xsep=\@Subsection@Radius,inner ysep=0mm,outer sep=0mm](L){%
\begin{varwidth}{\@Subsection@LabelCriticWidth}
%\AdjustStrut{0.9}%
\strut#1\strut
\end{varwidth}%
\hspace*{\@Subsection@LabelHSkip}};
\pgfgetnodewidth(L)\@Subsection@LabelWidth
%%
\node[text=ColorA,font=\SubsectionFont,inner xsep=\@Subsection@Radius,inner ysep=0mm,outer sep=0mm,minimum width=\linewidth-\@Subsection@LabelWidth,anchor=north west](N)at(L.north east){\hspace*{\@Subsection@LabelHSkip}%
\begin{minipage}{\linewidth-\@Subsection@LabelWidth-2\@Subsection@Radius-\@Subsection@LabelHSkip}
%\AdjustStrut{0.9}%
\strut#2\strut
\end{minipage}};
\pgfgetnodeheight(N)\@Subsection@NameHeight
%%
\begin{pgfonlayer}{@Subsection@Bottom}
\path[fill=ColorA,rounded corners=\@Subsection@Radius](L.north west)rectangle(L.south east);
\draw[white,fill=white]([yshift=-\@Subsection@Radius]L.north east)circle(\@Subsection@BRadius);
\ifdim\@Subsection@NameHeight>\dimexpr2\@Subsection@Radius\relax
\path[fill=ColorB!7.5](N.north east)[sharp corners]--(N.north west)[rounded corners=\@Subsection@Radius]--(N.south west)--(N.south east)--cycle;
\else
\path[fill=ColorB!7.5](N.north east)[sharp corners]--(N.north west)--(N.south west)[rounded corners=\@Subsection@Radius]--(N.south east)--cycle;
\fi
\draw[ColorA,line width=4.0pt,fill=white]([yshift=-\@Subsection@Radius]L.north east)circle(\@Subsection@Radius);
\node[circle,text=ColorA,inner sep=0mm,outer sep=0mm](Num)at([yshift=-\@Subsection@Radius]L.north east){\maxsizebox{2\@Subsection@Radius}{!}{\sffamily#3}};
\end{pgfonlayer}
\end{tikzpicture}%
\endgroup}
%%%%
%%不编号小节标题样式%%
%%不编号小节副标题%%
\newcommand{\subsectionsubtitle}[1]{\long\def\@subsectionsubtitle{#1}}
\subsectionsubtitle{}
%%%%
\newlength{\@Subsection@Star@LabelCriticWidth}
\setlength{\@Subsection@Star@LabelCriticWidth}{4.0cm}
%%%%
\NewDocumentCommand{\@SubsectionStarStyle}{ +m +m }{%
\begingroup%
\raggedright%
\begin{tikzpicture}%
\SubsectionFont%
\def\@Subsection@Star@Radius{\dimexpr\baselineskip/2\relax}%0.9
\def\@Subsection@Star@BRadius{\dimexpr\baselineskip/2+6.5pt\relax}
\def\@Subsection@Star@SRadius{\dimexpr\baselineskip/2+2.0pt\relax}
%%%%
\pgfdeclarelayer{@Subsection@Star@Bottom}%
\pgfsetlayers{@Subsection@Star@Bottom,main}%
\node[text=white,font=\SubsectionFont,inner xsep=\@Subsection@Star@Radius,inner ysep=0mm,outer sep=0mm](L){%
\hspace*{\@Subsection@Star@Radius+0.5em}%
\begin{varwidth}{\@Subsection@Star@LabelCriticWidth}
%\AdjustStrut{0.9}%
\strut#1\strut
\end{varwidth}};%
\pgfgetnodewidth(L)\@Subsection@Star@LabelWidth%
\pgfgetnodeheight(L)\@Subsection@Star@LabelHeight%
%%
\node[text=ColorA,font=\SubsectionFont,inner xsep=\@Subsection@Star@Radius,inner ysep=0mm,outer sep=0mm,anchor=north west](N)at(L.north east){%
\begin{minipage}{\linewidth-\@Subsection@Star@LabelWidth-2\@Subsection@Star@Radius-\@Subsection@Star@SRadius}
%\AdjustStrut{0.9}%
\strut#2\strut
\end{minipage}};
\pgfgetnodeheight(N)\@Subsection@Star@NameHeight%
%%
\begin{pgfonlayer}{@Subsection@Star@Bottom}
\ifdim\@Subsection@Star@NameHeight>\@Subsection@Star@LabelHeight
\path[fill=ColorB!7.5,rounded corners=\@Subsection@Star@Radius](L.north west)rectangle(N.south east);
%
\path[fill=ColorA,rounded corners=\@Subsection@Star@Radius](L.north west)rectangle(N.south west);
\else
\path[fill=ColorB!7.5,rounded corners=\@Subsection@Star@Radius](L.south west)rectangle(N.north east);
%
\path[fill=ColorA,rounded corners=\@Subsection@Star@Radius](L.south west)rectangle(N.north west);
\fi
%%
\coordinate(CC)at([yshift=-\@Subsection@Star@Radius]L.north west);
\draw[white,fill=white,sharp corners](CC)--([yshift=\@Subsection@Star@BRadius]CC)arc(90:-90:\@Subsection@Star@BRadius)--cycle;
\draw[ColorA,fill=ColorA](CC)circle(\@Subsection@Star@SRadius);
\draw[white,line width=4.0pt,fill=ColorA](CC)circle(2*\@Subsection@Star@Radius/3);
\end{pgfonlayer}
\end{tikzpicture}%
\endgroup}

%%%%
%%编号小节样式%%
\titleformat{\subsection}
{}{}{0mm}
{\@SubsectionStyle{\subsectionlabelfront}{#1}{\thesubsection}}
%%不编号小节样式%%
\titleformat{name=\subsection,numberless}
{}{}{0mm}
{\@SubsectionStarStyle{#1}{\@subsectionsubtitle}}
[\global\subsectionsubtitle{}]%清空\subsectionsubtitle
%%间距设置%%
\titlespacing*{\subsection}{0pt}{1.5ex plus 0.5ex minus 0.2ex}{1ex plus 0.1ex}
%%%%
\NewCommandCopy{\OriginSubsection}{\subsection}
\RenewDocumentCommand{\subsection}{s +O{#3} +m}{%
\IfBooleanTF{#1}
{\OriginSubsection*{#3}}
{\if@mainmatter%
\OriginSubsection[#2]{#3}%
\else%
\phantomsection
\OriginSubsection*{#3\addcontentsline{toc}{subsection}{#2}}%
\fi}}
%%%%
%%点样式%%
\newlength{\@Subsubsection@LabelNameXSep}
\setlength{\@Subsubsection@LabelNameXSep}{2.5mm}
%%
\titleformat{\subsubsection}[hang]{%
\SubsubsectionFont\color{ColorB}%
\def\@Subsubsection@LabelRadius{0.6em}}{%
\tikz[baseline=-0.4em]{
\node[outer sep=0mm,inner sep=0mm]{\@HalfCircle@Label{ColorB}{\@Subsubsection@LabelRadius}};}
}{\@Subsubsection@LabelNameXSep}{#1}
%%
\titleformat{name=\subsubsection,numberless}[hang]{%
\SubsubsectionFont\color{ColorB}%
\def\@Subsubsection@LabelRadius{0.6em}}{%
\tikz[baseline=-0.4em]{
\node[outer sep=0mm,inner sep=0mm]{\@HalfCircle@Label{ColorB}{\@Subsubsection@LabelRadius}};}
}{\@Subsubsection@LabelNameXSep}{#1}
%%间距设置%%
\titlespacing*{\subsubsection}{0pt}{5.0mm}{5.0mm}
%%修改段落样式%%
\renewcommand{\paragraph}{
\@startsection{paragraph}{4}{\z@}
{3.25ex \@plus1.0ex \@minus0.2ex}{-1em}
{\ParagraphNameFont\color{ColorA}}}
%%%%
%%练习标题设置%%
\newlength{\@ComplexHeading@LabelCriticWidth}
\setlength{\@ComplexHeading@LabelCriticWidth}{4.0cm}
\NewDocumentCommand{\ComplexHeading}{m +m +m}{%
\begingroup%
\begin{flushleft}%
\begin{tikzpicture}%
\SubsectionFont%
\def\@ComplexHeading@Radius{\dimexpr\baselineskip/2\relax}%
%%%%
\pgfdeclarelayer{@ComplexHeading@Bottom}%
\pgfsetlayers{@ComplexHeading@Bottom,main}%
\node[text=white,inner xsep=\@ComplexHeading@Radius,inner ysep=0mm,outer sep=0mm](L){%
\hspace*{\@ComplexHeading@Radius+0.5em}%
\begin{varwidth}{\@ComplexHeading@LabelCriticWidth}
\strut#1\strut
\end{varwidth}};%
\pgfgetnodewidth(L)\@ComplexHeading@LabelWidth%
\pgfgetnodeheight(L)\@ComplexHeading@LabelHeight%
%%
\node[text=ColorB,inner xsep=\@ComplexHeading@Radius,inner ysep=0mm,outer sep=0mm,anchor=north west](N)at(L.north east){%
\begin{minipage}{\linewidth-\@ComplexHeading@LabelWidth-2\@ComplexHeading@Radius}
\strut#2\strut
\end{minipage}};
\pgfgetnodeheight(N)\@ComplexHeading@NameHeight%
%%
\begin{pgfonlayer}{@ComplexHeading@Bottom}
\ifdim\@ComplexHeading@NameHeight>\@ComplexHeading@LabelHeight
\path[fill=ColorA!7.5,rounded corners=\@ComplexHeading@Radius](L.north west)rectangle(N.south east);
%
\path[fill=ColorB,rounded corners=\@ComplexHeading@Radius](L.north west)rectangle(N.south west);
\else
\path[fill=ColorA!7.5,rounded corners=\@ComplexHeading@Radius](L.south west)rectangle(N.north east);
%
\path[fill=ColorB,rounded corners=\@ComplexHeading@Radius](L.south west)rectangle(N.north west);
\fi
\end{pgfonlayer}%
\coordinate(C)at([xshift=\@ComplexHeading@Radius,yshift=-\@ComplexHeading@Radius]L.north west);
\draw[ColorB,fill=white](C)circle(\@ComplexHeading@Radius-2.5pt);
\node[circle,text=ColorB,inner sep=0mm,outer sep=0mm,font=\MainFont](F)at(C){\centering#3};
\end{tikzpicture}%
\end{flushleft}%
\endgroup}
%%%%
\NewDocumentCommand{\AdjustiveHeading}{ +m }{
\begin{center}
\begin{tikzpicture}%
\HeadingFont%
\def\@AdjustiveHeading@Radius{\dimexpr\baselineskip/2\relax}%
\pgfdeclarelayer{@AdjustiveHeading@Bottom}%
\pgfsetlayers{@AdjustiveHeading@Bottom,main}%
\node[draw=ColorB!75,fill=ColorB!75,rounded corners,text=white,outer sep=0mm,inner xsep=0.5em,inner ysep=0mm,align=center](E){%
\begin{varwidth}{\linewidth/2}
\strut#1\strut
\end{varwidth}};
\begin{pgfonlayer}{@AdjustiveHeading@Bottom}
\draw[draw=ColorB!50,fill=ColorB!50,line width=6.0pt,rounded corners=\@AdjustiveHeading@Radius]([xshift=-\@AdjustiveHeading@Radius]E.north west)rectangle([xshift=\@AdjustiveHeading@Radius]E.south east);
\end{pgfonlayer}
\end{tikzpicture}
\end{center}
}
%%%%
%%索引分组标题样式%%
\newcommand{\LongHeading}[1]{%
\begingroup%
\centering\tikz{%
\node[font=\HeadingFont,text=ColorA,draw=ColorB!7.5,fill=ColorB!7.5,ultra thick,rounded corners,inner sep=0mm](P){%
\hspace*{1.5mm}%
\parbox{\linewidth-3.0mm}{\centering\strut#1\strut}%
\hspace*{1.5mm}%
};}
\endgroup}
%%%%
%%习题标题设置%%
\def\@Exercise@Title{课后习题}
\def\@Thinking@Title{思考题}
\def\@Improve@Title{复习与提高}
%%%%
\NewDocumentCommand{\Exercise}{s}{%
\IfBooleanTF{#1}{%
\subsection*{\@Exercise@Title}%
}{%
\subsection*{\@Exercise@Title%
\if@mainmatter%
~\sffamily\@Environment@Mark\the@prenumber%
\fi}%
}%
}
%%%%
\NewDocumentCommand{\Thinking}{s}{%
\IfBooleanTF{#1}{%
\subsection*{\@Thinking@Title}%
}{%
\subsection*{\@Thinking@Title%
\if@mainmatter%
~\sffamily\@Environment@Mark\the@prenumber%
\fi}%
}%
}
%%%%
\NewDocumentCommand{\Improve}{s}{%
\IfBooleanTF{#1}{%
\subsection*{\@Improve@Title}%
}{%
\subsection*{\@Improve@Title%
\if@mainmatter%
~\sffamily\thechapter%
\fi}%
}%
}
%%%%
\newcommand{\Basis}{%
\ComplexHeading{基础巩固}{\hfill 用时：\underline{\qquad}}{\faPen}%
}
%%%%
\newcommand{\Complex}{%
\ComplexHeading{综合提升}{\hfill 用时：\underline{\qquad}}{\faStar}%
}
%%%%
\newcommand{\NoteArea}{%
\marginpar{\upshape\LongHeading{\faPenSquare~~笔记区}}
}
%%%%
\newcommand{\Listening}{%
\AdjustiveHeading{\faMusic~~听力模块}
}
%%%%
\newcommand{\Reading}{%
\AdjustiveHeading{\faBookReader~~阅读模块}
}
%%%%
\newcommand{\Speaking}{%
\AdjustiveHeading{\faHeadSideMask~~口语模块}
}
%%%%
\newcommand{\Writing}{%
\AdjustiveHeading{\faPenNib~~写作模块}
}
\makeatother

%%%%%%%%%%%%%%%%%% 环境、文档层次和目录 %%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
%%重定义\frontmatter%%
\renewcommand{\frontmatter}[1][roman]{
\cleardoublepage
\pagestyle{MainPage}
\@mainmatterfalse
\pagenumbering{#1}}
%%重定义\mainmatter%%
\renewcommand{\mainmatter}{
\cleardoublepage
\pagestyle{MainPage}
\@mainmattertrue
\pagenumbering{arabic}}
%%重定义\backmatter%%
\renewcommand{\backmatter}[1][Roman]{
\cleardoublepage
\pagestyle{MainPage}
\@mainmatterfalse
\pagenumbering{#1}}
%%%%
%%以下为本文档类内置栏目，请谨慎修改%%
%设置环境布尔变量
\newif\if@appendix
\newif\if@quiz
\newif\if@project
\newif\if@topic
%%%%
%%写入目录布尔变量%%
\newcommand{\@Cts@Appendix@True}{%
\addtocontents{toc}{\protect\@appendixtrue}
\addtocontents{lof}{\protect\@appendixtrue}
\addtocontents{lot}{\protect\@appendixtrue}
}
%%
\newcommand{\@Cts@Quiz@True}{%
\addtocontents{toc}{\protect\@quiztrue}
\addtocontents{lof}{\protect\@quiztrue}
\addtocontents{lot}{\protect\@quiztrue}
}
%%
\newcommand{\@Cts@Topic@True}{%
\addtocontents{toc}{\protect\@topictrue}
\addtocontents{lof}{\protect\@topictrue}
\addtocontents{lot}{\protect\@topictrue}
}
%%
\newcommand{\@Cts@Project@True}{%
\addtocontents{toc}{\protect\@projecttrue}
\addtocontents{lof}{\protect\@projecttrue}
\addtocontents{lot}{\protect\@projecttrue}
}
%%
\newcommand{\@Cts@Appendix@False}{%
\addtocontents{toc}{\protect\@appendixfalse}
\addtocontents{lof}{\protect\@appendixfalse}
\addtocontents{lot}{\protect\@appendixfalse}
}
%%
\newcommand{\@Cts@Quiz@False}{%
\addtocontents{toc}{\protect\@quizfalse}
\addtocontents{lof}{\protect\@quizfalse}
\addtocontents{lot}{\protect\@quizfalse}
}
%%
\newcommand{\@Cts@Topic@False}{
\addtocontents{toc}{\protect\@topicfalse}
\addtocontents{lof}{\protect\@topicfalse}
\addtocontents{lot}{\protect\@topicfalse}
}
%%
\newcommand{\@Cts@Project@False}{%
\addtocontents{toc}{\protect\@projectfalse}
\addtocontents{lof}{\protect\@projectfalse}
\addtocontents{lot}{\protect\@projectfalse}
}
%%环境层级计数器：数值为1对应chapter，数值为2对应section%%
\newcounter{@Environment@Depth}
\setcounter{@Environment@Depth}{0}
%%
%%环境内计数器设置%%
\newcommand{\@StoreRelease@Value}[3]{
%在环境的开始位置将环境前的文档层次计数器值储存在outercounter中
%在环境的结束位置将环境内的文档层次计数器值储存在innercounter中
\setcounter{#2}{\value{#1}}
%随后立即将环境内的文档层次计数器值设置为innercounter的值
%随后立即将环境内的文档层次计数器值设置为outercounter的值
\setcounter{#1}{\value{#3}}
}
%%%%
%%设置附录环境%%
\newcounter{@Outer@Appendix@Chapter}%储存环境前的章计数器数值
\newcounter{@Inner@Appendix@Chapter}%储存环境中的章计数器数值
\setcounter{@Inner@Appendix@Chapter}{0}%将环境中的章计数器值置零
%%
\newcounter{@Outer@Appendix@Section}%储存环境前的节计数器数值
\newcounter{@Inner@Appendix@Section}%储存环境中的节计数器数值
\setcounter{@Inner@Appendix@Section}{0}%将环境中的节计数器值置零
%%
\newcounter{@Outer@Appendix@Subsection}%储存环境前的小节计数器数值
\newcounter{@Inner@Appendix@Subsection}%储存环境中的小节计数器数值
\setcounter{@Inner@Appendix@Subsection}{0}%将环境中的小节计数器值置零
%%
\newcounter{@Outer@Appendix@Subsubsection}%储存环境前的小小节计数器数值
\newcounter{@Inner@Appendix@Subsubsection}%储存环境中的小小节计数器数值
\setcounter{@Inner@Appendix@Subsubsection}{0}%将环境中的小小节计数器值置零
%%
\newenvironment{Appendix}{%
%%判断环境所在位置的环境层级计数器的数值，若为2，则说明本环境嵌套于一个section层级的环境中，需要报错；若为1，则说明本环境嵌套于另一个chapter层级的环境中，需要报错；若为0，则说明本环境不嵌套于任何一个类似的环境中，可以运行%%
\ifnum\value{@Environment@Depth}=2
\ClassError{textbook-cn}{Appendix environment must not be used in quiz, project and topic environment!}
\else
\ifnum\value{@Environment@Depth}=1
\ClassError{textbook-cn}{Appendix environment must not be used in another appendix environment!}
\else
\relax
\fi\fi
%%设置环境层级
\setcounter{@Environment@Depth}{1}
%%设置环境内的布尔变量值
\@appendixtrue
%%在目录文件中写入布尔变量，确保目录正确生成
\@Cts@Appendix@True
%修改章计数器样式为大写字母
\renewcommand{\thechapter}{\Alph{chapter}}
%修改节计数器样式为小写字母
\renewcommand{\thesection}{\alph{section}}
%修改小节计数器样式为小写字母
\renewcommand{\thesubsection}{\arabic{subsection}}
%修改小小节计数器样式为阿拉伯数字
\renewcommand{\thesubsubsection}{\arabic{subsubsection}}
%修改页眉页脚章标签
\renewcommand{\chapterlabelfront}{附录~}
\renewcommand{\chapterlabelback}{}
%修改页眉页脚节标签
\renewcommand{\sectionlabelfront}{附节}
\renewcommand{\sectionlabelback}{}
%修改小节标签
\renewcommand{\subsectionlabelfront}{小节}
\renewcommand{\subsectionlabelback}{}
%修改环境标识
\def\@Environment@Mark{}
%%%%
%%计数器设置
\@StoreRelease@Value{chapter}{@Outer@Appendix@Chapter}{@Inner@Appendix@Chapter}
%%
\@StoreRelease@Value{section}{@Outer@Appendix@Section}{@Inner@Appendix@Section}
%%
\@StoreRelease@Value{subsection}{@Outer@Appendix@Subsection}{@Inner@Appendix@Subsection}
%%
\@StoreRelease@Value{subsubsection}{@Outer@Appendix@Subsubsection}{@Inner@Appendix@Subsubsection}
%%%%
%确保hyperref知道计数器变化
\hypersetup{pageanchor=true}
%修改超链接的唯一标识
\renewcommand{\theHchapter}{\chapterlabelfront\thechapter\chapterlabelback}
\renewcommand{\theHsection}{\sectionlabelfront\thesection\sectionlabelback}
\renewcommand{\theHsubsection}{\subsectionlabelfront\thesubsection\subsectionlabelback}
}{%
%%将环境层次计数器归零
\setcounter{@Environment@Depth}{0}
%%重置布尔变量
\@appendixfalse
\@Cts@Appendix@False
%%计数器设置
\@StoreRelease@Value{chapter}{@Inner@Appendix@Chapter}{@Outer@Appendix@Chapter}
%%
\@StoreRelease@Value{section}{@Inner@Appendix@Section}{@Outer@Appendix@Section}
%%
\@StoreRelease@Value{subsection}{@Inner@Appendix@Subsection}{@Outer@Appendix@Subsection}
%%
\@StoreRelease@Value{subsubsection}{@Inner@Appendix@Subsubsection}{@Outer@Appendix@Subsubsection}
%恢复原始超链接设置
\hypersetup{pageanchor=false}
}
%%
%%设置测试环境%%
\newcounter{@Outer@Quiz@Section}%储存环境前的节计数器数值
\newcounter{@Inner@Quiz@Section}%储存环境中的节计数器数值
\setcounter{@Inner@Quiz@Section}{0}%将环境中的节计数器值置零
%%
\newcounter{@Outer@Quiz@Subsection}%储存环境前的小节计数器数值
\newcounter{@Inner@Quiz@Subsection}%储存环境中的小节计数器数值
\setcounter{@Inner@Quiz@Subsection}{0}%将环境中的小节计数器值置零
%%
\newcounter{@Outer@Quiz@Subsubsection}%储存环境前的小小节计数器数值
\newcounter{@Inner@Quiz@Subsubsection}%储存环境中的小小节计数器数值
\setcounter{@Inner@Quiz@Subsubsection}{0}%将环境中的小小节计数器值置零
\newenvironment{Quiz}{%
%%判断环境所在位置的环境层级计数器的数值，若为2，则说明本环境嵌套于另一个同为section层级的环境中，需要报错；若为1，则说明本环境嵌套于另一个chapter层级的环境中，正常运行%%
\ifnum\value{@Environment@Depth}=2
\ClassError{textbook-cn}{Quiz environment must not be used in project, topic and another quiz environment!}
\else
\relax
\fi
%%设置环境层级
\setcounter{@Environment@Depth}{2}
%%设置环境内的布尔变量值
\@quiztrue
%%在目录文件中写入布尔变量，确保目录正确生成
\@Cts@Quiz@True
%%%%
%修改节计数器样式为阿拉伯数字
\renewcommand{\thesection}{\arabic{section}}
%修改小节计数器样式为罗马数字
\renewcommand{\thesubsection}{\Roman{subsection}}
%修改小小节计数器样式为阿拉伯数字
\renewcommand{\thesubsubsection}{\arabic{subsubsection}}
%移除section对chapter的依赖
\@removefromreset{section}{chapter}
%移除subsubsection对subsection的依赖
\@removefromreset{subsubsection}{subsection}
%添加subsubsection对section的依赖
\@addtoreset{subsubsection}{section}
%修改页眉页脚标签
\renewcommand{\sectionlabelfront}{测试}
\renewcommand{\sectionlabelback}{}
%修改小节标签
\renewcommand{\subsectionlabelfront}{题组}
\renewcommand{\subsectionlabelback}{}
%修改环境标识
\def\@Environment@Mark{Q}
%修改subsubsection样式
\titleformat{\subsubsection}[hang]{%
\SubsubsectionFont\color{ColorB}%
\def\@Subsubsection@LabelRadius{0.6em}}{%
\tikz[baseline=-0.4em]{%
\node[outer sep=0mm,inner sep=0mm]{\@HalfCircle@Label{ColorB}{\@Subsubsection@LabelRadius}};}%
\hspace*{\@Subsubsection@LabelNameXSep}第~{\sffamily\arabic{subsubsection}}~题%
}{\@Subsubsection@LabelNameXSep}{##1}
%%%%
%%简化序号命令%%
\renewcommand{\the@prenumber}{\thesection}
%%%%
%%计数器设置
\@StoreRelease@Value{section}{@Outer@Quiz@Section}{@Inner@Quiz@Section}
%%
\@StoreRelease@Value{subsection}{@Outer@Quiz@Subsection}{@Inner@Quiz@Subsection}
%%
\@StoreRelease@Value{subsubsection}{@Outer@Quiz@Subsubsection}{@Inner@Quiz@Subsubsection}
%%%%
%确保hyperref知道计数器变化
\hypersetup{pageanchor=true}
%修改超链接的唯一标识
\renewcommand{\theHsection}{\sectionlabelfront\thesection\sectionlabelback}
\renewcommand{\theHsubsection}{\subsectionlabelfront\thesubsection\subsectionlabelback}
}{%
%%将环境层次计数器归零
\setcounter{@Environment@Depth}{0}
%%重置布尔变量
\@quizfalse
\@Cts@Quiz@False
%%计数器设置
\@StoreRelease@Value{section}{@Inner@Quiz@Section}{@Outer@Quiz@Section}
%%
\@StoreRelease@Value{subsection}{@Inner@Quiz@Subsection}{@Outer@Quiz@Subsection}
%%
\@StoreRelease@Value{subsubsection}{@Inner@Quiz@Subsubsection}{@Outer@Quiz@Subsubsection}
%恢复原始超链接设置
\hypersetup{pageanchor=false}
%移除subsubsection对section的依赖
\@removefromreset{subsubsection}{section}
%添加subsubsection对subsection的依赖
\@addtoreset{subsubsection}{subsection}
%添加section对chapter的依赖
\@addtoreset{section}{chapter}
}
%%%%

%%设置专题环境%%
\newcounter{@Outer@Topic@Section}%储存环境前的节计数器数值
\newcounter{@Inner@Topic@Section}%储存环境中的节计数器数值
\setcounter{@Inner@Topic@Section}{0}%将环境中的节计数器值置零
%%
\newcounter{@Outer@Topic@Subsection}%储存环境前的小节计数器数值
\newcounter{@Inner@Topic@Subsection}%储存环境中的小节计数器数值
\setcounter{@Inner@Topic@Subsection}{0}%将环境中的小节计数器值置零
%%
\newcounter{@Outer@Topic@Subsubsection}%储存环境前的小小节计数器数值
\newcounter{@Inner@Topic@Subsubsection}%储存环境中的小小节计数器数值
\setcounter{@Inner@Topic@Subsubsection}{0}%将环境中的小小节计数器值置零
\newenvironment{Topic}{%
%%判断环境所在位置的环境层级计数器的数值，若为2，则说明本环境嵌套于另一个同为section层级的环境中，需要报错；若为1，则说明本环境嵌套于另一个chapter层级的环境中，正常运行%%
\ifnum\value{@Environment@Depth}=2
\ClassError{textbook-cn}{Topic environment must not be used in quiz, project and another topic environment!}
\else
\relax
\fi
%%设置环境层级
\setcounter{@Environment@Depth}{2}
%%设置环境内的布尔变量值
\@topictrue
%%在目录文件中写入布尔变量，确保目录正确生成
\@Cts@Topic@True
%修改节计数器样式为阿拉伯数字
\renewcommand{\thesection}{\arabic{section}}
%修改小节计数器样式为阿拉伯数字
\renewcommand{\thesubsection}{\arabic{subsection}}
%修改小小节计数器样式为阿拉伯数字
\renewcommand{\thesubsubsection}{\arabic{subsubsection}}
%修改页眉页脚标签
\renewcommand{\sectionlabelfront}{专题}
\renewcommand{\sectionlabelback}{}
%修改小节标签
\renewcommand{\subsectionlabelfront}{考点}
\renewcommand{\subsectionlabelback}{}
%移除section对chapter的依赖
\@removefromreset{section}{chapter}
%修改环境标识
\def\@Environment@Mark{T}
%%%%
%%简化序号命令%%
\renewcommand{\the@prenumber}{\thesection}
%%%%
%%计数器设置
\@StoreRelease@Value{section}{@Outer@Topic@Section}{@Inner@Topic@Section}
%%
\@StoreRelease@Value{subsection}{@Outer@Topic@Subsection}{@Inner@Topic@Subsection}
%%
\@StoreRelease@Value{subsubsection}{@Outer@Topic@Subsubsection}{@Inner@Topic@Subsubsection}
%%%%
%确保hyperref知道计数器变化
\hypersetup{pageanchor=true}
%修改超链接的唯一标识
\renewcommand{\theHsection}{\sectionlabelfront\thesection\sectionlabelback}
\renewcommand{\theHsubsection}{\subsectionlabelfront\thesubsection\subsectionlabelback}
}{%
%%将环境层次计数器归零
\setcounter{@Environment@Depth}{0}
%%重置布尔变量
\@topicfalse
\@Cts@Topic@False
%%计数器设置
\@StoreRelease@Value{section}{@Inner@Topic@Section}{@Outer@Topic@Section}
%%
\@StoreRelease@Value{subsection}{@Inner@Topic@Subsection}{@Outer@Topic@Subsection}
%%
\@StoreRelease@Value{subsubsection}{@Inner@Topic@Subsubsection}{@Outer@Topic@Subsubsection}
%恢复原始超链接设置
\hypersetup{pageanchor=false}
%添加section对chapter的依赖
\@addtoreset{section}{chapter}
}
%%%%
%%设置课题环境%%
\newcounter{@Outer@Project@Section}%储存环境前的节计数器数值
\newcounter{@Inner@Project@Section}%储存环境中的节计数器数值
\setcounter{@Inner@Project@Section}{0}%将环境中的节计数器值置零
%%
\newcounter{@Outer@Project@Subsection}%储存环境前的小节计数器数值
\newcounter{@Inner@Project@Subsection}%储存环境中的小节计数器数值
\setcounter{@Inner@Project@Subsection}{0}%将环境中的小节计数器值置零
%%
\newcounter{@Outer@Project@Subsubsection}%储存环境前的小小节计数器数值
\newcounter{@Inner@Project@Subsubsection}%储存环境中的小小节计数器数值
\setcounter{@Inner@Project@Subsubsection}{0}%将环境中的小小节计数器值置零
\newenvironment{Project}{%
%%判断环境所在位置的环境层级计数器的数值，若为2，则说明本环境嵌套于另一个同为section层级的环境中，需要报错；若为1，则说明本环境嵌套于另一个chapter层级的环境中，正常运行%%
\ifnum\value{@Environment@Depth}=2
\ClassError{textbook-cn}{Project environment must not be used in quiz, topic and another project environment!}
\else
\relax
\fi
%%设置环境层级
\setcounter{@Environment@Depth}{2}
%%设置环境内的布尔变量值
\@projecttrue
%%在目录文件中写入布尔变量，确保目录正确生成
\@Cts@Project@True
%%%%
%修改节计数器样式为阿拉伯数字
\renewcommand{\thesection}{\arabic{section}}
%修改小节计数器样式为阿拉伯数字
\renewcommand{\thesubsection}{\arabic{subsection}}
%修改小小节计数器样式为阿拉伯数字
\renewcommand{\thesubsubsection}{\arabic{subsubsection}}
%修改页眉页脚标签
\renewcommand{\sectionlabelfront}{课题}
\renewcommand{\sectionlabelback}{}
%修改小节标签
\renewcommand{\subsectionlabelfront}{活动}
\renewcommand{\subsectionlabelback}{}
%移除section对chapter的依赖
\@removefromreset{section}{chapter}
%修改环境标识
\def\@Environment@Mark{P}
%%%%
%%简化序号命令%%
\renewcommand{\the@prenumber}{\thesection}
%%%%
%%计数器设置
\@StoreRelease@Value{section}{@Outer@Project@Section}{@Inner@Project@Section}
%%
\@StoreRelease@Value{subsection}{@Outer@Project@Subsection}{@Inner@Project@Subsection}
%%
\@StoreRelease@Value{subsubsection}{@Outer@Project@Subsubsection}{@Inner@Project@Subsubsection}
%%%%
%确保hyperref知道计数器变化
\hypersetup{pageanchor=true}
%修改超链接的唯一标识
\renewcommand{\theHsection}{\sectionlabelfront\thesection\sectionlabelback}
\renewcommand{\theHsubsection}{\subsectionlabelfront\thesubsection\subsectionlabelback}
}{%
%%将环境层次计数器归零
\setcounter{@Environment@Depth}{0}
%%重置布尔变量
\@projectfalse
\@Cts@Project@False
%%计数器设置
\@StoreRelease@Value{section}{@Inner@Project@Section}{@Outer@Project@Section}
%%
\@StoreRelease@Value{subsection}{@Inner@Project@Subsection}{@Outer@Project@Subsection}
%%
\@StoreRelease@Value{subsubsection}{@Inner@Project@Subsubsection}{@Outer@Project@Subsubsection}
%恢复原始超链接设置
\hypersetup{pageanchor=false}
%添加section对chapter的依赖
\@addtoreset{section}{chapter}
}
%%%%
%%目录页码右侧空格%%
\contentsmargin{3.5mm}
%%标签绘制%%
\newlength{\@PartToc@LabelCriticWidth}
\setlength{\@PartToc@LabelCriticWidth}{6.0cm}
%%%%
\NewDocumentCommand{\@PartTocStyle}{ +m +m }{%
\begin{tikzpicture}%
\TocPartFont%
\def\@PartToc@Radius{\dimexpr\baselineskip/2\relax}%0.9
\pgfdeclarelayer{@PartToc@Bottom}%
\pgfsetlayers{@PartToc@Bottom,main}%
\node[text=white,inner xsep=\@PartToc@Radius,inner ysep=0mm,outer sep=0mm](L){%
\begin{varwidth}{\@PartToc@LabelCriticWidth}
%\AdjustStrut{0.9}%
\strut#1\strut
\end{varwidth}};
\pgfgetnodewidth(L)\@PartToc@LabelWidth
\pgfgetnodeheight(L)\@PartToc@LabelHeight
%%
\node[text=ColorA,inner xsep=\@PartToc@Radius,inner ysep=0mm,outer sep=0mm,minimum width=\linewidth-\@PartToc@LabelWidth,anchor=north west](N)at(L.north east){%
\begin{minipage}{\linewidth-\@PartToc@LabelWidth-2\@PartToc@Radius+1.0mm}
%\AdjustStrut{0.9}%
\strut#2\strut
\end{minipage}};
\pgfgetnodeheight(N)\@PartToc@NameHeight
%%
\begin{pgfonlayer}{@PartToc@Bottom}
\ifdim\@PartToc@NameHeight>\@PartToc@LabelHeight
\path[fill=ColorB!7.5](N.north east)[sharp corners]--(N.north west)--(N.south west)[rounded corners=\@PartToc@Radius]--(N.south east)--cycle;
%
\path[fill=ColorA](L.north west)[sharp corners]--(L.north east)--(N.south west)[rounded corners=\@PartToc@Radius]--([xshift=-\@PartToc@LabelWidth]N.south west)--([xshift=-\@PartToc@LabelWidth,yshift=\@PartToc@LabelHeight]N.south west)--cycle;
\else
\path[fill=ColorB!7.5](N.north east)[sharp corners]--(N.north west)--(L.south east)[rounded corners=\@PartToc@Radius]--([yshift=-\@PartToc@LabelHeight]N.north east)--cycle;
%
\path[fill=ColorA](L.south west)[sharp corners]--(L.south east)--(L.north east)[rounded corners=\@PartToc@Radius]--(L.north west)--cycle;
\fi
\end{pgfonlayer}
\end{tikzpicture}
}

%%
%%编号部分目录样式%%
\NewDocumentCommand{\@Toc@Part@Numbered}{+m}{\contentslabel[\@PartTocStyle{\partlabelfront{\sffamily\thecontentslabel}\partlabelback}{#1\hfill\sffamily\thecontentspage}]{1.25cm}}
%%
%%不编号部分目录样式%%
\NewDocumentCommand{\@Toc@Part@Unnumbered}{+m}{\contentslabel[\@PartTocStyle{#1}{\hfill\sffamily\thecontentspage}]{1.25cm}}
%%
%%部分目录样式%%
\titlecontents{part}[1.25cm]
{\addvspace{20pt}\hypersetup{linkcolor=white}}
{\@Toc@Part@Numbered}
{\@Toc@Part@Unnumbered}{}
%%%%
%%章目录样式%%
\gdef\@Chapter@Toc@Label{%
\if@appendix%如果章在相应环境里，则修改目录前缀
附录{\sffamily\thecontentslabel}%
\else%
第{\sffamily\thecontentslabel}章%
\fi}
%%%%
\newlength{\@Toc@ChapterContents@XSep}
\setlength{\@Toc@ChapterContents@XSep}{2.45cm}
\newlength{\@Toc@ChapterLabelName@XSep}
\setlength{\@Toc@ChapterLabelName@XSep}{2.0cm}
%%
\titlecontents{chapter}[\@Toc@ChapterContents@XSep]
{\addvspace{5.0pt}\TocChapterFont\color{ColorA}\hypersetup{linkcolor=ColorA}}
{\color{ColorA}\contentslabel[\@Chapter@Toc@Label]{\@Toc@ChapterLabelName@XSep}}
{\color{ColorA}\hspace*{-\@Toc@ChapterLabelName@XSep}}%不编号章节
{\titlerule*[6pt]{ }\color{ColorA}\ContentPageNumFont\thecontentspage}
%%%%
\gdef\@Section@Toc@Label{%
\if@topic%如果节在相应环境里，则修改目录前缀
专题{\sffamily\thecontentslabel}%
\else%
\if@project%
课题{\sffamily\thecontentslabel}%
\else%
\if@quiz%
测试{\sffamily\thecontentslabel}%
\else%
\if@appendix%务必放在section层次环境后
附节{\sffamily\thecontentslabel}%
\else%
第{\sffamily\thecontentslabel}节%
\fi\fi\fi\fi}
%%%%
\newlength{\@Toc@SectionContents@XSep}
\setlength{\@Toc@SectionContents@XSep}{2.45cm}
\newlength{\@Toc@SectionLabelName@XSep}
\setlength{\@Toc@SectionLabelName@XSep}{2.0cm}
%%
%%节目录样式%%
\titlecontents{section}[\@Toc@SectionContents@XSep]
{\addvspace{5.0pt}\TocSectionFont}
{\contentslabel[\@Section@Toc@Label]{\@Toc@SectionLabelName@XSep}}
{\hspace*{-\@Toc@SectionLabelName@XSep}}%不编号章节
{\titlerule*[6pt]{ }\ContentPageNumFont\thecontentspage}
%%%%
\gdef\@Subsection@Toc@Label{%
\if@topic%如果节在相应环境里，则修改目录前缀
考点%
\else%
\if@project%
活动%
\else%
\if@quiz%
题组%
\else%
\if@appendix%务必放在section层次环境后
小节%
\else%
课时%
\fi\fi\fi\fi%
{\sffamily\thecontentslabel}
}
%%%%
\newlength{\@Toc@SubsecContents@XSep}
\setlength{\@Toc@SubsecContents@XSep}{4.3cm}
\newlength{\@Toc@SubsecLabelName@XSep}
\setlength{\@Toc@SubsecLabelName@XSep}{2.0cm}
%%
%%小节目录样式%%
\titlecontents{subsection}[\@Toc@SubsecContents@XSep]
{\addvspace{5.0pt}\TocSubsectionFont\color{ColorC}}
{\contentslabel[\@Subsection@Toc@Label]{\@Toc@SubsecLabelName@XSep}}
{\hspace*{-\@Toc@SubsecLabelName@XSep}}%不编号章节
{\titlerule*[6pt]{ }\ContentPageNumFont\color{ColorC}\thecontentspage}
%%%%
\gdef\@Figure@Toc@Label{%
\figurename%
\if@topic%如果节在相应环境里，则修改目录前缀
{\sffamily T}%
\else%
\if@project%
{\sffamily P}%
\else%
\if@quiz%
{\sffamily Q}%
\else%
\if@appendix%务必放在section层次环境后
{\sffamily A}%
\else%
\relax%
\fi\fi\fi\fi%
{\sffamily\thecontentslabel}
}
%%
\gdef\@Table@Toc@Label{%
\tablename%
\if@topic%如果节在相应环境里，则修改目录前缀
{\sffamily T}%
\else%
\if@project%
{\sffamily P}%
\else%
\if@quiz%
{\sffamily Q}%
\else%
\if@appendix%务必放在section层次环境后
{\sffamily A}%
\else%
\relax%
\fi\fi\fi\fi%
{\sffamily\thecontentslabel}
}
%%
\newlength{\@Toc@FTListContents@XSep}
\setlength{\@Toc@FTListContents@XSep}{3.95cm}
\newlength{\@Toc@FTListLabelName@XSep}
\setlength{\@Toc@FTListLabelName@XSep}{3.5cm}
%%图片目录样式%%
\titlecontents{figure}[\@Toc@FTListContents@XSep]
{\addvspace{5.0pt}\LofFont}
{\contentslabel[\@Figure@Toc@Label]{\@Toc@FTListLabelName@XSep}}
{\hspace*{-\@Toc@SectionLabelName@XSep}}%不编号图表
{\titlerule*[6pt]{ }\ContentPageNumFont\thecontentspage}
%%表格目录样式%%
\titlecontents{table}[\@Toc@FTListContents@XSep]
{\addvspace{5.0pt}\LotFont}
{\contentslabel[\@Table@Toc@Label]{\@Toc@FTListLabelName@XSep}}
{\hspace*{-\@Toc@SectionLabelName@XSep}}%不编号图表
{\titlerule*[6pt]{ }\ContentPageNumFont\thecontentspage}
%%部分页上的小目录章样式%%
\titlecontents{lchapter}[0.75cm]
{\addvspace{5.0pt}\TocLChapterFont\hypersetup{linkcolor=ColorB}}
{\color{ColorB}\contentslabel[\TocLChapterFont\faGenderless]{0.6cm}}
{\color{ColorB}\contentslabel[\TocLChapterFont\faGenderless]{0.6cm}}%不编号章节
{}
%%部分页上的小目录节样式%%
\titlecontents{lsection}[0.9cm]
{\addvspace{5.0pt}\TocLSectionFont}
{\contentslabel[\TocLSectionFont\faGenderless]{0.5cm}}
{\contentslabel[\TocLSectionFont\faGenderless]{0.5cm}}%不编号章节
{}
%%部分页上的小目录小节样式%%
\titlecontents{lsubsection}[0.9cm]
{\addvspace{5.0pt}\TocLSubsectionFont}
{\contentslabel[\TocLSubsectionFont\faGenderless]{0.5cm}}
{\contentslabel[\TocLSubsectionFont\faGenderless]{0.5cm}}%不编号章节
{}
\makeatother

%%%%%%%%%%%%%%%%%% 例题与盒子定义 %%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
%%设置例题和定义盒子序号前缀%%
\def\@Environment@Mark{}
%%设置例题命令%%
\newlength{\@Example@LabelCriticWidth}
\newlength{\@Example@NameCriticWidth}
\setlength{\@Example@LabelCriticWidth}{3.0cm}
\setlength{\@Example@NameCriticWidth}{2.0cm}
%%%%
\NewDocumentCommand{\@ExampleStyle}{ +m +m m }{%
\noindent%
\tikz[baseline=-0.4em]{\node[inner sep=0mm,outer sep=0mm]{%
\begin{tikzpicture}
\EgLabelFont%
\def\@Example@Radius{\dimexpr\baselineskip/2\relax}%0.75
\pgfdeclarelayer{@Example@Bottom}%
\pgfsetlayers{@Example@Bottom,main}%
\node[text=white,inner sep=0mm,outer sep=0mm](L){%
\hspace*{\@Example@Radius}%
\begin{varwidth}{\@Example@LabelCriticWidth}
%\AdjustStrut{0.75}%
\strut#1\strut
\end{varwidth}%
\hspace*{\@Example@Radius}%
};
\pgfgetnodewidth(L)\@Example@LabelWidth
\pgfgetnodeheight(L)\@Example@LabelHeight
%%
\node[text=#3,inner xsep=\@Example@Radius,inner ysep=0mm,outer sep=0mm,anchor=north west](N)at(L.north east){%
\begin{varwidth}{\@Example@NameCriticWidth}
%\AdjustStrut{0.75}%
\strut\sffamily#2\strut
\end{varwidth}};
\pgfgetnodeheight(N)\@Example@NameHeight
%%
\begin{pgfonlayer}{@Example@Bottom}
\ifdim\@Example@NameHeight>\@Example@LabelHeight
\draw[#3,ultra thick,fill=#3,rounded corners=\@Example@Radius](L.north west)rectangle(N.south east);
%
\draw[#3,ultra thick,fill=white,rounded corners=\@Example@Radius](N.north west)rectangle(N.south east);
\else
\draw[#3,ultra thick,fill=#3,rounded corners=\@Example@Radius](L.south west)rectangle(N.north east);
%
\draw[#3,ultra thick,fill=white,rounded corners=\@Example@Radius](L.south east)rectangle(N.north east);
\fi
\end{pgfonlayer}
\end{tikzpicture}};}
}
%%
\newlength{\@Answer@CriticWidth}
\setlength{\@Answer@CriticWidth}{3.0cm}
%%%%
\NewDocumentCommand{\@AnswerStyle}{ +m m }{%
\noindent%
\tikz[baseline=-0.4em]{%
\EgLabelFont%
\def\@Example@Radius{\dimexpr\baselineskip/2\relax}%0.75
\node[draw=#2,fill=#2,rounded corners=\@Example@Radius,text=white,inner xsep=\@Example@Radius,inner ysep=0mm,outer sep=0mm](L){%
\begin{varwidth}{\@Answer@CriticWidth}
%\AdjustStrut{0.75}%
\strut#1\strut
\end{varwidth}
};}
}
%%%%
%%解答%%
\newenvironment{Answer}{%
\medskip%
\@AnswerStyle{解答}{ColorG}%
\hspace*{0.5em}\vspace*{0.25em}%
}{\medskip}
%%%%
\newenvironment{Answer*}{%
\medskip%
\@AnswerStyle{解析}{ColorF}%
\hspace*{0.5em}\vspace*{0.25em}%
}{\medskip}

%%%%
%%例题%%
\def\@Example@Name{例题}
\def\@Example@Label{\the@prenumber.\the@egnum}
%%%%
\newenvironment{Example}{%
\medskip%
\if@mainmatter%
\stepcounter{@egnum}%
\@ExampleStyle{\@Example@Name}{\@Environment@Mark\@Example@Label}{ColorA}%
\else%
\@AnswerStyle{\@Example@Name}{ColorA}%
\fi%
\hspace*{0.5em}\vspace*{0.25em}%
}{\medskip}
%%%%
\newenvironment{Example*}{%
\medskip%
\@AnswerStyle{\@Example@Name}{ColorA}%
\hspace*{0.5em}\vspace*{0.25em}%
}{\medskip}

%%变式%%
\def\@Variant@Name{变式}
\def\@Variant@Label{\the@prenumber.\the@varnum}
%%%%
\newenvironment{Variant}{%
\medskip%
\if@mainmatter%
\stepcounter{@varnum}%
\@ExampleStyle{\@Variant@Name}{\@Environment@Mark\@Variant@Label}{ColorB}%
\else%
\@AnswerStyle{\@Variant@Name}{ColorB}%
\fi%
\hspace*{0.5em}\vspace*{0.25em}%
}{\medskip}
%%%%
\newenvironment{Variant*}{%
\medskip%
\@AnswerStyle{\@Variant@Name}{ColorB}%
\hspace*{0.5em}\vspace*{0.25em}%
}{\medskip}

%%%%
\newlength{\@Box@CriticTitleWidth}
\setlength{\@Box@CriticTitleWidth}{2\linewidth/3}
%%设置注释盒子样式%%
\tcbset{NoteBox/.style args={#1/#2}{
empty,breakable,
boxsep=3.0mm,
top=-3.0mm,bottom=-3.0mm,right=-3.0mm,left=-3.0mm,
before=\par\medskip,after=\par\medskip,
fontupper=\MarginNoteFont,colupper=#1,
fonttitle=\BoxTitleFont,coltitle=#1,
varwidth boxed title=\@Box@CriticTitleWidth,
title={\strut#2\strut},
boxed title style={empty,left=0mm,bottom=1.5mm,boxsep=0mm},
attach boxed title to top left,
before upper={\setlength{\parindent}{2.0em}},
before lower={\setlength{\parindent}{2.0em}},
subtitle style={empty,fontupper=\BoxSubtitleFont\centering,colupper=#1,top=-3.0mm,bottom=-3.0mm},
segmentation engine=path,
segmentation style={cap=round,line width=2.25pt,draw=#2!25,loosely dashed},
segmentation at break=false
}}
%%%%
\tcbset{ItemBox/.style args={#1/#2}{
empty,breakable,
boxsep=3.0mm,
top=2.0mm,bottom=-3.0mm,left=-3.0mm,right=-3.0mm,
varwidth boxed title=\@Box@CriticTitleWidth,
before upper={\setlength{\parindent}{2.0em}},
before lower={\setlength{\parindent}{2.0em}},
before=\par\medskip,after=\par\medskip,
fontupper=\ItemFont,fontlower=\ItemFont,
fonttitle=\BoxTitleFont,coltitle=white,
title={%
%\AdjustStrut{0.85}
\strut#1\strut%
},
attach boxed title to top left={yshift*=-\tcboxedtitleheight},
boxed title style={size=minimal,empty,valign=center,left=2.25em,right=1.0em},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#2,top=-3.0mm,bottom=-3.0mm},
segmentation engine=path,
segmentation style={cap=round,line width=2.25pt,draw=#2!25,loosely dashed},
segmentation at break=false,
%%%%
underlay boxed title={
\BoxTitleFont
\def\@BoxTitle@Radius{\dimexpr\baselineskip/2\relax}%0.85
\draw[#2,fill=#2,ultra thick,rounded corners=\@BoxTitle@Radius](title.north west)rectangle(title.south east);
\draw[white,fill=white]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle(\@BoxTitle@Radius-2.0pt);
\draw[#2,fill=#2]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle(\@BoxTitle@Radius/2);
%%%%
\draw[#2,fill=#2,ultra thin]([xshift=-\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]frame.north east)circle({2*\@BoxTitle@Radius/3});
\draw[#2!90,fill=#2!90,ultra thin]([xshift=-3*\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]frame.north east)circle({2*\@BoxTitle@Radius/3});
\draw[#2!80,fill=#2!80,ultra thin]([xshift=-5*\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]frame.north east)circle({2*\@BoxTitle@Radius/3});}
}}
%%设置彩色盒子样式%%
\tcbset{ColorfulBox/.style args={#1/#2/#3/#4}{
enhanced standard,breakable,
pad after break=5.0mm,
grow to left by=-2.0pt,
rounded corners,arc=5.0pt,boxrule=2.25pt,
colback=white,colframe=white,
frame style={left color=#4!50,right color=#4!50,middle color=#4},
boxsep=3.0mm,
top=1.5mm,bottom=1.5mm,left=2.0mm,right=2.0mm,
varwidth boxed title=\@Box@CriticTitleWidth,
before=\par\bigskip,after=\par\bigskip,
fonttitle=\BoxTitleFont,coltitle=white,
title={\strut#1\strut},
IfBlankTF={#2}{}{after title={\strut~:~~#2\strut}},
attach boxed title to top left={yshift*=-\tcboxedtitleheight+1.5mm},
boxed title style={size=minimal,empty,valign=center,left=2.5em,right=1.0em},
IfBlankTF={#3}{before upper={\setlength{\parindent}{2.0em}}
}{before upper={\setlength{\parindent}{2.0em}%
\noindent{\BoxTitleFont\color{#4}#3}\hspace{1.0em}}
},
before lower={\setlength{\parindent}{2.0em}},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#4,top=-3.0mm,bottom=-3.0mm},
segmentation style={cap=round,line width=2.25pt,draw=#4!25,solid,shorten <= 5.0mm,shorten >= 5.0mm},
segmentation at break=false
}}
%%%%
\tcbset{CodeBox/.style args={#1/#2/#3/#4/#5}{
enhanced standard,breakable,
pad after break=5.0mm,
rounded corners,arc=5.0pt,boxrule=2.25pt,
colback=white,colframe=white,
frame style={left color=#4!50,right color=#4!50,middle color=#4},
boxsep=3.0mm,
top=1.5mm,bottom=1.5mm,left=2.0em+0.5mm,right=2.0mm,
before=\par\bigskip,after=\par\bigskip,
IfEmptyTF={#3}{
before upper={\setlength{\parindent}{2.0em}}
}{before upper={\setlength{\parindent}{2.0em}%
\noindent{\BoxTitleFont\color{#4}#3}\hspace{1.0em}}},
before lower={\setlength{\parindent}{2.0em}},
fonttitle=\BoxTitleFont,coltitle=white,
varwidth boxed title=\@Box@CriticTitleWidth,
title={\strut#1\strut},
IfBlankTF={#2}{}{after title={\strut~:~~#2\strut}},
boxed title style={size=minimal,empty,left=1.2em,right=1.2em,top=0.25em,bottom=0.05em},
attach boxed title to top left={yshift*=-\tcboxedtitleheight},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#4,top=-3.0mm,bottom=-3.0mm},
segmentation style={cap=round,line width=2.25pt,draw=#4!25,solid,shorten <= 2.0em+3.5mm,shorten >= 5.0mm},
segmentation at break=false,
%%%%
underlay boxed title={
\BoxTitleFont
\def\@BoxTitle@Radius{\dimexpr\baselineskip/2\relax}
\begin{tcbclipinterior}
\fill[#4!7.5,draw=#4!7.5](frame.south west)rectangle([xshift=1.9em]frame.north west);
\draw[#4!7.5,fill=#4!7.5](frame.north east)rectangle(title.south west);
\draw[#4,fill=#4](title.north west)--(title.north east)[rounded corners=5.0pt]--(title.south east)[sharp corners]--(title.south west)--cycle;
\end{tcbclipinterior}
\node[font=\BoxTitleFont,text=#4,anchor=east,outer sep=0mm,inner xsep=5.0mm](ST)at([yshift={-\tcboxedtitleheight/2}]interior.north east){
\begin{varwidth}{\linewidth-\@Box@CriticTitleWidth}
#5
\end{varwidth}};},
overlay middle and last={
\begin{tcbclipinterior}
\fill[#4!7.5,draw=#4!7.5](frame.south west)rectangle([xshift=1.9em]frame.north west);
\end{tcbclipinterior}}
}}
%%%%
\tcbset{BlockBox/.style args={#1}{
enhanced standard,breakable,
pad after break=5.0mm,
boxsep=3.0mm,
top=1.5mm,bottom=1.5mm,left=2.0mm,right=2.0mm,
bottomtitle=-4.5mm,
colframe=ColorB!7.5,colback=ColorB!7.5,colbacktitle=ColorB!7.5,rounded corners,arc=7.5pt,
before=\par\medskip,after=\par\medskip,
before upper={\setlength{\parindent}{2.0em}},
before lower={\setlength{\parindent}{2.0em}},
fonttitle=\BoxTitleFont,coltitle=ColorA,
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=ColorA,top=-3.0mm,bottom=-3.0mm},
segmentation style={cap=round,line width=2.25pt,draw=ColorA!25,solid,shorten <= 5.0mm,shorten >= 5.0mm,loosely dashed},
segmentation at break=false,
IfBlankTF={#1}{}{title={\strut#1\strut}}
}}

%%设置节前盒子%%
\DeclareTColorBox{box0}{O{} +m O{ColorB}}{ItemBox=#2/#3,#1}

\newenvironment{Point}{\begin{box0}{本章要点}[ColorA]}{\end{box0}}
\newenvironment{Point*}{\begin{box0}{本节导言}[ColorA]}{\end{box0}}

\newenvironment{Case}{\begin{box0}{基础概念、公式和定理}[ColorB]}{\end{box0}}
\newenvironment{Case*}{\begin{box0}{本节提要}[ColorB]}{\end{box0}}
%%%%

%%设置易错点盒子%%
\DeclareTColorBox{box1}{+O{} +m +O{} +O{} O{ColorA} O{\faQuestion}}{
ColorfulBox=#2/#3/#4/#5,
%%%%
underlay boxed title={
\BoxTitleFont
\def\@BoxTitle@Radius{\dimexpr\baselineskip/2\relax}%0.85
\draw[white,fill=white,rounded corners=\@BoxTitle@Radius,line width=10.0pt](title.north west)rectangle(title.south east);
\draw[#5,fill=#5,ultra thick,rounded corners=\@BoxTitle@Radius](title.north west)rectangle(title.south east);
%%%%
\draw[white,fill=white,line width=10.0pt]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle(\@BoxTitle@Radius);
\draw[#5,fill=#5,line width=2.75pt]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle(\@BoxTitle@Radius);
%%%%
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=white](P)at([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west){#6};
},
#1}

%%%%
\DeclareDocumentEnvironment{Warning}{ +O{} +O{} }{\begin{box1}{易错点警示}[#1][#2][ColorF][\faExclamation]}{\end{box1}}
\DeclareDocumentEnvironment{Discussion}{ +O{} +O{}}{\begin{box1}[lowerbox=ignored]{思考与讨论}[#1][#2][ColorC][\faQuestion]}
{\end{box1}}
\DeclareDocumentEnvironment{Check}{ +O{} +O{} }{\begin{box1}[step=@check]{随堂练习~{\sffamily\the@check}}[#1][#2][ColorI][\faCheck]}
{\end{box1}}

%%设置演示盒子%%
\DeclareTColorBox{box2}{+O{} +m +O{} +O{} O{ColorA} O{\faLayerGroup}}{
ColorfulBox=#2/#3/#4/#5,
%%%%
underlay boxed title={
\BoxTitleFont
\def\@BoxTitle@Radius{\dimexpr\baselineskip/2\relax}%0.85
\draw[white,fill=white,line width=10.0pt,rounded corners=\@BoxTitle@Radius](title.north east)rectangle(title.south west);
%%%%
\fill[white,draw=white]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle({5*\@BoxTitle@Radius/3});
\draw[#5,fill=#5!90,line width=2.0pt]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle({8*\@BoxTitle@Radius/7});
%%%%
\pgfgetnodeheight(title)\@BoxTitle@Height
\ifdim\@BoxTitle@Height>2\@BoxTitle@Radius
\draw[#5,fill=#5!90,line width=2.0pt]
(title.north east)[sharp corners]--
([xshift={7*\@BoxTitle@Radius/3}]title.north west)arc(asin(3/5):{-asin(3/5)-90}:{5*\@BoxTitle@Radius/3})[rounded corners=\@BoxTitle@Radius]--
(title.south west)[rounded corners=\@BoxTitle@Radius]--
(title.south east)[rounded corners=\@BoxTitle@Radius]--cycle;
\else
%%%%
\draw[#5,fill=#5!90,line width=2.0pt]
(title.north east)[sharp corners]--
([xshift={7*\@BoxTitle@Radius/3}]title.north west)arc(asin(3/5):-asin(3/5):{5*\@BoxTitle@Radius/3})[rounded corners=\@BoxTitle@Radius]--
(title.south east)[rounded corners=\@BoxTitle@Radius]--cycle;
\fi
%%%%
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=white](T)at([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west){#6};
},
#1}

%%%%
\DeclareDocumentEnvironment{Display}{ +O{} +O{} }{\begin{box2}{演示与实验}[#1][#2][ColorB][\faLayerGroup]}{\end{box2}}
\DeclareDocumentEnvironment{Method}{ +O{} +O{} }{\begin{box2}{方法与技巧}[#1][#2][ColorD][\faPodcast]}{\end{box2}}
\DeclareDocumentEnvironment{Mind}{ +O{} +O{} }{\begin{box2}{科学思维}[#1][#2][ColorC][\faAtom]}{\end{box2}}

%%简化序号命令%%
\newcommand{\the@prenumber}{\thechapter.\thesection}
%%设置定义定理盒子%%
\DeclareTColorBox{box3}{+O{} +m +O{} +O{} O{ColorA} O{\faCodepen}}{
ColorfulBox=#2/#3/#4/#5,
%%%%
underlay boxed title={
\BoxTitleFont
\def\@BoxTitle@Radius{\dimexpr\baselineskip/2\relax}%0.85
\pgfgetnodeheight(title)\@BoxTitle@Height
\ifdim\@BoxTitle@Height>2\@BoxTitle@Radius
\draw[white,fill=white,line width=10.0pt](title.north east)--([xshift={sqrt(15)*\@BoxTitle@Radius/7+\@BoxTitle@Radius}]title.north west)arc(asin(7/8):{270-asin(7/8)}:{8*\@BoxTitle@Radius/7})[rounded corners=\@BoxTitle@Radius]--(title.south west)--(title.south east)--cycle;
\draw[#5,fill=#5!90,line width=2.0pt](title.north east)--([xshift={sqrt(15)*\@BoxTitle@Radius/7+\@BoxTitle@Radius}]title.north west)arc(asin(7/8):{270-asin(7/8)}:{8*\@BoxTitle@Radius/7})[rounded corners=\@BoxTitle@Radius]--(title.south west)--(title.south east)--cycle;
\else
\draw[white,fill=white,line width=10.0pt](title.north east)--([xshift={sqrt(15)*\@BoxTitle@Radius/7+\@BoxTitle@Radius}]title.north west)arc(asin(7/8):{360-asin(7/8)}:{8*\@BoxTitle@Radius/7})[rounded corners=\@BoxTitle@Radius]--(title.south east)--cycle;
\draw[#5,fill=#5!90,line width=2.0pt](title.north east)--([xshift={sqrt(15)*\@BoxTitle@Radius/7+\@BoxTitle@Radius}]title.north west)arc(asin(7/8):{360-asin(7/8)}:{8*\@BoxTitle@Radius/7})[rounded corners=\@BoxTitle@Radius]--(title.south east)--cycle;
\fi
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=white](P)at([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west){#6};
},
#1}

%%%%
\def\@Definiton@Title{定义}
\def\@Definiton@Number{\the@prenumber.\the@def}
%%%%
\def\@Theorem@Title{定理}
\def\@Theorem@Number{\the@prenumber.\the@thm}
%%%%
\def\@Axiom@Title{公理}
\def\@Axiom@Number{\the@prenumber.\the@axm}

%%编号定义盒子%%
\DeclareDocumentEnvironment{Definition}{ +O{} +O{} }{\begin{box3}[phantom={
\if@mainmatter
\refstepcounter{@def}
\fi}]{%
\@Definiton@Title%
\if@mainmatter%
{~\sffamily\@Environment@Mark\@Definiton@Number}%
\fi}
[#1][#2][ColorA][\faCrosshairs]}{\end{box3}}
%%%%
\DeclareDocumentEnvironment{Theorem}{ +O{} +O{} }{\begin{box3}[phantom={
\if@mainmatter
\refstepcounter{@thm}
\fi}]{%
\@Theorem@Title%
\if@mainmatter%
{~\sffamily\@Environment@Mark\@Theorem@Number}%
\fi}
[#1][#2][ColorB][\faCrosshairs]}{\end{box3}}
%%%%
\DeclareDocumentEnvironment{Axiom}{ +O{} +O{} }{\begin{box3}[phantom={
\if@mainmatter
\refstepcounter{@axm}
\fi}]{%
\@Axiom@Title%
\if@mainmatter%
{~\sffamily\@Environment@Mark\@Axiom@Number}%
\fi}
[#1][#2][ColorI][\faCompactDisc]}{\end{box3}}
%%%%

%%不编号定义盒子%%
\DeclareDocumentEnvironment{Definition*}{ +O{} +O{} }{\begin{box3}{\@Theorem@Title}[#1][#2][ColorA][\faCrosshairs]}{\end{box3}}
\DeclareDocumentEnvironment{Theorem*}{ +O{} +O{} }{\begin{box3}{\@Theorem@Title}[#1][#2][ColorB][\faCrosshairs]}{\end{box3}}
\DeclareDocumentEnvironment{Axiom*}{ +O{} +O{} }{\begin{box3}{\@Axiom@Title}[#1][#2][ColorI][\faCompactDisc]}{\end{box3}}
%%%%
%%设置引理盒子%%
\DeclareTColorBox{box4}{+O{} +m +O{} +O{} O{ColorA} O{\faDiceD20}}{
ColorfulBox=#2/#3/#4/#5,
%%%%
underlay boxed title={
\BoxTitleFont
\def\@BoxTitle@Radius{\dimexpr\baselineskip/2\relax}%0.85
\draw[white,fill=white,line width=10.0pt]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle({8*\@BoxTitle@Radius/7});
\draw[white,fill=white,rounded corners=\@BoxTitle@Radius,line width=10.0pt](title.north west)rectangle(title.south east);
\draw[#5,fill=#5,rounded corners=\@BoxTitle@Radius,ultra thick](title.north west)rectangle(title.south east);
\draw[#5,fill=white,line width=2.75pt]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle({8*\@BoxTitle@Radius/7});
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=#5](P)at([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west){#6};},
#1}

%%%%
\def\@Lemma@Title{引理}
\def\@Lemma@Number{\the@prenumber.\the@lem}
%%%%
\def\@Corollary@Title{推论}
\def\@Corollary@Number{\the@prenumber.\the@colry}
%%%%
\def\@Propostion@Title{命题}
\def\@Proposition@Number{\the@prenumber.\the@prop}

%%编号引理盒子%%
\DeclareDocumentEnvironment{Lemma}{ +O{} +O{}}{\begin{box4}[phantom={
\if@mainmatter
\refstepcounter{@lem}
\fi}]{%
\@Lemma@Title%
\if@mainmatter%
{~\sffamily\@Environment@Mark\@Lemma@Number}%
\fi}
[#1][#2][ColorE][\faGlobe]}{\end{box4}}
%%%%
\DeclareDocumentEnvironment{Corollary}{ +O{} +O{} }{\begin{box4}[phantom={
\if@mainmatter
\refstepcounter{@colry}
\fi
}]{%
\@Corollary@Title%
\if@mainmatter%
{~\sffamily\@Environment@Mark\@Corollary@Number}%
\fi}
[#1][#2][ColorG][\faCompactDisc]}{\end{box4}}
%%%%
\DeclareDocumentEnvironment{Proposition}{ +O{} +O{} }{\begin{box4}[phantom={
\if@mainmatter
\refstepcounter{@prop}
\fi
}]{%
\@Propostion@Title%
\if@mainmatter%
{~\sffamily\@Environment@Mark\@Proposition@Number}%
\fi}
[#1][#2][ColorH][\faGlobe]}{\end{box4}}
%%%%
%%不编号引理盒子%%
\DeclareDocumentEnvironment{Lemma*}{ +O{} +O{} }{\begin{box4}{\@Lemma@Title}[#1][#2][ColorE][\faGlobe]}{\end{box4}}
\DeclareDocumentEnvironment{Corollary*}{ +O{} +O{} }{\begin{box4}{\@Corollary@Title}[#1][#2][ColorG][\faCompactDisc]}{\end{box4}}
\DeclareDocumentEnvironment{Proposition*}{ +O{} +O{} }{\begin{box4}{\@Propostion@Title}[#1][#2][ColorH][\faGlobe]}{\end{box4}}
%%%%
%设置拓展盒子%%
\DeclareTColorBox{box5}{+O{} +m +O{} +O{} O{ColorA} O{\faLink}}{
ColorfulBox=#2/#3/#4/#5,
%%%%
underlay boxed title={
\BoxTitleFont
\def\@BoxTitle@Radius{\dimexpr\baselineskip/2\relax}%0.85
\draw[white,fill=white,rounded corners=\@BoxTitle@Radius,line width=10.0pt](title.north west)rectangle(title.south east);
\draw[#5,fill=#5,rounded corners=\@BoxTitle@Radius,ultra thick](title.north west)rectangle(title.south east);
\fill[white,draw=white,line width=10.0pt]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle({8*\@BoxTitle@Radius/7});
\fill[white,draw=#5,line width=2.75pt]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle({8*\@BoxTitle@Radius/7});
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=#5] at([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west){#6};},
#1}

\DeclareDocumentEnvironment{Link}{ +O{} +O{} }{\begin{box5}{拓展链接}[#1][#2][ColorE][\faLink]}{\end{box5}}
\DeclareDocumentEnvironment{History}{ +O{} +O{} }{\begin{box5}{科学发展史}[#1][#2][ColorC][\faCalendar*]}
{\end{box5}}
\DeclareDocumentEnvironment{STS}{ +O{} +O{} }{\begin{box5}{科学·技术·社会}[#1][#2][ColorH][\faCog]}
{\end{box5}}

%%设置案例盒子%%
\DeclareTColorBox{box6}{+O{} +m +O{} +O{} O{ColorA} O{\faFile*}}{
ColorfulBox=#2/#3/#4/#5,
%%%%
underlay boxed title={
\BoxTitleFont
\def\@BoxTitle@Radius{\dimexpr\baselineskip/2\relax}%0.85
\draw[white,fill=white,line width=10.0pt,rounded corners=\@BoxTitle@Radius](title.north east)rectangle(title.south west);
\draw[#5!90,fill=#5!90,line width=2.0pt,rounded corners=\@BoxTitle@Radius](title.north east)rectangle(title.south west);
%%%%
\fill[white,draw=white]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle({5*\@BoxTitle@Radius/3});
\draw[#5,fill=white,line width=2.75pt]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle({8*\@BoxTitle@Radius/7});
%%%%
\pgfgetnodeheight(title)\@BoxTitle@Height
\ifdim\@BoxTitle@Height>2\@BoxTitle@Radius
\draw[#5,line width=2.0pt]
(title.north east)[sharp corners]--
([xshift={7*\@BoxTitle@Radius/3}]title.north west)arc(asin(3/5):{-asin(3/5)-90}:{5*\@BoxTitle@Radius/3})[rounded corners=\@BoxTitle@Radius]--
(title.south west)[rounded corners=\@BoxTitle@Radius]--
(title.south east)[rounded corners=\@BoxTitle@Radius]--cycle;
\else
%%%%
\draw[#5,line width=2.0pt]
(title.north east)[sharp corners]--
([xshift={7*\@BoxTitle@Radius/3}]title.north west)arc(asin(3/5):-asin(3/5):{5*\@BoxTitle@Radius/3})[rounded corners=\@BoxTitle@Radius]--
(title.south east)[rounded corners=\@BoxTitle@Radius]--cycle;
\fi
%%%%
\node[circle,align=center,inner sep=0mm,font=\BoxLogoFont,text=#5](T)at([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west){#6};},
#1}

\DeclareDocumentEnvironment{Information}{ +O{} +O{} }{\begin{box6}{资料卡片}[#1][#2][ColorI][\faFile*]}{\end{box6}}
\DeclareDocumentEnvironment{Application}{ +O{} +O{} }{\begin{box6}{案例分析}[#1][#2][ColorA][\faTools]}{\end{box6}}
\DeclareDocumentEnvironment{Review}{ +O{} +O{} }{\begin{box6}{知识回顾}[#1][#2][ColorC][\faFan]}{\end{box6}}

%%%%
\DeclareTColorBox{box7}{ +O{} +O{} }{BlockBox=#2,#1}
%%
\newenvironment{Proof}{\begin{box7}[][\faBars~~证明]}{\end{box7}}
%%
\newenvironment{Solution}{\begin{box7}[][\faBars~~参考答案]}{\end{box7}}
%%
\DeclareDocumentEnvironment{Block}{ +O{} }{\begin{box7}[][#1]}{\end{box7}}

%%%%
\DeclareTColorBox{box8}{+O{} +m +O{} +O{} O{ColorA} O{}}{CodeBox=#2/#3/#4/#5/#6,#1}

\NewDocumentEnvironment{Comprehension}{ +O{} +O{} }{\begin{box8}[step=@comprehension]{阅读理解~{\sffamily\the@comprehension}}[#1][#2][ColorB]}{\end{box8}}
%%
\NewDocumentEnvironment{Cloze}{ +O{} +O{} }{\begin{box8}[step=@cloze]{完形填空~{\sffamily\the@cloze}}[#1][#2][ColorA]}{\end{box8}}
%%
\NewDocumentEnvironment{Article}{ +O{} +O{} }{\begin{box8}{文本解读}[#1][#2][ColorC]}{\end{box8}}
%%
\NewDocumentEnvironment{Vocabulary}{ +O{} +O{} }{\begin{box8}{词汇解析}[#1][#2][ColorE]}{\end{box8}}
%%%%
%%修改代码盒子左侧行数样式%%
\renewcommand{\theFancyVerbLine}{\LineNumFont\color{ColorA}{\arabic{FancyVerbLine}}}
%%%%
\newtcblisting{PythonBox}[1][]{
CodeBox={代码示例}/#1/{}/ColorA/{\uppercase{\sffamily python}},
before upper={},before lower={},
minted options={breaklines,autogobble,linenos,numbersep=8.5mm},
listing only,listing engine=minted,
minted language=python}

\newtcblisting{CppBox}[1][]{
CodeBox={代码示例}/#1/{}/ColorB/{\uppercase{\sffamily cpp}},
before upper={},before lower={},
minted options={breaklines,autogobble,linenos,numbersep=8.5mm},
listing only,listing engine=minted,
minted language=cpp}

\newtcblisting{JavaBox}[1][]{
CodeBox={代码示例}/#1/{}/ColorC/{\uppercase{\sffamily java}},
before upper={},before lower={},
minted options={breaklines,autogobble,linenos,numbersep=8.5mm},
listing only,listing engine=minted,
minted language=java}

\newtcblisting{CodeBox}[3][]{
CodeBox={代码示例}/#1/{}/#3/{\uppercase{\sffamily#2}},
before upper={},before lower={},
minted options={breaklines,autogobble,linenos,numbersep=8.5mm},
listing only,listing engine=minted,
minted language=#2}

%%%%
%设置注释盒子%%
\DeclareTColorBox{box9}{ +O{} O{ColorA} O{\faCommentDots} +m }{NoteBox=#2/{#3~~#4},#1}

%%%%
%%+m表示允许换行、空行的参数%%
\DeclareDocumentCommand{\RelaInfo}{ s +m }
{\IfBooleanTF{#1}
{\marginpar{\upshape%
\begin{box9}[][ColorH][\faCommentDots]{相关信息}
#2
\end{box9}}
}{%
\begin{box9}[][ColorH][\faCommentDots]{相关信息}
#2
\end{box9}}
}
%%%%
\DeclareDocumentCommand{\DeepThink}{ s +m }
{\IfBooleanTF{#1}
{\newmarginpar{\upshape%
\begin{box9}[][ColorB!90!black][\faTh]{深入思考}
#2
\end{box9}}
}{%
\begin{box9}[][ColorB!90!black][\faTh]{深入思考}
#2
\end{box9}}
}
%%%%
\DeclareDocumentCommand{\Remark}{ s +m }
{\IfBooleanTF{#1}
{\newmarginpar{\upshape%
\begin{box9}[][ColorF][\faChrome]{重点注释}
#2
\end{box9}}
}{%
\begin{box9}[][ColorF][\faChrome]{重点注释}
#2
\end{box9}}
}

%%数学公式小盒子%%
\newtcbox{\Formula}[1][]{%
nobeforeafter,math upper,tcbox raise base,
enhanced standard,
before={\begin{center}},after={\end{center}},
colframe=ColorB!7.5,colback=ColorB!7.5,
rounded corners,arc=5.0pt,colupper=ColorA,#1}

%%重定义标题页%%
\renewcommand{\maketitle}{%
\begin{titlepage}%
\setlength{\parindent}{0em}
\begin{tikzpicture}[remember picture,overlay]%
\coordinate(A)at(current page.north west);
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
\coordinate(D)at(current page.south west);
\coordinate(E)at([xshift=\@GutterWidth,yshift=\@FrameWidth]current page.south west);
\coordinate(F)at([xshift=-\@FrameWidth,yshift=\@FrameWidth]current page.south east);
\coordinate(G)at([xshift=-\@FrameWidth,yshift=-\@FrameWidth]current page.north east);
\coordinate(H)at([xshift=\@GutterWidth,yshift=-\@FrameWidth]current page.north west);
%%背景%%
\draw[ColorB!7.5,fill=ColorB!7.5,sharp corners](D)rectangle(B);
%%
\path[fill=ColorB!15]
(A)--(B)--(C)--(D)--cycle
(E)[rounded corners=5.0mm]--(F)[rounded corners=5.0mm]--(G)[sharp corners]--(H)[sharp corners]--cycle;
\path[pattern={Lines[angle=-45,distance=5.0pt,line width=4.0pt]},pattern color=ColorB!30]
(A)--(B)--(C)--(D)--cycle
(E)[rounded corners=5.0mm]--(F)[rounded corners=5.0mm]--(G)[sharp corners]--(H)[sharp corners]--cycle;
\end{tikzpicture}%
\centering\color{ColorA}\bfseries%
%%书籍系列%%
\ifdefvoid{\@series}{}{%
{\FontSizeSet{15pt}{18pt}\rmfamily\@series\\}}%
\vskip1.0cm%
%%标题%%
{\FontSizeSet{55pt}{66pt}\rmfamily\@title\\}%
%%英文标题%%
\ifdefvoid{\@englishtitle}{}{%
\vskip0.5cm%
{\FontSizeSet{20pt}{24pt}\sffamily\@englishtitle\\}}
%%副标题%%
\ifdefvoid{\@subtitle}{}{%
\vskip0.75cm%
{\FontSizeSet{30pt}{36pt}\rmfamily\@subtitle\\}}%
%%英文副标题%%
\ifdefvoid{\@englishsubtitle}{}{%
\vskip0.25cm%
{\FontSizeSet{17.5pt}{21pt}\sffamily\@englishsubtitle\\}}%
%%版本号%%
\ifdefvoid{\@version}{}{%
\vskip0.75cm%
{\FontSizeSet{15pt}{18pt}\rmfamily 第{\@version}版\\}}%
\vskip1.0cm%
%%作者%%
{\FontSizeSet{15pt}{18pt}\rmfamily%
\begin{varwidth}{\linewidth-4.0cm}
\@author
\end{varwidth}%
\qquad%
\begin{varwidth}{2.0cm}
编著
\end{varwidth}%
\\}%
\vfill%
%%出版社%%
{\FontSizeSet{15pt}{18pt}\rmfamily\ifdefvoid{\@presslogo}{}{\raisebox{-0.2cm}{\mbox{\includegraphics[width=0.75cm]{\@presslogo}}}}\hskip0.25cm\@pressname\\}%
\end{titlepage}}
\makeatother
