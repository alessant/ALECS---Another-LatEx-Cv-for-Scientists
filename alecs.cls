\ProvidesClass{alecs}[2020/02/27 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
	\PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------
\RequirePackage{array}
\RequirePackage{ifthen}
\RequirePackage{ifmtarg}
\RequirePackage{etoolbox}
\RequirePackage{titlesec}
\RequirePackage[absolute,overlay]{textpos}

\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, calc}

\RequirePackage{xcolor}
\RequirePackage{parskip}

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX]{unicode-math}

\RequirePackage[absolute,overlay]{textpos}

\RequirePackage{fontawesome}
\RequirePackage{marvosym}

\RequirePackage{lastpage}

\RequirePackage{everypage}
\RequirePackage[hmargin=1.5in,top=2.5cm,bottom=4cm,nohead,nofoot]{geometry}

\RequirePackage[final,bookmarks,breaklinks,colorlinks,linkcolor=black,urlcolor=black,citecolor=black,allcolors=black]{hyperref}


%----------------------------------------------------------------------------------------
%	 COLORS
%----------------------------------------------------------------------------------------
\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{9cc125}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{darkblue}{HTML}{063060} %083c78 052850 063060 004467

\ifdefined\@cv@print
\colorlet{green}{gray}
\colorlet{orange}{gray}
\colorlet{purple}{gray}
\colorlet{red}{gray}
\colorlet{blue}{gray}
\colorlet{fillheader}{white}
\colorlet{header}{gray}
\colorlet{iconcolor}{gray}
\else
\colorlet{fillheader}{gray}
\colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}
\colorlet{iconcolor}{gray}


%----------------------------------------------------------------------------------------
%	 FONTS
%----------------------------------------------------------------------------------------
\newfontfamily\bodyfont
	[
		Path=fonts/,
		BoldFont=texgyreheros-bold.otf,
		ItalicFont=texgyreheros-italic.otf,
		BoldItalicFont=texgyreheros-bolditalic.otf
	]
	{texgyreheros-regular.otf}
\newfontfamily\thinfont[Path=fonts/]{Lato-Light.ttf}
\newfontfamily\headingfont[Path=fonts/]{texgyreheros-bold.otf}

\defaultfontfeatures{Mapping=tex-text}

\setmainfont
	[
		Path=fonts/,
		Mapping=tex-text, Color=textcolor,
		BoldFont=texgyreheros-bold.otf,
		ItalicFont=texgyreheros-italic.otf,
		BoldItalicFont=texgyreheros-bolditalic.otf
	]
{texgyreheros-regular.otf}

\setmathfont[Path=fonts/]{texgyreheros-regular.otf}


%----------------------------------------------------------------------------------------
%	 CONFIGURATION
%----------------------------------------------------------------------------------------
\pagestyle{empty} % Disable headers and footers


%----------------------------------------------------------------------------------------
%	 DEFINITIONS
%----------------------------------------------------------------------------------------
\def\profilepic#1{\def\@profilepic{#1}}
\def\name#1{\def\@name{#1}}
\def\surname#1{\def\@surname{#1}}
\def\jobtitle#1{\def\@jobtitle{#1}}

\def\birthday#1{\def\@birthday{#1}}

\def\address#1{\def\@address{#1}}
\def\cellnumber#1{\def\@cellnumber{#1}}
\def\mail#1{\def\@mail{#1}}
\def\website#1{\def\@website{#1}}
\def\linkedin#1{\def\@linkedin{#1}}
\def\skype#1{\def\@skype{#1}}
\def\facebook#1{\def\@facebook{#1}}
\def\twitter#1{\def\@twitter{#1}}
\def\github#1{\def\@github{#1}}

\newcommand{\keywords}[3]{
	\renewcommand{\@keywords}{%
		\ifstrempty{#2}{%
			$\cdot$ #1 $\cdot$%
		}{%
			\ifstrempty{#3}{%
				#1 $\cdot$ #2%
			}{%
				#1 $\cdot$ #2 $\cdot$ #3
			}%
		}%
	}
}
\newcommand{\@keywords}{}

