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
\ProcessKeyvalOptions*%\relax
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
\newcommand{\SubsectionSubTFont}{\rmfamily\bfseries\FontSizeSet{14pt}{16.8pt}}%小节副标题字体
\newcommand{\SubsubsectionFont}{\rmfamily\bfseries\FontSizeSet{14.5pt}{17.4pt}}%小小节字体
\newcommand{\ParagraphNameFont}{\rmfamily\bfseries\FontSizeSet{14pt}{16.8pt}}%段落名称字体
\newcommand{\HeaderFont}{\rmfamily\bfseries\FontSizeSet{13pt}{16.9pt}}%页眉字体
\newcommand{\FooterFont}{\rmfamily\bfseries\FontSizeSet{13pt}{16.9pt}}%页脚字体
\newcommand{\PageNumberFont}{\sffamily\bfseries\FontSizeSet{16pt}{19.2pt}}%页码字体
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
\newcommand{\PracticeTitleFont}{\rmfamily\bfseries\FontSizeSet{13pt}{16.9pt}}%练习标题字体
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
\RequirePackage{ragged2e}%对齐设置
\gdef\@MarginColumn@Ratio{0.25}
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
%%页面布局设置%%a4paper
\newlength{\@innerlen}
\newlength{\@outerlen}
\newlength{\@toplen}
\newlength{\@botlen}
\newlength{\@marginparwidthlen}
\newlength{\@marginparseplen}
\newlength{\@handseplen}
\newlength{\@footskiplen}
\setlength{\@innerlen}{2.5cm}
\setlength{\@outerlen}{2.25cm}
\setlength{\@toplen}{2.5cm}
\setlength{\@botlen}{2.5cm}
\setlength{\@marginparwidthlen}{\dimeval{\@MarginColumn@Ratio\textwidth+2.0em}}
\setlength{\@marginparseplen}{-\@marginparwidthlen+0.75em}
\setlength{\@handseplen}{0.875cm}
\setlength{\@footskiplen}{0.95cm}
\RequirePackage[letterpaper,
inner=\@innerlen,outer=\@outerlen,top=\@toplen,bottom=\@botlen,
headsep=\@handseplen,footskip=\@footskiplen,
marginparsep=\@marginparseplen,marginparwidth=\@marginparwidthlen,reversemarginpar]{geometry}
\makeatother
\RequirePackage{emptypage,setspace,fancyhdr,lscape}%清除空页%行距%页眉页脚%旋转页面
\RequirePackage{extramarks}%创建额外的标记，使用方法类似于\markboth和\markright
\RequirePackage[strict]{changepage}%换页
%%边注格式%%
\let\oldmarginpar\marginpar
\renewcommand{\marginpar}[1]{\oldmarginpar{%
\setlength{\parindent}{2.0em}%
\MarginNoteFont#1}}
%%脚注格式%%
\gdef\footnoterule{}
\gdef\footnotesize{\color{ColorA}\FootNoteFont}
\makeatletter
%%\strut盒子高度调整%%
\newcommand{\AdjustStrut}[1]{
\setbox\strutbox\hbox{
\vrule height #1\ht\strutbox depth #1\dp\strutbox width\z@
}}
\makeatother

%%%%%%%%%%%%%%%%%%%% 图表插入宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{wrapfig}%文字环绕图片
\RequirePackage{graphicx}%插入图片路径
\RequirePackage{floatrow}%浮动体排布
\RequirePackage{caption}%图表标签
\RequirePackage{subcaption}%图表标签
%%设置图片和表格格式%%
\renewcommand{\captionfont}{\color{ColorA}\CaptionFont}
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
\else%
\relax%
\fi}
\renewcommand{\thetable}{%
\if@mainmatter%	
\the@prenumber.\arabic{table}%
\else%
\relax%
\fi}
%%
\def\fnum@figure{{\color{ColorA!50}\faSquare}\nobreakspace\figurename\nobreakspace{\sffamily\thefigure}}
\def\fnum@table{{\color{ColorA!50}\faSquare}\nobreakspace\tablename\nobreakspace{\sffamily\thetable}}
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
\RenewDocumentCommand{\tableofcontents}{s D<>{1} +O{}}{
\begingroup%确保计数器值只在局部生效
\chapter*{\contentsname}
\c@tocdepth=#2%预设目录深度为1
\IfBooleanTF{#1}{
\begin{paracol}{2}
\@starttoc{toc}
\switchcolumn
\MarginNoteFont#3
\end{paracol}}
{\@starttoc{toc}}
\endgroup}
%%重定义\listoffigures%%
\RenewDocumentCommand{\listoffigures}{s +O{}}{
\chapter*{\listfigurename}
\IfBooleanTF{#1}{
\begin{paracol}{2}
\@starttoc{lof}
\switchcolumn
\MarginNoteFont#2
\end{paracol}}
{\@starttoc{lof}}
}
%%重定义\listoftables%%
\RenewDocumentCommand{\listoftables}{s +O{}}{
\chapter*{\listtablename}
\IfBooleanTF{#1}{
\begin{paracol}{2}
\@starttoc{lot}
\switchcolumn
\MarginNoteFont#2
\end{paracol}}
{\@starttoc{lot}}
}
%%重定义\shorttableofcontents%%
\RenewDocumentCommand{\shorttableofcontents}{s D<>{0} +O{}}{
\begingroup%确保计数器值只在局部生效
\chapter*{\shorttocname}
\c@tocdepth=#2%预设目录深度为0
\IfBooleanTF{#1}{
\begin{paracol}{2}
\@startshorttoc{toc}
\switchcolumn
\MarginNoteFont#3
\end{paracol}}
{\@startshorttoc{toc}}
\endgroup}
\makeatother

%%%%%%%%%%%%%%%%%%%% 参考文献宏包 %%%%%%%%%%%%%%%%%%%%
%%参考文献编译方式：先用XeLaTeX编译主文件.tex一次；再用BibTeX编译主文件（或各子文件）.tex一次；然后用XeLaTeX编译主文件.tex两次%%
\RequirePackage[numbers,sectionbib]{natbib}%参考文献格式
\renewcommand{\bibnumfmt}[1]{\protect\NumberedLabel{#1}}%修改参考文献序号样式
\renewcommand{\citenumfont}[1]{\color{ColorA}\CiteNumFont#1}%修改引用样式
\bibpunct{\color{ColorA}{[}}{\color{ColorA}{]}}{,}{n}{}{;}%修改方括号颜色
\renewcommand{\bibname}{参考文献}%修改参考文献标题
%%根据类布尔参数splitbib的存在与否来判断是否加载宏包chapterbib%%
\makeatletter
\ifTextBook@splitbib
\RequirePackage{chapterbib}%分章节显示参考文献，且参考文献编号各自独立
\fi
%%设置参考文献输出命令键%%
\define@boolkey{printbib}{intoc}[true]{}
\def\prtbib@envbiblevel{\@ifundefined{chapter}{\section}{\chapter}*}
\define@key{printbib}{envlevel}{\def\prtbib@envbiblevel{#1}}
\def\prtbib@biblevel{\@ifundefined{chapter}{\section}{\chapter}*}
\define@key{printbib}{level}{\def\prtbib@biblevel{#1}}
\def\prtbib@toclevel{\@ifundefined{chapter}{section}{chapter}}
\define@key{printbib}{toclevel}{\def\prtbib@toclevel{#1}}
\def\prtbib@envtoclevel{\@ifundefined{chapter}{section}{chapter}}
\define@key{printbib}{envtoclevel}{\def\prtbib@envtoclevel{#1}}
%%设置默认键值%%
\setkeys{printbib}{level=\chapter*,envlevel=\chapter,toclevel=chapter,envtoclevel=chapter}
%%参考文献样式设置命令%%
\newcommand{\bibsetup}[1]{\setkeys{printbib}{#1}}
%%参考文献输出设置%%
\newcommand{\printbib}[1]{
\colorlet{ListColor}{ColorA}
\if@appendix
\renewcommand{\bibsection}{
\prtbib@envbiblevel{\bibname}
\ifKV@printbib@intoc\phantomsection
\addcontentsline{toc}{\prtbib@envtoclevel}{\bibname}\fi}
\else
\renewcommand{\bibsection}{
\prtbib@biblevel{\bibname}
\ifKV@printbib@intoc\phantomsection
\addcontentsline{toc}{\prtbib@toclevel}{\bibname}\fi}
\fi
\bibliographystyle{plain}
\bibliography{#1}}
\makeatother

%%%%%%%%%%%%%%%%%%%% 索引宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{filecontents}%在tex内编写数据文件
\RequirePackage[splitindex]{imakeidx}%索引设置，splitindex参数自动分割索引\\Large
%%索引风格文件indexstyle.ist%%
\begin{filecontents}[overwrite]{indexstyle.ist}
headings_flag 1
heading_prefix "\n\\centering\\bfseries\\color{ColorA}"
heading_suffix "\\normalfont\\color{black}\\nopagebreak\n"
delim_0 " \\hfill " 
delim_1 " \\hfill "
delim_2 " \\hfill "
\end{filecontents}

\makeatletter
%%添加新关键字envlevel（环境中索引层次）%%
\def\imki@envindexlevel{\@ifundefined{chapter}{\section}{\chapter}*}
\define@key{imkiindex}{envlevel}{\def\imki@envindexlevel{#1}}
%%添加新关键字envtoclevel（环境中索引的目录层次）%%
\def\imki@envtoclevel{\@ifundefined{chapter}{section}{chapter}}
\define@key{imkiindex}{envtoclevel}{\def\imki@envtoclevel{#1}}
%%设置默认键值（不要引入noclearpage选项，否则会出现目录页码错误）%%
\setkeys{imkiindex}{level=\chapter*,envlevel=\chapter,toclevel=chapter,envtoclevel=chapter}
%%修改索引环境%%
\ifimki@original
\expandafter\def\expandafter\theindex\expandafter{\expandafter
\imki@maybeaddtotoc\theindex}
\else
\global\let\imki@idxprologue\relax
\renewenvironment{theindex}{
%%%%%%%%%% 修改部分开始 %%%%%%%%%%
\if@appendix%判断索引所在环境
\imki@envindexlevel{\indexname}
\else
\imki@indexlevel{\indexname}
\fi
\imki@maybeaddtotoc%添加目录
%\imki@indexheaders%注释掉页眉设置
%\thispagestyle{\imki@firstpagestyle}%注释掉首页页面样式
%%%%%%%%%% 修改部分结束 %%%%%%%%%%
\ifnum\imki@columns>\@ne
\columnsep\imki@columnsep
\ifx\imki@idxprologue\relax
\begin{multicols}{\imki@columns}
\else
\begin{multicols}{\imki@columns}[\imki@idxprologue]
\fi
\else
\imki@idxprologue
\fi
\global\let\imki@idxprologue\relax
\parindent\z@
\parskip\z@\@plus0.3\p@\relax
\columnseprule
\ifKV@imki@columnseprule0.4\p@\else\z@\fi
\raggedright
\let\item\@idxitem
\imki@othercode}{
\ifnum\imki@columns>\@ne
\end{multicols}
\fi}
\fi

%%修改目录添加%%
\def\imki@putindexsplit#1{
\ifimki@nonewpage\else
\imki@clearpage
\ifimki@disableautomatic\else
\immediate\closeout\csname #1@idxfile\endcsname
\fi\fi
\let\imki@indexname\indexname
\@nameuse{imki@set@#1}\imki@decide
\if@tempswa
\imki@exec{\imki@program\imki@options#1.idx}
\else
\imki@finalmessage{#1}
\fi
%%%%%%%%%% 修改部分开始 %%%%%%%%%%
\ifKV@imki@intoc
\if@appendix
\def\imki@maybeaddtotoc{\@nameuse{phantomsection}
\addcontentsline{toc}{\imki@envtoclevel}{\imki@title}}
\else
\def\imki@maybeaddtotoc{\@nameuse{phantomsection}
\addcontentsline{toc}{\imki@toclevel}{\imki@title}}
\fi
\else
\def\imki@maybeaddtotoc{}
\fi
%%%%%%%%%% 修改部分结束 %%%%%%%%%%
\ifx\imki@title\imki@check@indexname\else
\def\indexname{\imki@title}
\fi
\@input@{#1.ind}
\let\indexname\imki@indexname}
%%%%
\def\imki@putindexunique#1{
\ifimki@nonewpage\else
\imki@clearpage
\fi
\let\imki@indexname\indexname
\@nameuse{imki@set@#1}\imki@decide
\if@tempswa
\ifimki@splitdone\else
\ifimki@disableautomatic\else
\immediate\closeout\@indexfile
\fi
\imki@exec{splitindex \imki@splitindexoptions\space\imki@jobname.idx}
\global\imki@splitdonetrue
\fi
\else
\ifimki@splitdone\else
\imki@splitindexmessage\global\imki@splitdonetrue
\fi\fi
\if@tempswa
\imki@exec{\imki@program\imki@options\imki@jobname-#1.idx}
\fi
%%%%%%%%%% 修改部分开始 %%%%%%%%%%
\ifKV@imki@intoc
\if@appendix
\def\imki@maybeaddtotoc{\@nameuse{phantomsection}
\addcontentsline{toc}{\imki@envtoclevel}{\imki@title}}
\else
\def\imki@maybeaddtotoc{\@nameuse{phantomsection}
\addcontentsline{toc}{\imki@toclevel}{\imki@title}}
\fi
\else
\def\imki@maybeaddtotoc{}
\fi
%%%%%%%%%% 修改部分结束 %%%%%%%%%%
\ifx\imki@title\imki@check@indexname\else
\def\indexname{\imki@title}
\fi
\@input@{\imki@jobname-#1.ind}
\let\indexname\imki@indexname}

\makeatother

%%定义中文索引命令，#2是中文，#3是全拼（首字母）%%
\NewDocumentCommand{\zhindex}{omm}{\IfValueTF{#1}{\index[#1]{#3@#2}}{\index{#3@#2}}}

%%%%%%%%%%%%%%%%%%%% 术语表宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{nomencl}%引入术语表
%%生成主要符号表的方法：主文件先用XeLaTeX编译一次，然后建立一个.bat文件，内容为：makeindex <filename>.nlo -s nomencl.ist -o <filename>.nls -t <filename>.nlg，运行，再用XeLaTeX编译主文件两次即可生成%%
\renewcommand{\nomname}{主要符号表}%更改符号表标题

\makeatletter
%%以下命令会令nomencl宏包选项失效，符号表的具体设置需要在主文件中进行%%
%%设置符号表输出命令键%%
\newif\if@nomencl@columnseprule
\define@key{nomen}{columns}{\def\@nomencl@columns{#1}}
\define@key{nomen}{columnsep}{\def\@nomencl@columnsep{#1}}
%%添加新关键字level%%
\def\@nomencl@level{\@ifundefined{chapter}{\section}{\chapter}*}
\define@key{nomen}{level}{\def\@nomencl@level{#1}}
%%添加新关键字envlevel%%
\def\@nomencl@envlevel{\@ifundefined{chapter}{\section}{\chapter}*}
\define@key{nomen}{envlevel}{\def\@nomencl@envlevel{#1}}
%%添加新关键字toclevel%%
\def\@nomencl@toclevel{\@ifundefined{chapter}{section}{chapter}}
\define@key{nomen}{toclevel}{\def\@nomencl@toclevel{#1}}
%%添加新关键字envtoclevel%%
\def\@nomencl@envtoclevel{\@ifundefined{chapter}{section}{chapter}}
\define@key{nomen}{envtoclevel}{\def\@nomencl@envtoclevel{#1}}
%%定义产生一对布尔键的命令%%
\newcommand{\@nomen@define@pairboolkeys}[4]{
\define@boolkey{nomen}{#1}[true]{#2}
\define@boolkey{nomen}{#3}[true]{#4}}
%%
\@nomen@define@pairboolkeys{columnseprule}{\@nomencl@columnsepruletrue}{nocolumnseprule}{\@nomencl@columnseprulefalse}
\@nomen@define@pairboolkeys{intoc}{\@intoctrue}{notintoc}{\@intocfalse}
\@nomen@define@pairboolkeys{tocbasic}{\@nomencl@tocbasictrue}{notocbasic}{\@nomencl@tocbasicfalse}
%%设置默认键值%%
\setkeys{nomen}{level=\chapter*,envlevel=\chapter,toclevel=chapter,envtoclevel=chapter,
columns=2,columnsep=2.0em,notintoc,notocbasic,nocolumnseprule}
%%定义符号表设置命令%%
\newcommand{\nomensetup}[1]{\setkeys{nomen}{#1}}
%%修改符号表环境%%
\renewcommand{\thenomenclature}{
%%%%%%%%%% 修改部分开始 %%%%%%%%%%
\clearpage
\providecommand*{\listofnlsname}{\nomname}
\if@nomencl@tocbasic
\let\list@fname\listofnlsname
\def\@currext{nls}
\tocbasic@listhead{\list@fname}
\else
\if@appendix%判断索引所在环境
\@nomencl@envlevel{\nomname}
\if@intoc%判断是否存在intoc参数
\phantomsection
\addcontentsline{toc}{\@nomencl@envtoclevel}{\nomname}
\fi
\else
\@nomencl@level{\nomname}
\if@intoc%判断是否存在intoc参数
\phantomsection
\addcontentsline{toc}{\@nomencl@toclevel}{\nomname}
\fi\fi
\fi
\nompreamble
\ifnum\@nomencl@columns>\@ne%多列符号表设置
\begin{multicols}{\@nomencl@columns}
\columnsep\@nomencl@columnsep
\columnseprule
\if@nomencl@columnseprule0.4\p@\else\z@\fi
\fi
%%%%%%%%%% 修改部分结束 %%%%%%%%%%
\if@nomentbl
\let\itemOrig=\item
\def\item{\gdef\item{\\}}
\expandafter\longtable\expandafter{\@nomtableformat}
\else
\list{}{
\labelwidth\nom@tempdim
\leftmargin\labelwidth
\advance\leftmargin\labelsep
\itemsep\nomitemsep
\let\makelabel\nomlabel}
\fi}
%%
\def\endthenomenclature{
\if@nomentbl
\item\endlongtable
\global\let\item=\itemOrig
\else
\endlist
\fi
%%%%%%%%%% 修改部分开始 %%%%%%%%%%
\nompostamble
\ifnum\@nomencl@columns>\@ne
\end{multicols}
\fi
%%%%%%%%%% 修改部分结束 %%%%%%%%%%
}
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
%%设置列表参数%%
\setlength{\itemsep}{0pt}
\setlength{\parsep}{0pt}
\setlength{\parskip}{0pt}
\RequirePackage{listings,minted}%伪代码环境
\usemintedstyle{xcode}
%为了使宏包minted正常工作，需要在xelatex编译器参数中添加-shell-escape
\RequirePackage{lineno}%行号宏包
\renewcommand{\linenumberfont}{\color{ColorA}\LineNumFont}%修改行号字体
\setlength{\linenumbersep}{5.5mm}%修改行号与正文的间距

%%%%%%%%%%%%%%%%%%%% 绘图与表格宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{pifont,fontawesome5}%图标
\RequirePackage{anyfontsize}%自由调整字体大小
\RequirePackage{tabularx,colortbl,array,tabularray,booktabs,multirow}%表格
\RequirePackage{pgfplots,tikzpagenodes,tikz,eso-pic,tkz-euclide}%绘图
\usetikzlibrary{fit,calc,math,scopes,backgrounds,positioning,intersections,decorations,shadows,
shadings,fadings,arrows,arrows.meta,patterns.meta,patterns,shapes.geometric,decorations.footprints}
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
\RequirePackage{xr}%文件之间的交叉引用
\RequirePackage[hidelinks,pagebackref]{hyperref}%超链接设置
\RequirePackage{cleveref}%带前缀名称引用，必须放在hyperref之后

%%%%%%%%%%%%%%%%%%%% 计数器宏包 %%%%%%%%%%%%%%%%%%%%
\RequirePackage{zhnumber,totcount}%中文计数器%获取计数器的最大值
%%定义计数器%%
\makeatletter
\newcounter{@Thumb@Number}%记录侧标数
\regtotcounter{@Thumb@Number}%获取侧标数最大值，需要编译两次才能正确获取
\newcounter{@Total@PartNumber}%记录所有部分的总数
\regtotcounter{@Total@PartNumber}
\newcounter{@egnum}[section]
\newcounter{@varnum}[section]
\newcounter{@def}[section]
\newcounter{@thm}[section]
\newcounter{@axm}[section]
\newcounter{@lem}[section]
\newcounter{@colry}[section]
\newcounter{@prop}[section]
\newcounter{@check}
\newcounter{@reading}
\newcounter{@cloze}
\makeatother
\renewcommand{\thesubfigure}{\thefigure.\Alph{subfigure}}
\renewcommand{\thesubtable}{\thetable.\Alph{subtable}}
\renewcommand{\thepart}{\arabic{part}}
\renewcommand{\thesection}{\arabic{section}}
\renewcommand{\thesubsection}{\arabic{subsection}}

%%%%%%%%%%%%%%%%%%%% 列表环境 %%%%%%%%%%%%%%%%%%%%%%
%%设置不编号点样式%%
\newcommand*{\UnnumberedLabel}{%
\tikz[baseline=-0.4em]{%
\node[circle,fill=white,draw=ListColor,ultra thick,anchor=base,minimum size=1.0em,inner sep=0mm,outer sep=0mm]{};%
\node[circle,fill=ListColor,draw=ListColor,anchor=base,minimum size=0.5em,inner sep=0mm,outer sep=0mm]{};%
}}
%%设置编号点样式%%
\newcommand*{\NumberedLabel}[1]{%
\tikz[baseline=-0.1em]{%
\node[circle,fill=ListColor,draw=ListColor,ultra thick,anchor=base,minimum size=1.0em,align=center,inner sep=0mm,outer sep=0mm,font=\ListNumFont,text=white]{\maxsizebox{0.9em}{!}{#1}};}}
%%无编号列表环境%%
\NewDocumentEnvironment{UnnumberedItem}{O{1}}{%
\ifnum#1=1%
\begin{itemize}[label=\protect\UnnumberedLabel]%
\else%
\begin{multicols}{#1}%
\ItemFont%
\begin{itemize}[label=\protect\UnnumberedLabel]%
\fi%
}{%
\ifnum#1=1%
\end{itemize}%
\else%
\end{itemize}%
\end{multicols}%
\fi%
\global\colorlet{ListColor}{ColorA}}
%%编号列表环境%%
\NewDocumentEnvironment{NumberedItem}{O{1}}{%
\ifnum#1=1%
\begin{enumerate}[label=\protect\NumberedLabel{\arabic*}]%
\else%
\begin{multicols}{#1}%
\ItemFont%
\begin{enumerate}[label=\protect\NumberedLabel{\arabic*}]%
\fi%
}{%
\ifnum#1=1%
\end{enumerate}%
\else%
\end{enumerate}%
\end{multicols}%
\fi%
\global\colorlet{ListColor}{ColorA}}

%%设置星级%%
\NewDocumentCommand{\score}{m m O{ColorB}}{
\begin{tikzpicture}[baseline]
\foreach \i in {1,...,#1}{
\pgfmathparse{\i<=#2 ? "#3" : "white"}
\edef\circlecolor{\pgfmathresult}
\draw(\i*1.25em,0)node[name=circle\i,circle,inner sep=0mm,minimum size=0.35cm,draw=#3,very thick,fill=\circlecolor]{};}
\end{tikzpicture}}

%%%%%%%%%%%%%%%%%% 页面样式 %%%%%%%%%%%%%%%%%%%%%%%%
%%定义部分总数（序言、前言视作一个部分，目录、插图目录、表格目录视作一个部分，绪论、有编号部分、无编号部分以及后记）,编译两次可以得到正确的页面框架%%
%%页眉和侧标的默认值%%
\makeatletter
\newcommand{\DefaultMark}{
\markboth{\protect\@subtitle}{\protect\@subtitle}
\extramarks{\protect\@title}{\protect\@title}}
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
{\setlength{\SepH}{\dimexpr(\paperheight-2\DeltaH)/\totvalue{@Thumb@Number}}%设置侧标每次移动的距离
\setlength{\MarkY}{-\DeltaH}}%设置侧标上下两侧锚点坐标的初值
\pagestyle{MainPage}
\DefaultMark
\makeatother}

%%%%
\makeatletter
%%绘制页面框架%%
\newlength{\@ThumbMinimumHeight}
\setlength{\@ThumbMinimumHeight}{1.2cm}
\newlength{\@FrameWidth}
\setlength{\@FrameWidth}{1.0cm}
\newlength{\@PageNumWidth}
\setlength{\@PageNumWidth}{\@toplen-\@handseplen+1.0mm}
%%%%
\newcommand{\partlabelfront}{第}
\newcommand{\partlabelback}{部分}
\newcommand{\chapterlabelfront}{第}
\newcommand{\chapterlabelback}{章}
\newcommand{\sectionlabelfront}{第}
\newcommand{\sectionlabelback}{节}
\newcommand{\subsectionlabelfront}{课时}
\newcommand{\subsectionlabelback}{}
\renewcommand{\headrulewidth}{0pt}
\RenewDocumentCommand{\chaptermark}{ +m }{
\if@mainmatter
\markboth{\chapterlabelfront~{\sffamily\thechapter}~\chapterlabelback\quad#1}{\chapterlabelfront~{\sffamily\thechapter}~\chapterlabelback\quad#1}
\else
\markboth{#1}{#1}
\fi}
\RenewDocumentCommand{\sectionmark}{+m}{\markright{\sectionlabelfront~{\sffamily\thesection}~\sectionlabelback\quad#1}}
%%%%
%%绘制主页面样式%%
\newcommand{\@Main@PageStyle}{
\begin{tikzpicture}[remember picture,overlay]
%%根据页数的奇偶生成%%
\ifodd\value{page}
\coordinate(A)at(current page.north west);
\coordinate(B)at(current page.north east);
\coordinate(C)at(current page.south east);
\coordinate(D)at(current page.south west);
\coordinate(E)at([yshift=\@FrameWidth]current page.south west);
\coordinate(F)at([xshift=-\@FrameWidth,yshift=\@FrameWidth]current page.south east);
\coordinate(G)at([xshift=-\@FrameWidth,yshift=-\@FrameWidth]current page.north east);
\coordinate(H)at([yshift=-\@FrameWidth]current page.north west);
%%绘制页面框架%%
\draw[fill=ColorB!7.5,ColorB!7.5,sharp corners]
(A)--(B)--(C)--(D)--(E)[rounded corners=5.0mm]--(F)[rounded corners=5.0mm]--(G)[sharp corners]--(H)--cycle;
%%绘制页码%%
\draw[ColorA,fill=ColorA,line width=1.0pt]
([xshift=-\@outerlen+0.25cm]B)[rounded corners=1.5mm]--
([xshift=-\@outerlen+0.25cm,yshift=-\@PageNumWidth]B)[rounded corners=1.5mm]--
([xshift=-\@FrameWidth+0.15cm,yshift=-\@PageNumWidth]B)[sharp corners]--
([xshift=-\@FrameWidth+0.15cm]B)--cycle;
\node[font=\PageNumberFont,text=white,anchor=south,align=center,inner ysep=2.0mm](P)at([xshift=-\@outerlen/2-0.3cm,yshift=-\@PageNumWidth]B){\maxsizebox{0.8cm}{!}{\thepage}};
%%绘制侧标%%
\draw[draw=ColorA,fill=ColorA,sharp corners,line width=1.0pt]node[append after command={(T.north west)--(T.north east)--(T.south east)[rounded corners=1.75mm]--(T.south west)[rounded corners=1.75mm]--cycle},font=\ThumbFont,text=white,align=center,outer sep=0mm,inner xsep=2.5mm,inner ysep=3.5mm,anchor=east](T)at([yshift=\MarkY]B){\rotatebox[origin=c]{90}{\begin{varwidth}{\DeltaH}
\strut\lastxmark\strut
\end{varwidth}}};
%%%%
\else
\coordinate(A)at(current page.north east);
\coordinate(B)at(current page.north west);
\coordinate(C)at(current page.south west);
\coordinate(D)at(current page.south east);
\coordinate(E)at([yshift=\@FrameWidth]current page.south east);
\coordinate(F)at([xshift=\@FrameWidth,yshift=\@FrameWidth]current page.south west);
\coordinate(G)at([xshift=\@FrameWidth,yshift=-\@FrameWidth]current page.north west);
\coordinate(H)at([yshift=-\@FrameWidth]current page.north east);
%%绘制页面框架%%
\draw[fill=ColorB!7.5,ColorB!7.5,sharp corners]
(A)--(B)--(C)--(D)--(E)[rounded corners=5.0mm]--(F)[rounded corners=5.0mm]--(G)[sharp corners]--(H)--cycle;
%%绘制页码%%
\draw[ColorA,fill=ColorA,line width=1.0pt]
([xshift=\@outerlen-0.25cm]B)[rounded corners=1.5mm]--
([xshift=\@outerlen-0.25cm,yshift=-\@PageNumWidth]B)[rounded corners=1.5mm]--
([xshift=\@FrameWidth-0.15cm,yshift=-\@PageNumWidth]B)[sharp corners]--
([xshift=\@FrameWidth-0.15cm]B)--cycle;
\node[font=\PageNumberFont,text=white,anchor=south,align=center,inner ysep=2.0mm](P)at([xshift=\@outerlen/2+0.3cm,yshift=-\@PageNumWidth]B){\maxsizebox{0.8cm}{!}{\thepage}};
%%绘制侧标%%
\draw[draw=ColorA,fill=ColorA,sharp corners,line width=1.0pt]node[append after command={(T.north west)[rounded corners=1.75mm]--(T.north east)[rounded corners=1.75mm]--(T.south east)[sharp corners]--(T.south west)--cycle},font=\ThumbFont,text=white,align=center,outer sep=0mm,inner xsep=2.5mm,inner ysep=3.5mm,anchor=west](T)at([yshift=\MarkY]B){\rotatebox[origin=c]{270}{\begin{varwidth}{\DeltaH}
\strut\firstxmark\strut
\end{varwidth}}};
\fi
\end{tikzpicture}}
%%
%%定义主页面样式%%
\fancypagestyle{MainPage}{
\fancyhead{}
\fancyfoot{}
\fancyfoot[C]{\@Main@PageStyle}
\fancyhead[RO]{\HeaderFont\color{ColorA}\rightmark}
\fancyhead[LE]{\HeaderFont\color{ColorA}\leftmark}}
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
\partintro{}
\partimage{}
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
\filldraw[draw=ColorA,fill=ColorA,opacity=0.9](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\@Part@StripeWidth]D);
\coordinate(R)at([xshift=-\@Part@MiddleOuterBlockLength]Q);
\coordinate(T)at([yshift=-\@Part@BlockWidth]Q);
\coordinate(S)at([xshift=-\@Part@MiddleOuterBlockLength]T);
%%右侧色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.2](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\@Part@StripeWidth]T);
\coordinate(F)at([xshift=-\@Part@BlockWidth]E);
\coordinate(H)at(current page.south east);
\coordinate(G)at([xshift=-\@Part@BlockWidth]H);
%%右下角色块%%
\filldraw[draw=ColorA,fill=ColorA,opacity=0.9](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
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
\node[align=flush right,anchor=south east,font=\PartLabelFont,text=ColorA,inner xsep=0mm](NL)at([yshift=\@Part@StripeWidth+0.25cm]U){\begin{varwidth}{\textwidth-5.0cm}\strut#1\strut\end{varwidth}};
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(NL)\NLWidth
\coordinate(V)at([xshift=-\NLWidth]U);
\coordinate(W)at([xshift=-\NLWidth]X);
%%
%%页面中部色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.5,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=-\@Part@StripeWidth]V);
\coordinate(Z)at([yshift=-\@Part@StripeWidth]K);
\coordinate(YY)at([yshift=\@Part@StripeWidth]N);
\coordinate(ZZ)at([xshift=-\@Part@StripeWidth]W);
%%左侧色块%%
\filldraw[ColorB,fill=ColorB,opacity=0.2](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%部分名%%
\node[align=flush right,anchor=north east,font=\PartNameFont,text=ColorA,inner xsep=0mm](PT)at([yshift=-\@Part@StripeWidth-0.25cm]X){\begin{varwidth}{\textwidth-2.45cm}\strut#2\strut\end{varwidth}};
%%部分简介%%
\node[align=flush right,inner xsep=3.0mm,anchor=north east,font=\itshape\kaiti,text=ColorA](IT)at([yshift=-0.5cm]PT.south east){
\begin{varwidth}{\textwidth-2.75cm}
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
\NewDocumentCommand{\@Part@EvenPage@Style}{ +m +m }{
\begin{pgfonlayer}{@Part@Top}
%%右上角色块坐标%%
\coordinate(A)at(current page.north west);
\coordinate(B)at([xshift=\@Part@BlockWidth]current page.north west);
\coordinate(C)at([xshift=\@Part@BlockWidth,yshift=-\@Part@TopOuterBlockLength]current page.north west);
\coordinate(D)at([yshift=-\@Part@TopOuterBlockLength]current page.north west);
%%右上角色块%%
\filldraw[draw=ColorA,fill=ColorA,opacity=0.9](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\@Part@StripeWidth]D);
\coordinate(R)at([xshift=\@Part@MiddleOuterBlockLength]Q);
\coordinate(T)at([yshift=-\@Part@BlockWidth]Q);
\coordinate(S)at([xshift=\@Part@MiddleOuterBlockLength]T);
%%右侧色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.2](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\@Part@StripeWidth]T);
\coordinate(F)at([xshift=\@Part@BlockWidth]E);
\coordinate(H)at(current page.south west);
\coordinate(G)at([xshift=\@Part@BlockWidth]H);
%%右下角色块%%
\filldraw[draw=ColorA,fill=ColorA,opacity=0.9](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
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
\node[align=flush left,anchor=south west,font=\PartLabelFont,text=ColorA,inner xsep=0mm](NL)at([yshift=\@Part@StripeWidth+0.25cm]U){\begin{varwidth}{\textwidth-5.0cm}\strut#1\strut\end{varwidth}};
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(NL)\NLWidth
\coordinate(V)at([xshift=\NLWidth]U);
\coordinate(W)at([xshift=\NLWidth]X);
%%
%%页面中部色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.5,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=\@Part@StripeWidth]V);
\coordinate(Z)at([yshift=-\@Part@StripeWidth]K);
\coordinate(YY)at([yshift=\@Part@StripeWidth]N);
\coordinate(ZZ)at([xshift=\@Part@StripeWidth]W);
%%左侧色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.2](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%
%%部分名%%
\node[align=flush left,anchor=north west,font=\PartNameFont,text=ColorA,inner xsep=0mm](PT)at([yshift=-\@Part@StripeWidth-0.25cm]X){\begin{varwidth}{\textwidth-2.45cm}\strut#2\strut\end{varwidth}};
%%部分简介%%
\node[align=flush left,inner xsep=3.0mm,anchor=north west,font=\itshape\kaiti,text=ColorA](IT)at([yshift=-0.5cm]PT.south west){
\begin{varwidth}{\textwidth-2.75cm}
\@partintro
\end{varwidth}};
%%部分目录%%
\node[inner sep=0mm,outer sep=0mm,minimum width=4.0cm,anchor=south east](SC)at([xshift=-\@innerlen-5.0mm,yshift=\@botlen]current page.south east){
\begin{varwidth}{\textwidth/2}
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
\filldraw[draw=ColorA,fill=ColorA,opacity=0.9](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\@Part@StripeWidth]D);
\coordinate(R)at([xshift=-\@Part@MiddleOuterBlockLength]Q);
\coordinate(T)at([yshift=-\@Part@BlockWidth]Q);
\coordinate(S)at([xshift=-\@Part@MiddleOuterBlockLength]T);
%%右侧色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.2](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\@Part@StripeWidth]T);
\coordinate(F)at([xshift=-\@Part@BlockWidth]E);
\coordinate(H)at(current page.south east);
\coordinate(G)at([xshift=-\@Part@BlockWidth]H);
%%右下角色块%%
\filldraw[draw=ColorA,fill=ColorA,opacity=0.9](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
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
\PartNameFont%
\def\@Part@Star@LabelRadius{\dimexpr0.75\expandafter\baselineskip/2\relax}%
\def\@Part@Star@LabelYShift{\dimexpr0.25\expandafter\baselineskip/2-0.1em\relax}%
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=-\@Part@StripeWidth]R);
\coordinate(X)at([xshift=-\@Part@StripeWidth]S);
%%标题%%
\node[inner sep=0mm,anchor=south east](ZZ)at([yshift=\@Part@StripeWidth+5.0mm]U){
\tikz{
\node[inner sep=0mm,outer sep=0mm,anchor=south west](HC1){\@HalfCircle@Label{ColorA}{\@Part@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC2)at(HC1.east){\@HalfCircle@Label{ColorA!80}{\@Part@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC3)at(HC2.east){\@HalfCircle@Label{ColorA!60}{\@Part@Star@LabelRadius}};
\node[align=flush left,inner sep=0mm,outer sep=0mm,anchor=north west,text=ColorA](PST)at([xshift=0.5cm,yshift=\@Part@Star@LabelYShift]HC3.north east){%
\begin{varwidth}{\textwidth-5.0cm}
\strut#1\strut
\end{varwidth}};}};
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(ZZ)\ZZWidth
\coordinate(V)at([xshift=-\ZZWidth]U);
\coordinate(W)at([xshift=-\ZZWidth]X);
%%
%%页面中部色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.5,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=-\@Part@StripeWidth]V);
\coordinate(Z)at([yshift=-\@Part@StripeWidth]K);
\coordinate(YY)at([yshift=\@Part@StripeWidth]N);
\coordinate(ZZ)at([xshift=-\@Part@StripeWidth]W);
%%左侧色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.2](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%部分简介%%
\node[align=flush right,inner xsep=2.0mm,anchor=north east,font=\itshape\kaiti,text=ColorA](IT)at([yshift=-1.25cm]X){\begin{varwidth}{\textwidth-2.75cm}
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
\filldraw[draw=ColorA,fill=ColorA,opacity=0.9](A)--(B)[rounded corners=2.5mm]--(C)[sharp corners]--(D)--cycle;
%%右侧色块坐标%%
\coordinate(Q)at([yshift=-\@Part@StripeWidth]D);
\coordinate(R)at([xshift=\@Part@MiddleOuterBlockLength]Q);
\coordinate(T)at([yshift=-\@Part@BlockWidth]Q);
\coordinate(S)at([xshift=\@Part@MiddleOuterBlockLength]T);
%%右侧色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.2](Q)[rounded corners=2.5mm]--(R)--(S)[sharp corners]--(T)--cycle;
%%右下角色块坐标%%
\coordinate(E)at([yshift=-\@Part@StripeWidth]T);
\coordinate(F)at([xshift=\@Part@BlockWidth]E);
\coordinate(H)at(current page.south west);
\coordinate(G)at([xshift=\@Part@BlockWidth]H);
%%右下角色块%%
\filldraw[draw=ColorA,fill=ColorA,opacity=0.9](E)[rounded corners=2.5mm]--(F)[sharp corners]--(G)--(H)--cycle;
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
\PartNameFont%
\def\@Part@Star@LabelRadius{\dimexpr0.75\expandafter\baselineskip/2\relax}%
\def\@Part@Star@LabelYShift{\dimexpr0.25\expandafter\baselineskip/2-0.1em\relax}%
%%页面中部色块坐标1%%
\coordinate(U)at([xshift=\@Part@StripeWidth]R);
\coordinate(X)at([xshift=\@Part@StripeWidth]S);
%%标题%%
\node[inner sep=0mm,anchor=south west](ZZ)at([yshift=\@Part@StripeWidth+5.0mm]U){
\tikz{
\node[inner sep=0mm,outer sep=0mm,anchor=south west](HC1){\@HalfCircle@Label{ColorA}{\@Part@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC2)at(HC1.east){\@HalfCircle@Label{ColorA!80}{\@Part@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](HC3)at(HC2.east){\@HalfCircle@Label{ColorA!60}{\@Part@Star@LabelRadius}};
\node[align=flush left,inner sep=0mm,outer sep=0mm,anchor=north west,font=\PartNameFont,text=ColorA](PST)at([xshift=0.5cm,yshift=\@Part@Star@LabelYShift]HC3.north east){%
\begin{varwidth}{\textwidth-5.0cm}
\strut#1\strut
\end{varwidth}};}};
%%页面中部色块坐标2%%
%%获取标题宽度%%
\pgfgetnodewidth(ZZ)\ZZWidth
\coordinate(V)at([xshift=\ZZWidth]U);
\coordinate(W)at([xshift=\ZZWidth]X);
%%
%%页面中部色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.5,rounded corners=2.5mm](U)rectangle(W);
%%左侧色块坐标%%
\coordinate(Y)at([xshift=\@Part@StripeWidth]V);
\coordinate(Z)at([yshift=-\@Part@StripeWidth]K);
\coordinate(YY)at([yshift=\@Part@StripeWidth]N);
\coordinate(ZZ)at([xshift=\@Part@StripeWidth]W);
%%左侧色块%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.2](Y)[sharp corners]--(Z)--(YY)[rounded corners=2.5mm]--(ZZ)--cycle;
%%
%%部分简介%%
\node[align=flush left,inner xsep=2.0mm,anchor=north west,font=\itshape\kaiti,text=ColorA](IT)at([yshift=-1.25cm]X){
\begin{varwidth}{\textwidth-2.75cm}
\@partintro
\end{varwidth}};
%%部分目录%%
\node[inner sep=0mm,outer sep=0mm,minimum width=4.0cm,anchor=south east](SC)at([xshift=-\@innerlen-5.0mm,yshift=\@botlen]current page.south east){
\begin{varwidth}{\textwidth/2}
\printcontents[part]{l}{0}{\setcounter{tocdepth}{0}}
\end{varwidth}};
\end{pgfonlayer}}
%%
%%不编号部分页样式%%
\NewDocumentCommand{\@PartStarStyle}{ +m }{
\begin{tikzpicture}[remember picture,overlay]
\pgfdeclarelayer{@Part@Star@Top}
\pgfdeclarelayer{@Part@Star@Bottom}
\pgfsetlayers{@Part@Star@Bottom,main,@Part@Star@Top}
%%白色背景%%
\draw[white,fill=white](current page.south west)rectangle(current page.north east);
\ifodd\value{page}%判断奇偶页
\@Part@Star@OddPage@Style{#1}
\else
\@Part@Star@EvenPage@Style{#1}
\fi
\end{tikzpicture}
}
%%
%%编号部分页%%
\titleformat{\part}
{}{}{0em}
{\stepcounter{@Total@PartNumber}%部分数计数
\stepcounter{@Thumb@Number}%侧标数计数
\gaddtolength{\MarkY}{-\SepH}%更新侧标位置
\startcontents[part]%开启小目录
\@PartStyle{\partlabelfront~{\sffamily\thepart}~\partlabelback}{#1}%部分样式
\thispagestyle{empty}}
[\global\partintro{}%清空\partintro
\global\partimage{}]%清空\partimage
%%不编号部分页%%
\titleformat{name=\part,numberless}
{}{}{0em}
{\stepcounter{@Total@PartNumber}%部分数计数
\stepcounter{@Thumb@Number}%侧标数计数
\gaddtolength{\MarkY}{-\SepH}%更新侧标位置
\startcontents[part]%开启小目录
\@PartStarStyle{#1}%部分样式
\thispagestyle{empty}}
[\global\partintro{}%清空\partintro
\global\partimage{}]%清空\partimage
%%间距设置%%
\titlespacing*{\part}{0pt}{0pt}{0pt}

%%为\part*添加短页眉%%
\NewCommandCopy{\OriginPart}{\part}
\RenewDocumentCommand{\part}{s +O{#3} +m}{
\IfBooleanTF{#1}
{\OriginPart*{#3\@mkboth{#2}{#2}}
\extramarks{#2}{#2}}
{\if@mainmatter
\OriginPart[#2]{#3\@mkboth{\partlabelfront~{\sffamily\thepart}~\partlabelback\quad#2}{\partlabelfront~{\sffamily\thepart}~\partlabelback\quad#2}}
\extramarks{\partlabelfront~{\sffamily\thepart}~\partlabelback\quad#2}{\partlabelfront~{\sffamily\thepart}~\partlabelback\quad#2}
\else
\phantomsection
\OriginPart*{#3\@mkboth{#2}{#2}\addcontentsline{toc}{part}{#2}}
\extramarks{#2}{#2}
\fi}}
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
\setlength{\@Chapter@StripeWidth}{0.3cm}
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
\coordinate(E)at([yshift=\@Chapter@SayingBlockWidth]D);
\coordinate(F)at([xshift=-5.0cm,yshift=\@Chapter@SayingBlockWidth]C);
\coordinate(G)at([xshift=-3.0cm,yshift=\@FrameWidth]C);
\coordinate(H)at([xshift=-\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(N)at([yshift=\@Chapter@LabelYShift@Up]current page text area.north east);
\coordinate(Q1)at([xshift=-1.75cm,yshift=1.75cm]C);
\coordinate(Q2)at([xshift=\@Chapter@PageSize,yshift=-\@Chapter@PageSize]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
\begin{pgfonlayer}{@Chapter@Top}
%%编号%%
\draw[draw=ColorA,fill=ColorA,sharp corners]node[append after command={(T.south west)[rounded corners=2.5mm]--(T.south east)[sharp corners]--([yshift=\@toplen-\@Chapter@LabelYShift@Up]T.north east)--([yshift=\@toplen-\@Chapter@LabelYShift@Up]T.north west)[rounded corners=2.5mm]--cycle},anchor=north east,font=\ChapterLabelFont,text=white,inner xsep=\@Chapter@LabelSep,inner ysep=0mm,outer sep=0mm](T)at([yshift=\@Chapter@LabelYShift@Up]N){
\begin{varwidth}{\textwidth/3}
\strut#1\strut
\end{varwidth}};
%%渐变带%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.4]([xshift=\@outerlen,yshift=-2\@Chapter@LabelYShift@Down/3]T.south east)rectangle([xshift=-\@innerlen-\textwidth,yshift=-2\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]T.south east);
%%标题%%
\node[inner sep=0mm,anchor=north east,font=\ChapterNameFont,text=ColorA](P)at([yshift=-4\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]T.south east){\begin{varwidth}{\textwidth}
\strut#2\strut
\end{varwidth}};
\end{pgfonlayer}
%%%%
\coordinate(I)at([xshift=\@outerlen-\@FrameWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south east);
\coordinate(J)at([xshift=-\@innerlen-\textwidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south east);
%%%%
%%获取标题区域的高度%%
\pgfgetdistance(A)(J)\DistanceAJ
\gsetlength{\@Chapter@BlockHeight}{\DistanceAJ}
\gsetlength{\@Chapter@VSpace}{\@Chapter@BlockHeight-\@toplen-0.5cm}
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
\coordinate(E)at([yshift=\@Chapter@SayingBlockWidth]D);
\coordinate(F)at([xshift=5.0cm,yshift=\@Chapter@SayingBlockWidth]C);
\coordinate(G)at([xshift=3.0cm,yshift=\@FrameWidth]C);
\coordinate(H)at([xshift=\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(N)at([yshift=\@Chapter@LabelYShift@Up]current page text area.north west);
\coordinate(Q1)at([xshift=1.75cm,yshift=1.75cm]C);
\coordinate(Q2)at([xshift=-\@Chapter@PageSize,yshift=-\@Chapter@PageSize]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
\begin{pgfonlayer}{@Chapter@Top}
%%编号%%
\draw[draw=ColorA,fill=ColorA,sharp corners]node[append after command={(T.south west)[rounded corners=2.5mm]--(T.south east)[sharp corners]--([yshift=\@toplen-\@Chapter@LabelYShift@Up]T.north east)--([yshift=\@toplen-\@Chapter@LabelYShift@Up]T.north west)[rounded corners=2.5mm]--cycle},anchor=north west,font=\ChapterLabelFont,text=white,inner xsep=\@Chapter@LabelSep,inner ysep=0mm,outer sep=0mm](T)at([yshift=\@Chapter@LabelYShift@Up]N){
\begin{varwidth}{\textwidth/3}
\strut#1\strut
\end{varwidth}};
%%渐变带%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.4]([xshift=-\@outerlen,yshift=-2\@Chapter@LabelYShift@Down/3]T.south west)rectangle([xshift=\@innerlen+\textwidth,yshift=-2\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]T.south west);
%%标题%%
\node[inner sep=0mm,anchor=north west,font=\ChapterNameFont,text=ColorA](P)at([yshift=-4\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]T.south west){\begin{varwidth}{\textwidth}
\strut#2\strut
\end{varwidth}};
\end{pgfonlayer}
%%%%
\coordinate(I)at([xshift=-\@outerlen+\@FrameWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south west);
\coordinate(J)at([xshift=\@innerlen+\textwidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south west);
%%%%
%%获取标题区域的高度%%
\pgfgetdistance(A)(J)\DistanceAJ
\gsetlength{\@Chapter@BlockHeight}{\DistanceAJ}
\gsetlength{\@Chapter@VSpace}{\@Chapter@BlockHeight-\@toplen-0.5cm}
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
\setlength{\@Chapter@Star@LabelNameXSep}{4.0mm}
\setlength{\@Chapter@Star@LabelYShift@Up}{5.0mm}
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
\coordinate(E)at([yshift=\@FrameWidth]D);
\coordinate(H)at([xshift=-\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(N)at([yshift=\@Chapter@Star@LabelYShift@Up]current page text area.north west);
\coordinate(Q1)at([xshift=-1.75cm,yshift=1.75cm]C);
\coordinate(Q2)at([xshift=\@Chapter@PageSize,yshift=-\@Chapter@PageSize]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
%%
\begin{pgfonlayer}{@Chapter@Star@Top}%
\ChapterNameFont%
\def\@Chapter@Star@LabelRadius{\dimexpr0.75\expandafter\baselineskip/2\relax}%
\def\@Chapter@Star@LabelYShift{\dimexpr0.25\expandafter\baselineskip/2-0.1em\relax}%
%%标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north west,text width=\textwidth,align=flush left](TT)at(N){%
\tikz{%
\node[inner sep=0mm,outer sep=0mm,anchor=north west](P1){\@HalfCircle@Label{ColorA}{\@Chapter@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](P2)at(P1.east){\@HalfCircle@Label{ColorA!80}{\@Chapter@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=north west,text=ColorA](P3)at([xshift=\@Chapter@Star@LabelNameXSep,yshift=\@Chapter@Star@LabelYShift]P2.north east){
\begin{varwidth}{\textwidth-2\@Chapter@Star@LabelRadius-\@Chapter@Star@LabelNameXSep}
\strut#1\strut
\end{varwidth}};}};
%%
%%渐变带%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.4]([xshift=-\@innerlen,yshift=-2\@Chapter@LabelYShift@Down/3]TT.south west)rectangle([xshift=\@outerlen,yshift=-2\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]TT.south east);
%%
%%副标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north east,text=ColorA,align=flush right](P)at([yshift=-4\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]TT.south east){
\begin{varwidth}{2\textwidth/3}
\strut#2\strut
\end{varwidth}};
\end{pgfonlayer}
%%%%
\coordinate(I)at([xshift=\@outerlen-\@FrameWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south east);
\coordinate(J)at([xshift=-\textwidth-\@innerlen,yshift=-2\@Chapter@LabelYShift@Down/3]P.south east);
%%%%
%%获取标题区域的高度%%
\pgfgetdistance(A)(J)\DistanceAJ
\gsetlength{\@Chapter@BlockHeight}{\DistanceAJ}
\gsetlength{\@Chapter@VSpace}{\@Chapter@BlockHeight-\@toplen-0.5cm}
\begin{pgfonlayer}{@Chapter@Star@Bottom}
%%框架1%%
\draw[ColorB!7.5,fill=ColorB!7.5,sharp corners](A)rectangle(C);
%%章节图片%%
\node[anchor=north west,outer sep=0mm,inner sep=0mm](U)at(A){\@chapterimage};
%%框架2%%
\draw[white,fill=white](J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[sharp corners]--(E)[sharp corners]--cycle;
\end{pgfonlayer}
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=2.0mm](Q)circle(\@Chapter@PageSize/2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\@Chapter@PageSize-0.3cm}{!}{\thepage}};
\else
%%坐标点%%
\coordinate(A)at(current page.north east);
\coordinate(B)at(current page.north west);
\coordinate(C)at(current page.south west);
\coordinate(D)at(current page.south east);
\coordinate(E)at([yshift=\@FrameWidth]D);
\coordinate(H)at([xshift=\@FrameWidth,yshift=\@FrameWidth]C);
\coordinate(N)at([yshift=\@Chapter@Star@LabelYShift@Up]current page text area.north east);
\coordinate(Q1)at([xshift=1.75cm,yshift=1.75cm]C);
\coordinate(Q2)at([xshift=-\@Chapter@PageSize,yshift=-\@Chapter@PageSize]Q1);
\coordinate(Q)at($0.5*(Q1)+0.5*(Q2)$);
%%
\begin{pgfonlayer}{@Chapter@Star@Top}%
\ChapterNameFont%
\def\@Chapter@Star@LabelRadius{\dimexpr0.75\expandafter\baselineskip/2\relax}%
\def\@Chapter@Star@LabelYShift{\dimexpr0.25\expandafter\baselineskip/2-0.1em\relax}%
%%标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north east,text width=\textwidth,align=flush right](TT)at(N){%
\tikz{%
\node[inner sep=0mm,outer sep=0mm,anchor=north west](P1){\@HalfCircle@Label{ColorA}{\@Chapter@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=west](P2)at(P1.east){\@HalfCircle@Label{ColorA!80}{\@Chapter@Star@LabelRadius}};
\node[inner sep=0mm,outer sep=0mm,anchor=north west,text=ColorA](P3)at([xshift=\@Chapter@Star@LabelNameXSep,yshift=\@Chapter@Star@LabelYShift]P2.north east){
\begin{varwidth}{\textwidth-2\@Chapter@Star@LabelRadius-\@Chapter@Star@LabelNameXSep}
\strut#1\strut
\end{varwidth}};
}};
%%
%%渐变带%%
\filldraw[draw=ColorB,fill=ColorB,opacity=0.4]([xshift=\@innerlen,yshift=-2\@Chapter@LabelYShift@Down/3]TT.south east)rectangle([xshift=-\@outerlen,yshift=-2\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]TT.south west);
%%
%%副标题%%
\node[inner sep=0mm,outer sep=0mm,anchor=north west,text=ColorA,align=flush left](P)at([yshift=-4\@Chapter@LabelYShift@Down/3-\@Chapter@StripeWidth]TT.south west){
\begin{varwidth}{2\textwidth/3}
\strut#2\strut
\end{varwidth}};
\end{pgfonlayer}
%%%%
\coordinate(I)at([xshift=-\@outerlen+\@FrameWidth,yshift=-2\@Chapter@LabelYShift@Down/3]P.south west);
\coordinate(J)at([xshift=\textwidth+\@innerlen,yshift=-2\@Chapter@LabelYShift@Down/3]P.south west);
%%%%
%%获取标题区域的高度%%
\pgfgetdistance(A)(J)\DistanceAJ
\gsetlength{\@Chapter@BlockHeight}{\DistanceAJ}
\gsetlength{\@Chapter@VSpace}{\@Chapter@BlockHeight-\@toplen-0.5cm}
\begin{pgfonlayer}{@Chapter@Star@Bottom}
%%框架1%%
\draw[ColorB!7.5,fill=ColorB!7.5,sharp corners](A)rectangle(C);
%%章节图片%%
\node[anchor=north east,outer sep=0mm,inner sep=0mm](U)at(A){\@chapterimage};
%%框架2%%
\draw[white,fill=white](J)[rounded corners=5.0mm]--(I)[rounded corners=5.0mm]--(H)[sharp corners]--(E)[sharp corners]--cycle;
\end{pgfonlayer}
%%页码%%
\draw[ColorA,fill=ColorA,rounded corners=2.0mm](Q)circle(\@Chapter@PageSize/2);
\node[font=\PageNumberFont,text=white,anchor=center,align=center](PP)at(Q){\maxsizebox{\@Chapter@PageSize-0.3cm}{!}{\thepage}};
\fi
\end{tikzpicture}
}
%%制定章节页的侧标更新规则%%
\newcommand{\@Thumb@Step@Rule}{
\ifnum\totvalue{@Total@PartNumber}=0%若文档中到当前章时还没有部分层次
\if@mainmatter%如果在mainmatter中
\stepcounter{@Thumb@Number}%侧标数计数
\gaddtolength{\MarkY}{-\SepH}%更新侧标位置
\fi\fi}
%%编号章节页%%
\titleformat{\chapter}
{}{}{0em}
{\@Thumb@Step@Rule
\@ChapterStyle{\chapterlabelfront~{\sffamily\thechapter}~\chapterlabelback}{#1}%章样式
\enlargethispage{-0.75cm}%修改页面大小
\thispagestyle{empty}}
[\global\chapterimage{}%清空\chapterimage
\global\chaptersaying{}]%清空\chaptersaying
%%不编号章节页%%
\titleformat{name=\chapter,numberless}
{}{}{0em}
{\@Thumb@Step@Rule
\@ChapterStarStyle{#1}{\@chaptersubtitle}%章样式
\thispagestyle{empty}}
[\global\chaptersubtitle{}%清空\chaptersubtitle
\global\chapterimage{}]%清空\chapterimage
%%间距设置%%
\titlespacing*{\chapter}{0pt}{0pt}{0pt}
%%为\chapter*添加短页眉%%
\NewCommandCopy{\OriginChapter}{\chapter}
\RenewDocumentCommand{\chapter}{s +O{#3} +m}{
\IfBooleanTF{#1}
{\OriginChapter*{#3\@mkboth{#2}{#2}}
\ifnum\totvalue{@Total@PartNumber}=0%若文档中到当前章时还没有部分层次
\if@mainmatter%如果在mainmatter中
\extramarks{#2}{#2}
\fi\fi}
{\OriginChapter[#2]{#3}
\ifnum\totvalue{@Total@PartNumber}=0%若文档中到当前章时还没有部分层次
\if@mainmatter%如果在mainmatter中
\extramarks{\chapterlabelfront~{\sffamily\thechapter}~\chapterlabelback\quad#2}{\chapterlabelfront~{\sffamily\thechapter}~\chapterlabelback\quad#2}
\fi\fi}
\vspace*{\@Chapter@VSpace}}

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
\vspace*{1.0cm}%
\SectionFont%
\def\@Section@LabelRadius{\dimexpr\baselineskip/2\relax}}{%
\sectionlabelfront\hspace{\@Section@LabelXSep}%
\tikz[baseline=-0.4em]{%
\draw[ColorA,fill=ColorA](0,0)circle(\@Section@LabelRadius);
\node[circle,outer sep=0mm,inner sep=0mm,font=\SectionFont\sffamily,text=white]at(0,0){\maxsizebox{2\@Section@LabelRadius}{!}{\thesection}};}%
\hspace{\@Section@LabelXSep}\sectionlabelback}{\@Section@LabelNameXSep}{#1}
%%不编号节样式%%
\titleformat{name=\section,numberless}[hang]{%
\vspace*{1.0cm}%
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
\pgfdeclarelayer{@Subsection@Bottom}%
\pgfsetlayers{@Subsection@Bottom,main}%
\node[text=white,inner xsep=\@Subsection@Radius,inner ysep=0mm,outer sep=0mm](L){%
\begin{varwidth}{\@Subsection@LabelCriticWidth}
%\AdjustStrut{0.9}%
\strut#1\strut
\end{varwidth}%
\hspace*{\@Subsection@LabelHSkip}};
\pgfgetnodewidth(L)\@Subsection@LabelWidth
%%
\node[text=ColorA,inner xsep=\@Subsection@Radius,inner ysep=0mm,outer sep=0mm,minimum width=\linewidth-\@Subsection@LabelWidth,anchor=north west](N)at(L.north east){\hspace*{\@Subsection@LabelHSkip}%
\begin{minipage}{\linewidth-\@Subsection@LabelWidth-2\@Subsection@Radius-\@Subsection@LabelHSkip}
%\AdjustStrut{0.9}%
\strut#2\strut
\end{minipage}};
\pgfgetnodeheight(N)\@Subsection@NameHeight
%%
\begin{pgfonlayer}{@Subsection@Bottom}
\draw[ColorA,line width=0.1pt,fill=ColorA,rounded corners=\@Subsection@Radius](L.north west)rectangle(L.south east);
\draw[white,line width=13.5pt,fill=white]([yshift=-\@Subsection@Radius]L.north east)circle(\@Subsection@Radius);
\ifdim\@Subsection@NameHeight>\dimexpr2\@Subsection@Radius\relax
\draw[ColorB!7.5,line width=0.1pt,fill=ColorB!7.5](N.north east)[sharp corners]--(N.north west)[rounded corners=\@Subsection@Radius]--(N.south west)--(N.south east)--cycle;
\else
\draw[ColorB!7.5,line width=0.1pt,fill=ColorB!7.5](N.north east)[sharp corners]--(N.north west)--(N.south west)[rounded corners=\@Subsection@Radius]--(N.south east)--cycle;
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
\newlength{\@Subsection@Star@LabelHSkip}
\newlength{\@BigLabelCircle@LineWidth}
\newlength{\@SmallLabelCircle@LineWidth}
\setlength{\@Subsection@Star@LabelCriticWidth}{4.0cm}
\setlength{\@Subsection@Star@LabelHSkip}{2.8em}
\setlength{\@BigLabelCircle@LineWidth}{13.5pt}
\setlength{\@SmallLabelCircle@LineWidth}{4.0pt}
%%%%
\NewDocumentCommand{\@SubsectionStarStyle}{ +m +m }{%
\begingroup%
\raggedright%
\tikz{%
\node[inner sep=0mm,outer sep=0mm]{%
\hspace*{-\@BigLabelCircle@LineWidth/2+\@SmallLabelCircle@LineWidth/2}%
\begin{tikzpicture}%
\SubsectionFont%
\def\@Subsection@Star@Radius{\dimexpr\baselineskip/2\relax}%0.9
\pgfdeclarelayer{@Subsection@Star@Bottom}%
\pgfsetlayers{@Subsection@Star@Bottom,main}%
\node[text=white,inner xsep=\@Subsection@Star@Radius,inner ysep=0mm,outer sep=0mm](L){%
\hspace*{\@Subsection@Star@LabelHSkip+2.0pt}%
\begin{varwidth}{\@Subsection@Star@LabelCriticWidth}
%\AdjustStrut{0.9}%
\strut#1\strut
\end{varwidth}};%
\pgfgetnodewidth(L)\@Subsection@Star@LabelWidth%
\pgfgetnodeheight(L)\@Subsection@Star@LabelHeight%
%%
\node[text=ColorA,inner xsep=\@Subsection@Star@Radius,inner ysep=0mm,outer sep=0mm,minimum width=\linewidth-\@Subsection@Star@LabelWidth,anchor=north west](N)at(L.north east){%
\begin{minipage}{\linewidth-\@Subsection@Star@LabelWidth-2\@Subsection@Star@Radius}
%\AdjustStrut{0.9}%
\strut#2\strut
\end{minipage}};
\pgfgetnodeheight(N)\@Subsection@Star@NameHeight%
%%
\begin{pgfonlayer}{@Subsection@Star@Bottom}
\ifdim\@Subsection@Star@NameHeight>\@Subsection@Star@LabelHeight
\draw[ColorB!7.5,line width=0.1pt,fill=ColorB!7.5,rounded corners=\@Subsection@Star@Radius](L.north west)rectangle(N.south east);
%
\draw[ColorA,line width=0.1pt,fill=ColorA,rounded corners=\@Subsection@Star@Radius](L.north west)rectangle(N.south west);
\else
\draw[ColorB!7.5,line width=0.1pt,fill=ColorB!7.5,rounded corners=\@Subsection@Star@Radius](L.south west)rectangle(N.north east);
%
\draw[ColorA,line width=0.1pt,fill=ColorA,rounded corners=\@Subsection@Star@Radius](L.south west)rectangle(N.north west);
\fi
%%
\draw[white,line width=\@BigLabelCircle@LineWidth,fill=white]([xshift=\@Subsection@Star@Radius+\@SmallLabelCircle@LineWidth/2,yshift=-\@Subsection@Star@Radius]L.north west)circle(\@Subsection@Star@Radius);
\draw[ColorA,line width=\@SmallLabelCircle@LineWidth,fill=white]([xshift=\@Subsection@Star@Radius+\@SmallLabelCircle@LineWidth/2,yshift=-\@Subsection@Star@Radius]L.north west)circle(\@Subsection@Star@Radius);
\draw[ColorA,fill=ColorA]([xshift=\@Subsection@Star@Radius+\@SmallLabelCircle@LineWidth/2,yshift=-\@Subsection@Star@Radius]L.north west)circle(\@Subsection@Star@Radius/2);
\end{pgfonlayer}
\end{tikzpicture}};}%
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
\NewDocumentCommand{\Practice}{ +m }{
\begin{center}
\begin{tikzpicture}%
\PracticeTitleFont%
\def\@PracticeTitle@Radius{\dimexpr\baselineskip/2\relax}%
\pgfdeclarelayer{@Practice@Bottom}%
\pgfsetlayers{@Practice@Bottom,main}%
\node[draw=ColorB,fill=ColorB,thick,rounded corners,text=white,outer sep=0mm,inner xsep=0.5em,inner ysep=0mm,align=center](E){%
\begin{varwidth}{\linewidth/2}
\strut#1\strut
\end{varwidth}};
\begin{pgfonlayer}{@Practice@Bottom}
\draw[draw=ColorB!50,fill=ColorB!50,line width=8.0pt,rounded corners=\@PracticeTitle@Radius]([xshift=-\@PracticeTitle@Radius]E.north west)rectangle([xshift=\@PracticeTitle@Radius]E.south east);
\end{pgfonlayer}
\end{tikzpicture}
\end{center}
}
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
~\sffamily\the@prenumber%
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
~\sffamily\the@prenumber%
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
\makeatother

%%%%%%%%%%%%%%%%%% 目录样式 %%%%%%%%%%%%%%%%%%%%%%%%
%%目录页码右侧空格%%
\contentsmargin{3.5mm}
\makeatletter
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
\draw[ColorB!7.5,line width=0.1pt,fill=ColorB!7.5](N.north east)[sharp corners]--(N.north west)--(N.south west)[rounded corners=\@PartToc@Radius]--(N.south east)--cycle;
%
\draw[ColorA,line width=0.1pt,fill=ColorA](L.north west)[sharp corners]--(L.north east)--(N.south west)[rounded corners=\@PartToc@Radius]--([xshift=-\@PartToc@LabelWidth]N.south west)--([xshift=-\@PartToc@LabelWidth,yshift=\@PartToc@LabelHeight]N.south west)--cycle;
\else
\draw[ColorB!7.5,line width=0.1pt,fill=ColorB!7.5](N.north east)[sharp corners]--(N.north west)--(L.south east)[rounded corners=\@PartToc@Radius]--([yshift=-\@PartToc@LabelHeight]N.north east)--cycle;
%
\draw[ColorA,line width=0.1pt,fill=ColorA](L.south west)[sharp corners]--(L.south east)--(L.north east)[rounded corners=\@PartToc@Radius]--(L.north west)--cycle;
\fi
\end{pgfonlayer}
\end{tikzpicture}
}

%%
%%编号部分目录样式%%
\NewDocumentCommand{\@Toc@Part@Numbered}{+m}{\contentslabel[\@PartTocStyle{\partlabelfront~{\sffamily\thecontentslabel}~\partlabelback}{#1\hfill\sffamily\thecontentspage}]{1.25cm}}
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
附录~{\sffamily\thecontentslabel}~%
\else%
\if@test%
试题~{\sffamily\thecontentslabel}~%
\else%
第~{\sffamily\thecontentslabel}~章%
\fi\fi}
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
\if@appendix%如果节在相应环境里，则修改目录前缀
列表~{\sffamily\thecontentslabel}~%
\else%
\if@test%
题类~{\sffamily\thecontentslabel}~%
\else%
\if@topic%
专题~{\sffamily\thecontentslabel}~%
\else%
\if@project%
课题~{\sffamily\thecontentslabel}~%
\else%
\if@quiz%
测试~{\sffamily\thecontentslabel}~%
\else%
第~{\sffamily\thecontentslabel}~节%
\fi\fi\fi\fi\fi}
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
\if@appendix%如果节在相应环境里，则修改目录前缀
条目~{\sffamily\thecontentslabel}~%
\else%
\if@test%
题目~{\sffamily\thecontentslabel}~%
\else%
\if@topic%
考点~{\sffamily\thecontentslabel}~%
\else%
\if@project%
项目~{\sffamily\thecontentslabel}~%
\else%
\if@quiz%
题组~{\sffamily\thecontentslabel}~%
\else%
课时~{\sffamily\thecontentslabel}~%
\fi\fi\fi\fi\fi}
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
\if@appendix%如果节在相应环境里，则修改目录前缀
附录~图~{\sffamily\thecontentslabel}~%
\else%
\if@test%
试题~图~{\sffamily\thecontentslabel}~%
\else%
\if@topic%
专题~图~{\sffamily\thecontentslabel}~%
\else%
\if@project%
课题~图~{\sffamily\thecontentslabel}~%
\else%
\if@quiz%
测试~图~{\sffamily\thecontentslabel}~%
\else%
图~{\sffamily\thecontentslabel}~%
\fi\fi\fi\fi\fi}
%%
\gdef\@Table@Toc@Label{%
\if@appendix%如果节在相应环境里，则修改目录前缀
附录~表~{\sffamily\thecontentslabel}~%
\else%
\if@test%
试题~表~{\sffamily\thecontentslabel}~%
\else%
\if@topic%
专题~表~{\sffamily\thecontentslabel}~%
\else%
\if@project%
课题~表~{\sffamily\thecontentslabel}~%
\else%
\if@quiz%
测试~表~{\sffamily\thecontentslabel}~%
\else%
表~{\sffamily\thecontentslabel}~%
\fi\fi\fi\fi\fi}
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

%%%%%%%%%%%%%%%%%% 环境定义和命令定义 %%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
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
\hspace*{1.0em}\vspace*{0.5em}%
}{\medskip}
%%%%
\newenvironment{Answer*}{%
\medskip%
\@AnswerStyle{解析}{ColorF}%
\hspace*{1.0em}\vspace*{0.5em}%
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
\@ExampleStyle{\@Example@Name}{\@Example@Label}{ColorA}%
\else%
\@AnswerStyle{\@Example@Name}{ColorA}%
\fi%
\hspace*{1.0em}\vspace*{0.5em}%
}{\medskip}
%%%%
\newenvironment{Example*}{%
\medskip%
\@AnswerStyle{\@Example@Name}{ColorA}%
\hspace*{1.0em}\vspace*{0.5em}%
}{\medskip}

%%变式%%
\def\@Variant@Name{变式}
\def\@Variant@Label{\the@prenumber.\the@varnum}
%%%%
\newenvironment{Variant}{%
\medskip%
\if@mainmatter%
\stepcounter{@varnum}%
\@ExampleStyle{\@Variant@Name}{\@Variant@Label}{ColorB}%
\else%
\@AnswerStyle{\@Variant@Name}{ColorB}%
\fi%
\hspace*{1.0em}\vspace*{0.5em}%
}{\medskip}
%%%%
\newenvironment{Variant*}{%
\medskip%
\@AnswerStyle{\@Variant@Name}{ColorB}%
\hspace*{1.0em}\vspace*{0.5em}%
}{\medskip}

%%%%
%%以下为本文档类内置栏目，请谨慎修改%%
%设置环境布尔变量
\newif\if@appendix
\newif\if@quiz
\newif\if@test
\newif\if@project
\newif\if@topic
%%设置附录环境%%
\newcounter{@Outer@Appendix@Chapter}%储存环境前的章计数器数值
\newcounter{@Inner@Appendix@Chapter}%储存环境中的章计数器数值
\setcounter{@Inner@Appendix@Chapter}{0}%将环境中的章计数器值置零

\newenvironment{Appendix}{
\@appendixtrue
%在toc文件中写入\@appendixtrue，确保目录正确生成
\addtocontents{toc}{\protect\@appendixtrue}
\addtocontents{lof}{\protect\@appendixtrue}
\addtocontents{lot}{\protect\@appendixtrue}
%修改章计数器样式为大写字母
\renewcommand{\thechapter}{\Alph{chapter}}
%修改节计数器样式为小写字母
\renewcommand{\thesection}{\alph{section}}
%修改页眉页脚章标签
\renewcommand{\chapterlabelfront}{附录}
\renewcommand{\chapterlabelback}{}
%修改页眉页脚节标签
\renewcommand{\sectionlabelfront}{列表}
\renewcommand{\sectionlabelback}{}
%修改小节标签
\renewcommand{\subsectionlabelfront}{条目}
\renewcommand{\subsectionlabelback}{}
%修改图表标签
\renewcommand{\figurename}{附录~图}
\renewcommand{\tablename}{附录~表}
%修改有编号章样式
\titleformat{\chapter}
{}{}{0em}
{\@Thumb@Step@Rule
\@ChapterStarStyle{\chapterlabelfront~{\sffamily\thechapter}~\chapterlabelback}{##1}%章样式
\enlargethispage{-0.25cm}%修改页面大小
\thispagestyle{empty}}
[\global\chaptersubtitle{}%清空\chaptersubtitle
\global\chapterimage{}]%清空\chapterimage
%%%%
%修改有编号节样式
\titleformat{\section}[hang]{%
\vspace*{1.0cm}%
\SectionFont\color{ColorA}%
\def\@Section@Star@LabelRadius{\baselineskip/2}}{%
\tikz[baseline=-0.4em]{%
\draw[ColorA!50,fill=ColorA!50](0,0)circle(\@Section@Star@LabelRadius);
\draw[white,fill=ColorA,line width=2.75pt](0,0)circle(7*\@Section@Star@LabelRadius/12);
}%
\hspace*{\@Section@Star@LabelXSep}%
\sectionlabelfront~{\sffamily\thesection}~\sectionlabelback%
}{\@Section@Star@LabelNameXSep}{##1}
%%%%
%修改有编号小节样式
\titleformat{\subsection}
{}{}{0em}
{\@SubsectionStarStyle{\subsectionlabelfront~{\sffamily\thesubsection}~\subsectionlabelback}{##1}}
%%%%
\def\@Example@Name{附录~例题}
\def\@Variant@Name{附录~变式}
%%%%
\def\@Exercise@Title{拓展练习}
\def\@Thinking@Title{深入思考}
%%%%
\def\@Definiton@Title{附录~定义}
\def\@Definiton@Label{Def(Appendix).\the@prenumber.\the@def}
%%%%
\def\@Theorem@Title{附录~定理}
\def\@Theorem@Label{Thm(Appendix).\the@prenumber.\the@thm}
%%%%
\def\@Axiom@Title{附录~公理}
\def\@Axiom@Label{Axm(Appendix).\the@prenumber.\the@axm}
%%%%
\def\@Lemma@Title{附录~引理}
\def\@Lemma@Label{Lem(Appendix).\the@prenumber.\the@lem}
%%%%
\def\@Corollary@Title{附录~推论}
\def\@Corollary@Label{Colry(Appendix).\the@prenumber.\the@colry}
%%%%
\def\@Propostion@Title{附录~命题}
\def\@Proposition@Label{Prop(Appendix).\the@prenumber.\the@prop}
%%%%
%将环境前的章计数器值储存在beforecounter中
\setcounter{@Outer@Appendix@Chapter}{\value{chapter}}
%将章计数器置为环境中章计数器值
\setcounter{chapter}{\value{@Inner@Appendix@Chapter}}
%%%%
%确保hyperref知道计数器变化
\hypersetup{pageanchor=true}
%修改超链接的唯一标识
\renewcommand{\theHchapter}{\chapterlabelfront\thechapter\chapterlabelback}
\renewcommand{\theHsection}{\sectionlabelfront\thesection\sectionlabelback}
\renewcommand{\theHsubsection}{\subsectionlabelfront\thesubsection\subsectionlabelback}
}{\@appendixfalse
\addtocontents{toc}{\protect\@appendixfalse}
\addtocontents{lof}{\protect\@appendixfalse}
\addtocontents{lot}{\protect\@appendixfalse}
%将环境中的章计数器值储存在innercounter中
\setcounter{@Inner@Appendix@Chapter}{\value{chapter}}
%将章计数器值恢复为环境前的值
\setcounter{chapter}{\value{@Outer@Appendix@Chapter}}
%恢复原始超链接设置
\hypersetup{pageanchor=false}
}
%%
%%设置试题环境%%
\newcounter{@Outer@Test@Chapter}%储存环境前的章计数器数值
\newcounter{@Inner@Test@Chapter}%储存环境中的章计数器数值
\setcounter{@Inner@Test@Chapter}{0}%将环境中的章计数器值置零
\newenvironment{Test}{
\@testtrue
%在toc文件中写入\@testtrue，确保目录正确生成
\addtocontents{toc}{\protect\@testtrue}
\addtocontents{lof}{\protect\@testtrue}
\addtocontents{lot}{\protect\@testtrue}
%修改章计数器样式为大写字母
\renewcommand{\thechapter}{\Alph{chapter}}
%修改节计数器样式为大写罗马数字
\renewcommand{\thesection}{\Roman{section}}
%修改页眉页脚章标签
\renewcommand{\chapterlabelfront}{试题}
\renewcommand{\chapterlabelback}{}
%修改页眉页脚节标签
\renewcommand{\sectionlabelfront}{题类}
\renewcommand{\sectionlabelback}{}
%修改小节标签
\renewcommand{\subsectionlabelfront}{题目}
\renewcommand{\subsectionlabelback}{}
%修改图表标签
\renewcommand{\figurename}{试题~图}
\renewcommand{\tablename}{试题~表}
%修改有编号章样式
\titleformat{\chapter}
{}{}{0em}
{\@Thumb@Step@Rule
\@ChapterStarStyle{\chapterlabelfront~{\sffamily\thechapter}~\chapterlabelback}{##1}%章样式
\enlargethispage{-0.25cm}%修改页面大小
\thispagestyle{empty}}
[\global\chaptersubtitle{}%清空\chaptersubtitle
\global\chapterimage{}]%清空\chapterimage
%%%%
%修改有编号节样式
\titleformat{\section}[hang]{%
\vspace*{1.0cm}%
\SectionFont\color{ColorA}%
\def\@Section@Star@LabelRadius{\baselineskip/2}}{%
\tikz[baseline=-0.4em]{%
\draw[ColorA!50,fill=ColorA!50](0,0)circle(\@Section@Star@LabelRadius);
\draw[white,fill=ColorA,line width=2.75pt](0,0)circle(7*\@Section@Star@LabelRadius/12);
}%
\hspace*{\@Section@Star@LabelXSep}%
\sectionlabelfront~{\sffamily\thesection}~\sectionlabelback%
}{\@Section@Star@LabelNameXSep}{##1}
%%%%
%修改有编号小节样式
\titleformat{\subsection}
{}{}{0em}
{\@SubsectionStarStyle{\subsectionlabelfront~{\sffamily\thesubsection}~\subsectionlabelback}{##1}}
%%%%
\def\@Example@Name{试题~例题}
\def\@Variant@Name{试题~变式}
%%%%
\def\@Exercise@Title{补充习题}
\def\@Thinking@Title{错题总结}
%%%%
\def\@Definiton@Title{试题~定义}
\def\@Definiton@Label{Def(Test).\the@prenumber.\the@def}
%%%%
\def\@Theorem@Title{试题~定理}
\def\@Theorem@Label{Thm(Test).\the@prenumber.\the@thm}
%%%%
\def\@Axiom@Title{试题~公理}
\def\@Axiom@Label{Axm(Test).\the@prenumber.\the@axm}
%%%%
\def\@Lemma@Title{试题~引理}
\def\@Lemma@Label{Lem(Test).\the@prenumber.\the@lem}
%%%%
\def\@Corollary@Title{试题~推论}
\def\@Corollary@Label{Colry(Test).\the@prenumber.\the@colry}
%%%%
\def\@Propostion@Title{试题~命题}
\def\@Proposition@Label{Prop(Test).\the@prenumber.\the@prop}
%%%%
%将环境前的章计数器值储存在beforecounter中
\setcounter{@Outer@Test@Chapter}{\value{chapter}}
%将章计数器置为环境中章计数器值
\setcounter{chapter}{\value{@Inner@Test@Chapter}}
%%%%
%确保hyperref知道计数器变化
\hypersetup{pageanchor=true}
%修改超链接的唯一标识
\renewcommand{\theHchapter}{\chapterlabelfront\thechapter\chapterlabelback}
\renewcommand{\theHsection}{\sectionlabelfront\thesection\sectionlabelback}
\renewcommand{\theHsubsection}{\subsectionlabelfront\thesubsection\subsectionlabelback}
}{\@testfalse
\addtocontents{toc}{\protect\@testfalse}
\addtocontents{lof}{\protect\@testfalse}
\addtocontents{lot}{\protect\@testfalse}
%将环境中的章计数器值储存在innercounter中
\setcounter{@Inner@Test@Chapter}{\value{chapter}}
%将章计数器值恢复为环境前的值
\setcounter{chapter}{\value{@Outer@Test@Chapter}}
%恢复原始超链接设置
\hypersetup{pageanchor=false}
}
%%
%%设置测试环境%%
\newcounter{@Outer@Quiz@Section}%储存环境前的节计数器数值
\newcounter{@Inner@Quiz@Section}%储存环境中的节计数器数值
\setcounter{@Inner@Quiz@Section}{0}%将环境中的节计数器值置零
\newcounter{@Outer@Quiz@Eg}%储存环境前的例题计数器数值
\newcounter{@Inner@Quiz@Eg}%储存环境中的例题计数器数值
\setcounter{@Inner@Quiz@Eg}{0}%将环境中例题计数器值置零
\newcounter{@Outer@Quiz@Var}%储存环境前的变式计数器数值
\newcounter{@Inner@Quiz@Var}%储存环境中的变式计数器数值
\setcounter{@Inner@Quiz@Var}{0}%将环境中变式计数器值置零
\newenvironment{Quiz}{
\clearpage
\@quiztrue
%在toc文件中写入\@quiztrue，确保目录正确生成
\addtocontents{toc}{\protect\@quiztrue}
\addtocontents{lof}{\protect\@quiztrue}
\addtocontents{lot}{\protect\@quiztrue}
%修改页眉页脚标签
\renewcommand{\sectionlabelfront}{测试}
\renewcommand{\sectionlabelback}{}
%修改小节标签
\renewcommand{\subsectionlabelfront}{题组}
\renewcommand{\subsectionlabelback}{}
%修改图表标签
\renewcommand{\figurename}{测试~图}
\renewcommand{\tablename}{测试~表}
%环境中禁用part
\renewcommand{\part}{
\ClassError{textbook-cn}{Forbidden Part in Quiz Environment!}}
%环境中禁用chapter
\renewcommand{\chapter}{
\ClassError{textbook-cn}{Forbidden Chapter in Quiz Environment!}}
%%废弃的环境内chapter命令%%
%\RenewDocumentCommand{\chapter}{s O{##3} m}{
%\IfBooleanTF{##1}
%{\OriginChapter*{##3\@mkboth{##2}{##2}}}
%{\setcounter{@Inner@Quiz@Section}{\value{section}}%将当前环境中的节计数器值赋给innerquizcounter
%\OriginChapter[##2]{##3}
%\setcounter{section}{\value{@Inner@Quiz@Section}}}
%\vspace*{\@Chapter@VSpace}}
%%%%
%%简化序号命令%%
\renewcommand{\the@prenumber}{\thesection}
%%%%
\def\@Definiton@Title{测试~定义}
\def\@Definiton@Label{Def(Quiz).\the@prenumber.\the@def}
%%%%
\def\@Theorem@Title{测试~定理}
\def\@Theorem@Label{Thm(Quiz).\the@prenumber.\the@thm}
%%%%
\def\@Axiom@Title{测试~公理}
\def\@Axiom@Label{Axm(Quiz).\the@prenumber.\the@axm}
%%%%
\def\@Lemma@Title{测试~引理}
\def\@Lemma@Label{Lem(Quiz).\the@prenumber.\the@lem}
%%%%
\def\@Corollary@Title{测试~推论}
\def\@Corollary@Label{Colry(Quiz).\the@prenumber.\the@colry}
%%%%
\def\@Propostion@Title{测试~命题}
\def\@Proposition@Label{Prop(Quiz).\the@prenumber.\the@prop}
%%%%
\def\@Example@Name{范例}
\def\@Variant@Name{变例}
%%%%
\def\@Exercise@Title{补充习题}
\def\@Thinking@Title{错题总结}
%%%%
%将环境前的节计数器值储存在beforecounter中
\setcounter{@Outer@Quiz@Section}{\value{section}}
%将节计数器置为环境中节计数器值
\setcounter{section}{\value{@Inner@Quiz@Section}}
%%
%将环境前的例题计数器值储存在beforecounter中
\setcounter{@Outer@Quiz@Eg}{\value{@egnum}}
%将例题计数器置为环境中节计数器值
\setcounter{@egnum}{\value{@Inner@Quiz@Eg}}
%%
%将环境前的变式计数器值储存在beforecounter中
\setcounter{@Outer@Quiz@Var}{\value{@varnum}}
%将变式计数器置为环境中节计数器值
\setcounter{@varnum}{\value{@Inner@Quiz@Var}}
%%%%
%确保hyperref知道计数器变化
\hypersetup{pageanchor=true}
%修改超链接的唯一标识
\renewcommand{\theHsection}{\sectionlabelfront\thesection\sectionlabelback}
\renewcommand{\theHsubsection}{\subsectionlabelfront\thesubsection\subsectionlabelback}
}{\@quizfalse
\addtocontents{toc}{\protect\@quizfalse}
\addtocontents{lof}{\protect\@quizfalse}
\addtocontents{lot}{\protect\@quizfalse}
%将环境中的节计数器值储存在innercounter中
\setcounter{@Inner@Quiz@Section}{\value{section}}
%将节计数器值恢复为环境前的值
\setcounter{section}{\value{@Outer@Quiz@Section}}
%%
%将环境中的例题计数器值储存在innercounter中
\setcounter{@Inner@Quiz@Eg}{\value{@egnum}}
%将例题计数器值恢复为环境前的值
\setcounter{@egnum}{\value{@Outer@Quiz@Eg}}
%%
%将环境中的变式计数器值储存在innercounter中
\setcounter{@Inner@Quiz@Var}{\value{@varnum}}
%将变式计数器值恢复为环境前的值
\setcounter{@varnum}{\value{@Outer@Quiz@Var}}
%恢复原始超链接设置
\hypersetup{pageanchor=false}
}
%%%%

%%设置专题环境%%
\newcounter{@Outer@Topic@Section}%储存环境前的节计数器数值
\newcounter{@Inner@Topic@Section}%储存环境中的节计数器数值
\setcounter{@Inner@Topic@Section}{0}%将环境中计数器值置零
\newcounter{@Outer@Topic@Eg}%储存环境前的例题计数器数值
\newcounter{@Inner@Topic@Eg}%储存环境中的例题计数器数值
\setcounter{@Inner@Topic@Eg}{0}%将环境中例题计数器值置零
\newcounter{@Outer@Topic@Var}%储存环境前的变式计数器数值
\newcounter{@Inner@Topic@Var}%储存环境中的变式计数器数值
\setcounter{@Inner@Topic@Var}{0}%将环境中变式计数器值置零
\newenvironment{Topic}{
\clearpage
\@topictrue
%在toc文件中写入\@topictrue，确保目录正确生成
\addtocontents{toc}{\protect\@topictrue}
\addtocontents{lof}{\protect\@topictrue}
\addtocontents{lot}{\protect\@topictrue}
%修改页眉页脚标签
\renewcommand{\sectionlabelfront}{专题}
\renewcommand{\sectionlabelback}{}
%修改小节标签
\renewcommand{\subsectionlabelfront}{考点}
\renewcommand{\subsectionlabelback}{}
%修改图表标签
\renewcommand{\figurename}{专题~图}
\renewcommand{\tablename}{专题~表}
%环境中禁用part
\renewcommand{\part}{
\ClassError{textbook-cn}{Forbidden Part in Topic Environment!}}
%环境中禁用chapter
\renewcommand{\chapter}{
\ClassError{textbook-cn}{Forbidden Chapter in Topic Environment!}}
%%废弃的环境内chapter命令%%
%\RenewDocumentCommand{\chapter}{s O{##3} m}{
%\IfBooleanTF{##1}
%{\OriginChapter*{##3\@mkboth{##2}{##2}}}
%{\setcounter{@Inner@Topic@Section}{\value{section}}%将当前环境中的节计数器值赋给innertopiccounter
%\OriginChapter[##2]{##3}
%\setcounter{section}{\value{@Inner@Topic@Section}}}
%\vspace*{\@Chapter@VSpace}}
%%%%
%%简化序号命令%%
\renewcommand{\the@prenumber}{\thesection}
%%%%
\def\@Definiton@Title{专题~定义}
\def\@Definiton@Label{Def(Topic).\the@prenumber.\the@def}
%%%%
\def\@Theorem@Title{专题~定理}
\def\@Theorem@Label{Thm(Topic).\the@prenumber.\the@thm}
%%%%
\def\@Axiom@Title{专题~公理}
\def\@Axiom@Label{Axm(Topic).\the@prenumber.\the@axm}
%%%%
\def\@Lemma@Title{专题~引理}
\def\@Lemma@Label{Lem(Topic).\the@prenumber.\the@lem}
%%%%
\def\@Corollary@Title{专题~推论}
\def\@Corollary@Label{Colry(Topic).\the@prenumber.\the@colry}
%%%%
\def\@Propostion@Title{专题~命题}
\def\@Proposition@Label{Prop(Topic).\the@prenumber.\the@prop}
%%%%
\def\@Example@Name{典例}
\def\@Variant@Name{延拓}
%%%%
\def\@Exercise@Title{针对练习}
\def\@Thinking@Title{方法提炼}
%%%%
%将环境前的节计数器值储存在beforecounter中
\setcounter{@Outer@Topic@Section}{\value{section}}
%将节计数器置为环境中节计数器值
\setcounter{section}{\value{@Inner@Topic@Section}}
%%
%将环境前的例题计数器值储存在beforecounter中
\setcounter{@Outer@Topic@Eg}{\value{@egnum}}
%将例题计数器置为环境中节计数器值
\setcounter{@egnum}{\value{@Inner@Topic@Eg}}
%%
%将环境前的变式计数器值储存在beforecounter中
\setcounter{@Outer@Topic@Var}{\value{@varnum}}
%将变式计数器置为环境中节计数器值
\setcounter{@varnum}{\value{@Inner@Topic@Var}}
%%%%
%确保hyperref知道计数器变化
\hypersetup{pageanchor=true}
%修改超链接的唯一标识
\renewcommand{\theHsection}{\sectionlabelfront\thesection\sectionlabelback}
\renewcommand{\theHsubsection}{\subsectionlabelfront\thesubsection\subsectionlabelback}
}{\@topicfalse
\addtocontents{toc}{\protect\@topicfalse}
\addtocontents{lof}{\protect\@topicfalse}
\addtocontents{lot}{\protect\@topicfalse}
%将环境中的节计数器值储存在innercounter中
\setcounter{@Inner@Topic@Section}{\value{section}}
%将节计数器值恢复为环境前的值
\setcounter{section}{\value{@Outer@Topic@Section}}
%%
%将环境中的例题计数器值储存在innercounter中
\setcounter{@Inner@Topic@Eg}{\value{@egnum}}
%将例题计数器值恢复为环境前的值
\setcounter{@egnum}{\value{@Outer@Topic@Eg}}
%%
%将环境中的变式计数器值储存在innercounter中
\setcounter{@Inner@Topic@Var}{\value{@varnum}}
%将变式计数器值恢复为环境前的值
\setcounter{@varnum}{\value{@Outer@Topic@Var}}
%恢复原始超链接设置
\hypersetup{pageanchor=false}
}
%%%%
%%设置实验环境%%
\newcounter{@Outer@Project@Section}%储存环境前的节计数器数值
\newcounter{@Inner@Project@Section}%储存环境中的节计数器数值
\setcounter{@Inner@Project@Section}{0}%将环境中计数器值置零
\newcounter{@Outer@Project@Eg}%储存环境前的例题计数器数值
\newcounter{@Inner@Project@Eg}%储存环境中的例题计数器数值
\setcounter{@Inner@Project@Eg}{0}%将环境中例题计数器值置零
\newcounter{@Outer@Project@Var}%储存环境前的变式计数器数值
\newcounter{@Inner@Project@Var}%储存环境中的变式计数器数值
\setcounter{@Inner@Project@Var}{0}%将环境中变式计数器值置零
\newenvironment{Project}{
\clearpage
\@projecttrue
%在toc文件中写入\@experimenttrue，确保目录正确生成
\addtocontents{toc}{\protect\@projecttrue}
\addtocontents{lof}{\protect\@projecttrue}
\addtocontents{lot}{\protect\@projecttrue}
%修改页眉页脚标签
\renewcommand{\sectionlabelfront}{课题}
\renewcommand{\sectionlabelback}{}
%修改小节标签
\renewcommand{\subsectionlabelfront}{项目}
\renewcommand{\subsectionlabelback}{}
%修改图表标签
\renewcommand{\figurename}{课题~图}
\renewcommand{\tablename}{课题~表}
%环境中禁用part
\renewcommand{\part}{
\ClassError{textbook-cn}{Forbidden Part in Project Environment!}}
%环境中禁用chapter
\renewcommand{\chapter}{
\ClassError{textbook-cn}{Forbidden Chapter in Project Environment!}}
%%废弃的环境内chapter命令%%
%\RenewDocumentCommand{\chapter}{s O{##3} m}{
%\IfBooleanTF{##1}
%{\OriginChapter*{##3\@mkboth{##2}{##2}}}
%{\setcounter{@Inner@Project@Section}{\value{section}}%将当前环境中的节计数器值赋给innerprojectcounter
%\OriginChapter[##2]{##3}
%\setcounter{section}{\value{@Inner@Project@Section}}}
%\vspace*{\@Chapter@VSpace}}
%%%%
%%简化序号命令%%
\renewcommand{\the@prenumber}{\thesection}
%%%%
\def\@Definiton@Title{课题~定义}
\def\@Definiton@Label{Def(Project).\the@prenumber.\the@def}
%%%%
\def\@Theorem@Title{课题~定理}
\def\@Theorem@Label{Thm(Project).\the@prenumber.\the@thm}
%%%%
\def\@Axiom@Title{课题~公理}
\def\@Axiom@Label{Axm(Project).\the@prenumber.\the@axm}
%%%%
\def\@Lemma@Title{课题~引理}
\def\@Lemma@Label{Lem(Project).\the@prenumber.\the@lem}
%%%%
\def\@Corollary@Title{课题~推论}
\def\@Corollary@Label{Colry(Project).\the@prenumber.\the@colry}
%%%%
\def\@Propostion@Title{课题~命题}
\def\@Proposition@Label{Prop(Project).\the@prenumber.\the@prop}
%%%%
\def\@Example@Name{示例}
\def\@Variant@Name{改进}
%%%%
\def\@Exercise@Title{实践}
\def\@Thinking@Title{思考}
%%%%
%将环境前的节计数器值储存在beforecounter中
\setcounter{@Outer@Project@Section}{\value{section}}
%将节计数器置为环境中节计数器值
\setcounter{section}{\value{@Inner@Project@Section}}
%%
%将环境前的例题计数器值储存在beforecounter中
\setcounter{@Outer@Project@Eg}{\value{@egnum}}
%将例题计数器置为环境中节计数器值
\setcounter{@egnum}{\value{@Inner@Project@Eg}}
%%
%将环境前的变式计数器值储存在beforecounter中
\setcounter{@Outer@Project@Var}{\value{@varnum}}
%将变式计数器置为环境中节计数器值
\setcounter{@varnum}{\value{@Inner@Project@Var}}
%%%%
%确保hyperref知道计数器变化
\hypersetup{pageanchor=true}
%修改超链接的唯一标识
\renewcommand{\theHsection}{\sectionlabelfront\thesection\sectionlabelback}
\renewcommand{\theHsubsection}{\subsectionlabelfront\thesubsection\subsectionlabelback}
}{\@projectfalse
\addtocontents{toc}{\protect\@projectfalse}
\addtocontents{lof}{\protect\@projectfalse}
\addtocontents{lot}{\protect\@projectfalse}
%将环境中的节计数器值储存在innercounter中
\setcounter{@Inner@Project@Section}{\value{section}}
%将节计数器值恢复为环境前的值
\setcounter{section}{\value{@Outer@Project@Section}}
%%
%将环境中的例题计数器值储存在innercounter中
\setcounter{@Inner@Project@Eg}{\value{@egnum}}
%将例题计数器值恢复为环境前的值
\setcounter{@egnum}{\value{@Outer@Project@Eg}}
%%
%将环境中的变式计数器值储存在innercounter中
\setcounter{@Inner@Project@Var}{\value{@varnum}}
%将变式计数器值恢复为环境前的值
\setcounter{@varnum}{\value{@Outer@Project@Var}}
%恢复原始超链接设置
\hypersetup{pageanchor=false}
}

%%重定义\frontmatter%%
\renewcommand{\frontmatter}[1][roman]{
\cleardoublepage
\@mainmatterfalse
\pagenumbering{#1}}
%%重定义\mainmatter%%
\renewcommand{\mainmatter}{
\cleardoublepage
\@mainmattertrue
\pagenumbering{arabic}}
%%重定义\backmatter%%
\renewcommand{\backmatter}[1][Roman]{
\cleardoublepage
\@mainmatterfalse
\pagenumbering{#1}}
\makeatother

%%%%%%%%%%%%%%%%%% 盒子定义 %%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
%%%%
\newlength{\@Box@CriticTitleWidth}
\setlength{\@Box@CriticTitleWidth}{2\linewidth/3}
%%设置注释盒子样式%%
\tcbset{NoteBox/.style args={#1/#2}{
enhanced standard,breakable,empty,
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
\newlength{\@ItemBox@BigCircle@LineWidth}
\newlength{\@ItemBox@SmallCircle@LineWidth}
\setlength{\@ItemBox@BigCircle@LineWidth}{12.0pt}
\setlength{\@ItemBox@SmallCircle@LineWidth}{3.5pt}
%%
\tcbset{ItemBox/.style args={#1/#2}{
enhanced standard,breakable,empty,
boxsep=3.0mm,
top=2.0mm,bottom=-3.0mm,left=-3.0mm,right=-3.0mm,
varwidth boxed title=\@Box@CriticTitleWidth,
before upper={\setlength{\parindent}{2.0em}},
before lower={\setlength{\parindent}{2.0em}},
before=\par\medskip,after=\par\medskip,
fontupper=\ItemFont,fontlower=\ItemFont,
fonttitle=\BoxTitleFont,coltitle=white,
code={\colorlet{ListColor}{#2}},
title={%
%\AdjustStrut{0.85}%
\strut#1\strut%
},
attach boxed title to top left={xshift=\@ItemBox@SmallCircle@LineWidth/2,yshift*=-\tcboxedtitleheight},
boxed title style={size=minimal,empty,valign=center,left=2.5em,right=1.0em},
subtitle style={empty,fontupper=\BoxSubtitleFont,colupper=#2,top=-3.0mm,bottom=-3.0mm},
segmentation engine=path,
segmentation style={cap=round,line width=2.25pt,draw=#2!25,loosely dashed},
segmentation at break=false,
%%%%
underlay boxed title={
\BoxTitleFont
\def\@BoxTitle@Radius{\dimexpr\baselineskip/2\relax}%0.85
\draw[#2,fill=#2,ultra thick,rounded corners=\@BoxTitle@Radius](title.north west)rectangle(title.south east);
\draw[white,fill=white,line width=\@ItemBox@BigCircle@LineWidth]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle(\@BoxTitle@Radius);
\draw[#2,fill=white,line width=\@ItemBox@SmallCircle@LineWidth]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle(\@BoxTitle@Radius);
\draw[#2,fill=#2]([xshift=\@BoxTitle@Radius,yshift=-\@BoxTitle@Radius]title.north west)circle({\@BoxTitle@Radius/2});
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
code={\colorlet{ListColor}{#4}},
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
\DeclareDocumentEnvironment{Warning}{ +O{} +D<>{} }{\begin{box1}{易错点警示}[#1][#2][ColorF][\faExclamation]}{\end{box1}}
\DeclareDocumentEnvironment{Discussion}{ +O{} +D<>{}}{\begin{box1}[lowerbox=ignored]{思考与讨论}[#1][#2][ColorC][\faQuestion]}
{\end{box1}}
\DeclareDocumentEnvironment{Check}{ +O{} +D<>{} }{\begin{box1}[step=@check]{随堂练习~{\sffamily\the@check}}[#1][#2][ColorI][\faCheck]}
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
\DeclareDocumentEnvironment{Display}{ +O{} +D<>{} }{\begin{box2}{演示与实验}[#1][#2][ColorB][\faLayerGroup]}{\end{box2}}
\DeclareDocumentEnvironment{Method}{ +O{} +D<>{} }{\begin{box2}{方法与技巧}[#1][#2][ColorD][\faPodcast]}{\end{box2}}
\DeclareDocumentEnvironment{Mind}{ +O{} +D<>{} }{\begin{box2}{科学思维}[#1][#2][ColorC][\faAtom]}{\end{box2}}

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
\def\@Definiton@Label{Def.\the@prenumber.\the@def}
%%%%
\def\@Theorem@Title{定理}
\def\@Theorem@Label{Thm.\the@prenumber.\the@thm}
%%%%
\def\@Axiom@Title{公理}
\def\@Axiom@Label{Axm.\the@prenumber.\the@axm}

%%编号定义盒子%%
\DeclareDocumentEnvironment{Definition}{ +O{} +D<>{} D(){} }{\begin{box3}[phantom={
\if@mainmatter
\refstepcounter{@def}
\label{\@Definiton@Label}
\else
\phantomsection\label{#3}
\fi}]{%
\@Definiton@Title%
\if@mainmatter%
~\sffamily\the@prenumber.\the@def%
\fi}
[#1][#2][ColorA][\faCrosshairs]}{\end{box3}}
%%%%
\DeclareDocumentEnvironment{Theorem}{ +O{} +D<>{} D(){} }{\begin{box3}[phantom={
\if@mainmatter
\refstepcounter{@thm}
\label{\@Theorem@Label}
\else
\phantomsection\label{#3}
\fi}]{%
\@Theorem@Title%
\if@mainmatter%
~\sffamily\the@prenumber.\the@thm%
\fi}
[#1][#2][ColorB][\faCrosshairs]}{\end{box3}}
%%%%
\DeclareDocumentEnvironment{Axiom}{ +O{} +D<>{} D(){} }{\begin{box3}[phantom={
\if@mainmatter
\refstepcounter{@axm}
\label{\@Axiom@Label}
\else
\phantomsection\label{#3}
\fi}]{%
\@Axiom@Title%
\if@mainmatter%
~\sffamily\the@prenumber.\the@axm%
\fi}
[#1][#2][ColorI][\faCompactDisc]}{\end{box3}}
%%%%

%%不编号定义盒子%%
\DeclareDocumentEnvironment{Definition*}{ +O{} +D<>{} D(){} }{\begin{box3}[phantomlabel={#3}]{\@Theorem@Title}[#1][#2][ColorA][\faCrosshairs]}{\end{box3}}
\DeclareDocumentEnvironment{Theorem*}{ +O{} +D<>{} D(){} }{\begin{box3}[phantomlabel={#3}]{\@Theorem@Title}[#1][#2][ColorB][\faCrosshairs]}{\end{box3}}
\DeclareDocumentEnvironment{Axiom*}{ +O{} +D<>{} D(){} }{\begin{box3}[phantomlabel={#3}]{\@Axiom@Title}[#1][#2][ColorI][\faCompactDisc]}{\end{box3}}
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
\def\@Lemma@Label{Lem.\the@prenumber.\the@lem}
%%%%
\def\@Corollary@Title{推论}
\def\@Corollary@Label{Colry.\the@prenumber.\the@colry}
%%%%
\def\@Propostion@Title{命题}
\def\@Proposition@Label{Prop.\the@prenumber.\the@prop}

%%编号引理盒子%%
\DeclareDocumentEnvironment{Lemma}{ +O{} +D<>{} D(){} }{\begin{box4}[phantom={
\if@mainmatter
\refstepcounter{@lem}
\label{\@Lemma@Label}
\else
\phantomsection\label{#3}
\fi}]{%
\@Lemma@Title%
\if@mainmatter%
~\sffamily\the@prenumber.\the@lem%
\fi}
[#1][#2][ColorE][\faGlobe]}{\end{box4}}
%%%%
\DeclareDocumentEnvironment{Corollary}{ +O{} +D<>{} D(){} }{\begin{box4}[phantom={
\if@mainmatter
\refstepcounter{@colry}
\label{\@Corollary@Label}
\else
\phantomsection\label{#3}
\fi
}]{%
\@Corollary@Title%
\if@mainmatter%
~\sffamily\the@prenumber.\the@colry%
\fi}
[#1][#2][ColorG][\faCompactDisc]}{\end{box4}}
%%%%
\DeclareDocumentEnvironment{Proposition}{ +O{} +D<>{} D(){} }{\begin{box4}[phantom={
\if@mainmatter
\refstepcounter{@prop}
\label{\@Proposition@Label}
\else
\phantomsection\label{#3}
\fi
}]{%
\@Propostion@Title%
\if@mainmatter%
~\sffamily\the@prenumber.\the@prop%
\fi}
[#1][#2][ColorH][\faGlobe]}{\end{box4}}
%%%%
%%不编号引理盒子%%
\DeclareDocumentEnvironment{Lemma*}{ +O{} +D<>{} D(){} }{\begin{box4}[phantomlabel={#3}]{\@Lemma@Title}[#1][#2][ColorE][\faGlobe]}{\end{box4}}
\DeclareDocumentEnvironment{Corollary*}{ +O{} +D<>{} D(){} }{\begin{box4}[phantomlabel={#3}]{\@Corollary@Title}[#1][#2][ColorG][\faCompactDisc]}{\end{box4}}
\DeclareDocumentEnvironment{Proposition*}{ +O{} +D<>{} D(){} }{\begin{box4}[phantomlabel={#3}]{\@Propostion@Title}[#1][#2][ColorH][\faGlobe]}{\end{box4}}
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

\DeclareDocumentEnvironment{Link}{ +O{} +D<>{} }{\begin{box5}{拓展链接}[#1][#2][ColorE][\faLink]}{\end{box5}}
\DeclareDocumentEnvironment{History}{ +O{} +D<>{} }{\begin{box5}{科学发展史}[#1][#2][ColorC][\faCalendar*]}
{\end{box5}}
\DeclareDocumentEnvironment{STS}{ +O{} +D<>{} }{\begin{box5}{科学·技术·社会}[#1][#2][ColorH][\faCog]}
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

\DeclareDocumentEnvironment{Information}{ +O{} +D<>{} }{\begin{box6}{资料卡片}[#1][#2][ColorI][\faFile*]}{\end{box6}}
\DeclareDocumentEnvironment{Application}{ +O{} +D<>{} }{\begin{box6}{案例分析}[#1][#2][ColorA][\faTools]}{\end{box6}}
\DeclareDocumentEnvironment{Review}{ +O{} +D<>{} }{\begin{box6}{知识回顾}[#1][#2][ColorC][\faFan]}{\end{box6}}

%%%%
\DeclareTColorBox{box7}{ +O{} +O{} }{BlockBox=#2,#1}

\newenvironment{Proof}{\begin{box7}[][\faBars~~证明]}{\end{box7}}
%%
\newenvironment{Solution}{\begin{box7}[][\faBars~~参考答案]}{\end{box7}}
%%
\DeclareDocumentEnvironment{Block}{ +O{} }{\begin{box7}[][#1]}{\end{box7}}

%%%%
\DeclareTColorBox{box8}{+O{} +m +O{} +O{} O{ColorA} O{}}{CodeBox=#2/#3/#4/#5/#6,#1}

\NewDocumentEnvironment{Reading}{ +O{} +D<>{} }{\begin{box8}[step=@reading]{阅读理解~{\sffamily\the@reading}}[#1][#2][ColorB]}{\end{box8}}
%%
\NewDocumentEnvironment{Cloze}{ +O{} +D<>{} }{\begin{box8}[step=@cloze]{完形填空~{\sffamily\the@cloze}}[#1][#2][ColorA]}{\end{box8}}
%%
\NewDocumentEnvironment{Article}{ +O{} +D<>{} }{\begin{box8}{文本解读}[#1][#2][ColorC]}{\end{box8}}
%%
\NewDocumentEnvironment{Vocabulary}{ +O{} +D<>{} }{\begin{box8}{词汇解析}[#1][#2][ColorE]}{\end{box8}}
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
\setlength{\parindent}{2.0em}#2
\end{box9}}
}{%
\begin{box9}[][ColorH][\faCommentDots]{相关信息}
#2
\end{box9}}
}
%%%%
\DeclareDocumentCommand{\DeepThink}{ s +m }
{\IfBooleanTF{#1}
{\marginpar{\upshape%
\begin{box9}[][ColorB!90!black][\faTh]{深入思考}
\setlength{\parindent}{2.0em}#2
\end{box9}}
}{%
\begin{box9}[][ColorB!90!black][\faTh]{深入思考}
#2
\end{box9}}
}
%%%%
\DeclareDocumentCommand{\Remark}{ s +m }
{\IfBooleanTF{#1}
{\marginpar{\upshape%
\begin{box9}[][ColorF][\faChrome]{重点注释}
\setlength{\parindent}{2.0em}#2
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
\coordinate(E)at([yshift=-1.0cm]current page.north west);
\coordinate(F)at([xshift=-1.0cm,yshift=-1.0cm]current page.north east);
\coordinate(G)at([xshift=-1.0cm,yshift=1.0cm]current page.south east);
\coordinate(H)at([yshift=1.0cm]current page.south west);
%%背景%%
\draw[ColorB!5,fill=ColorB!5,sharp corners](D)rectangle(B);
\draw[ColorA!25,fill=ColorA!25](A)--(B)--(C)--(D)--(H)[rounded corners=5.0mm]--(G)[rounded corners=5.0mm]--(F)[sharp corners]--(E)--cycle;
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