\newcommand*{\icon}[1]{
	\tikz[baseline=(char.base)]{
		\node[shape=circle,inner sep=1pt,text=iconcolor] (char) {#1};
	}
}

\def\ximage#1{\def\@ximage{#1}}
\def\yimage#1{\def\@yimage{#1}}

%----------------------------------------------------------------------------------------
%	 LAYOUT DEFINITIONS
%----------------------------------------------------------------------------------------
\pagecolor{white}

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}


%----------------------------------------------------------------------------------------
%	 HEADER LAYOUT
%----------------------------------------------------------------------------------------
\newcommand{\@headerheight}{5cm}

\newcommand{\makeheader}{
	\begin{tikzpicture}[remember picture,overlay]
	\node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=\@headerheight] (box) at (current page.north){};
	
	\begin{scope}
		\clip (-3.2,2.3) circle (2);
		\node[anchor=west, inner sep=0cm, outer sep=0pt, circle] (profile) at (\@ximage,\@yimage) {
			{\includegraphics[width=\imagewidth]{\@profilepic}}
		};
	\end{scope}
	
	\node [anchor=south] (name) at (box) {% 
		%\node [anchor=south west] (name) at(profile.east) {%
		\fontsize{40pt}{72pt}\color{header}%
		{\thinfont \@name } {\bodyfont \@surname}
	};
	
	\node [anchor=north] (job) at (name.south) {%
		\fontsize{19pt}{24pt}\color{header}%
		\thinfont \@jobtitle%
	};

	\ifthenelse{\equal{\@keywords}{}}{}{
		\node [anchor=north] at (job.south) {%
			\fontsize{13pt}{24pt}\color{header}%
			\thinfont \@keywords%
		};
	};

	\end{tikzpicture}
  	\vspace{.3cm}
}


%----------------------------------------------------------------------------------------
%	 SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------
\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin


\newenvironment*{sidebar}{%
	\let\oldsection\section
	\renewcommand{\section}[2]{
		\par\vspace{\baselineskip}
		{
			\ifthenelse{\equal{##2}{}}
			{\Large\headingfont\color{headercolor} ##1} %no icon
			{\Large\headingfont\color{headercolor} ##1 \color{iconcolor}##2} %with icon	
		}
		\par
	}
	\begin{textblock}{5.5}(0.5, 4.9)
		\begin{flushright}
			%\obeycr
}{%
			%\restorecr
		\end{flushright}
	\end{textblock}

	\let\section\oldsection
}


\newcommand{\makecontactlist}{
	\renewcommand{\arraystretch}{.8}
	
	\begin{tabular} 
		{
			r>{\raggedleft\arraybackslash}p{.4cm}
			@{\hskip 2pt}
			r>{\raggedright\arraybackslash}p{0.2cm}
		}
		\ifthenelse{\equal{\@address}{}}{}{\@address & \icon{\faHome}\\}
		\ifthenelse{\equal{\@cellnumber}{}}{}{\@cellnumber & \icon{\faPhone}\\}
		
		\ifthenelse{\equal{\@mail}{}}{}{\\ \@mail & \icon{\faPencilSquareO}\\}
		\ifthenelse{\equal{\@website}{}}{}{\@website & \icon{\faGlobe}\\}
		
		\ifthenelse{\equal{\@github}{}}{}{\\ \@github & \icon{\faGithub}\\}
		\ifthenelse{\equal{\@twitter}{}}{}{\@twitter & \icon{\faTwitter}\\}
		\ifthenelse{\equal{\@facebook}{}}{}{\@facebook & \icon{\faFacebook}\\}
		\ifthenelse{\equal{\@linkedin}{}}{}{\@linkedin & \icon{\faLinkedin}\\}
		\ifthenelse{\equal{\@skype}{}}{}{\@skype & \icon{\faSkype}\\}
	\end{tabular}
}

%----------------------------------------------------------------------------------------
%	 SKILLS within SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\skills}[1]{
	\renewcommand{\@skills}{%
		\foreach [count=\i] \x/\y in {#1}
		{ 
				\x \
				%
				\pgfmathsetmacro\pgfxa{\y + 1}%
				\tikzstyle{scorestars}=[star, star points=5,  draw, inner sep=0.3em, anchor=-85ex]%outer point 3
				%
				\begin{tikzpicture}[baseline]
					\draw (1em, 0) node[name=star1, scorestars, fill=headercolor!80, headercolor]  {};
					%
					\pgfmathparse{\y<1 ? \y-int(\y) : \y}
					\let\starpart=\pgfmathresult
					%
					\path [clip] 
						($(star1.outer point 3)!(star1.outer point 2)!(star1.outer point 4)$) rectangle 
						($(star1.outer point 2 |- star1.outer point 1)!\starpart!(star1.outer point 1 -| star1.outer point 5)$);
					\fill (1em, 0) node[scorestars, fill=iconcolor, iconcolor]  {};
				\end{tikzpicture}
			
		}
	}
}
\newcommand{\@skills}{}


\newcommand{\makeskills}{
	\@skills
}





%----------------------------------------------------------------------------------------
%	 BODY LAYOUT
%----------------------------------------------------------------------------------------
\newbool{secondpage}

\AddEverypageHook{
	\ifthenelse{\thepage>1}{%
		\ifbool{secondpage}{%true
			%do nothing - geometry already set
		}{%second page
			\booltrue{secondpage}%
			\restoregeometry
		}
	}{%
		%first page
		\newgeometry{left=6.7cm,top=4.45cm,right=2.5cm}
	}%
}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
	{%
		\color{%
			\ifcase\value{colorCounter}%
			blue\or%
			red\or%
			orange\or%
			green\or%
			purple\or%
			blue\or%
			red\or%
			orange\or%
			green\or%
			purple\else%
			headercolor\fi%
		} #1#2#3%
	}%
	\stepcounter{colorCounter}%
}

\def\@defaultsectioncolor#1#2#3{%
	{% 
		\color{iconcolor} #1#2#3%
	}%
}

\renewcommand*{\section}[2][]{
	\par\vspace{\parskip}
	{%
		
		\ifthenelse{\equal{#1}{nocolor}}{%
			\LARGE\headingfont\color{headercolor} #2
		}{
			\ifthenelse{\equal{#1}{defaultcolor}}{
				\LARGE\headingfont\color{headercolor}%
				\@defaultsectioncolor #2%
			}{
				\LARGE\headingfont\color{headercolor}%
				\@sectioncolor #2%
			}
		}
		
	}
	\par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}%
	{%
		\large\headingfont\color{headercolor} #1%
	}
	\par\vspace{.25\parskip}%
}


%----------------------------------------------------------------------------------------
%	 LIST ENVIRONMENTS
%----------------------------------------------------------------------------------------
\setlength{\tabcolsep}{0pt}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}

\newenvironment{eventlist}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
	}{%
	\end{tabular*}
}

\newcommand{\event}[4]{%
	{\footnotesize#1}&\parbox[t]{12cm}{%
		\textbf{#2}%
		\hfill%
		{\footnotesize\addfontfeature{Color=lightgray} #3}\\%
		#4\vspace{\parsep}%
	}\\}


\newenvironment{tinyeventlist}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
	}{%
	\end{tabular*}
}

\newcommand{\tinyevent}[2]{%
	{\footnotesize#1}&\parbox[t]{12cm}{%
		\textbf{#2}%
	}\\}

%----------------------------------------------------------------------------------------
%	 BIBLIOGRAPHY
%----------------------------------------------------------------------------------------
\RequirePackage[sorting=none, backend=biber, maxnames=6]{biblatex}

\DeclareFieldFormat{labelnumberwidth}{$\cdot$}
\DeclareFieldFormat[article,inproceedings]{title}{\textit{#1}}
\DeclareFieldFormat[article,inproceedings]{note}{\textbf{#1}}

\setlength{\bibitemsep}{5pt}

\renewcommand*{\mkbibnamegiven}[1]{%
	\ifitemannotation{highlight}
	{\textbf{#1}}
	{#1}}

\renewcommand*{\mkbibnamefamily}[1]{%
	\ifitemannotation{highlight}
	{\textbf{#1}}
	{#1}}


\nocite{*}






