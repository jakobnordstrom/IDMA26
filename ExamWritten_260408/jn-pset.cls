%%%
%%% Hack by Jakob Nordström to produce template for problem sets
%%% Based on "nada-ten.cls" with extremely minor modifications.
%%% 
%%% Environments "solution sketch" and "answer" have been added as 
%%% alternatives to "solution" 
%%%
\NeedsTeXFormat{LaTeX2e}[1998/12/01]
\ProvidesClass{jn-pset}
[2022/01/04 v1.1
 Jakob's template for problem sets and exams]
\def\@nadakurs@color{\@nadakurs@default@color}
\DeclareOption{color}{\def\@nadakurs@color{cmyk}}%
\DeclareOption{colour}{\def\@nadakurs@color{cmyk}}%
\DeclareOption{svv}{\def\@nadakurs@color{svv}}%
\DeclareOption{b&w}{\def\@nadakurs@color{svv}}%
\newif\if@twoside
\@twosidetrue
\DeclareOption{oneside}{\@twosidefalse}%
\DeclareOption{twoside}{\@twosidetrue}%
\newif\if@nadaten@solutions \@nadaten@solutionsfalse
\DeclareOption{solutions}{\@nadaten@solutionstrue}%
\PassOptionsToPackage{fleqn}{amsmath}
\PassOptionsToPackage{T1}{url}
\ProcessOptions
\LoadClass[a4paper,fleqn,11pt]{article}
\RequirePackage[T1]{fontenc}
\RequirePackage{geometry,graphics,ifpdf,textcomp,type1cm}
\RequirePackage{amssymb}
\RequirePackage{comment}
\ifpdf
  \def\@nadakurs@default@color{cmyk}
  \def\pdfstringdefPreHook{\def\\{;\space}}
  \RequirePackage[a4paper,bookmarksopen=true,pdfpagemode=None,pdfstartview=FitH]{hyperref}%
\else
  \def\@nadakurs@default@color{svv}
  \RequirePackage[T1]{url}
  \def\hypersetup#1{}%
\fi
\newif\if@nadakurs@author   \@nadakurs@authorfalse
\newif\if@nadakurs@course   \@nadakurs@coursefalse
\newif\if@nadakurs@semester \@nadakurs@semesterfalse
\renewcommand{\author}[1]{%
  \gdef\theauthor{#1}%
  \@nadakurs@authortrue
  \hypersetup{pdfauthor={#1}}}
\newcommand{\course}[1]{%
  \gdef\thecourse{#1}%
  \@nadakurs@coursetrue
  \hypersetup{pdfsubject={#1}}}
\renewcommand{\date}[1]{\gdef\thedate{#1}}
\def\thedate{\number\year-\two@digits\month-\two@digits\day}
\newcommand{\department}[1]{\relax}
\newcommand{\semester}[1]{%
  \gdef\thesemester{#1}%
  \@nadakurs@semestertrue
  \hypersetup{pdfkeywords={#1}}}
\renewcommand{\title}[1]{%
  \gdef\thetitle{#1}%
  \hypersetup{pdftitle={#1}}}
\def\nadakurs@do@bullet{\quad\textbullet\quad}
\def\ps@nadakurs{%
    \let\@oddhead\@empty
  \let\@evenhead\@oddhead
    \def\@oddfoot{\parbox{\textwidth}{\sffamily\footnotesize
      \rightline{%
        \@nadakurs@language{Sida}{Page}\space\thepage\space
        (\@nadakurs@language{av}{of}\space\@nada@last@page)%
      }
      \smallskip
      \setlength{\@tempdima}{\textwidth}
      \addtolength{\@tempdima}{4em}
      \centerline{\hbox to\@tempdima{\hrulefill}}
      \smallskip
      \centering\begingroup
      \let\nadakurs@bullet\relax
      \def\\{\nadakurs@bullet \let\nadakurs@bullet\nadakurs@do@bullet}
      \let\and\\
      \if@nadakurs@course\\\thecourse\fi
      \if@nadakurs@semester\\\thesemester\fi
      \if@nadakurs@author
        \par
        \let\nadakurs@bullet\relax
        \\\theauthor
      \fi
      \endgroup}}%
    \def\@evenfoot{\parbox{\textwidth}{\sffamily\footnotesize
      \if@twoside\let\next\leftline\else\let\next\rightline\fi
      \next{%
        \@nadakurs@language{Sida}{Page}\space\thepage\space
        (\@nadakurs@language{av}{of}\space\@nada@last@page)%
      }
      \smallskip
      \setlength{\@tempdima}{\textwidth}
      \addtolength{\@tempdima}{4em}
      \centerline{\hbox to\@tempdima{\hrulefill}}
      \smallskip
      \centering\begingroup
      \let\nadakurs@bullet\relax
      \def\\{\nadakurs@bullet \let\nadakurs@bullet\nadakurs@do@bullet}
      \let\and\\
      \if@nadakurs@course\\\thecourse\fi
      \if@nadakurs@semester\\\thesemester\fi
      \if@nadakurs@author
        \par
        \let\nadakurs@bullet\relax
        \\\theauthor
      \fi
      \endgroup}}%
  \let\@mkboth\@gobbletwo
  \let\chaptermark\@gobble
  \let\sectionmark\@gobble
}
\def\ps@plain{%
  \let\@oddhead\@empty\let\@evenhead\@empty
  \def\@oddfoot{%
     \hfil
     \@nadakurs@language{Sida}{Page}\space\thepage\space
     (\@nadakurs@language{av}{of}\space\@nada@last@page)%
     \hfil}%
  \let\@evenfoot\@oddfoot
}
\geometry{a4paper,twoside,left=25mm,right=25mm,top=30mm,bottom=35mm,footskip=15mm}
\pagestyle{nadakurs}
\sffamily
\DeclareFontShape{T1}{cmss}{sbc}{n}{<->ecssdc10}{}
\rmfamily
\renewcommand{\maketitle}{%
  \begingroup
  \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
  \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
  \long\def\@makefntext##1{\parindent 1em\noindent
     \hb@xt@1.8em{\hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
  \global\@topnum\z@   % Prevents figures from going at top of page.
  \vglue-15mm
  \centerline{\resizebox{!}{30truemm}{%
%       \includegraphics{kth_\@nadakurs@color_\@nadakurs@language
%         {datavet_komm}{comp_science_comm}}
    \includegraphics{ku_logo_dk_h.png}%
}}%
  \vspace{8mm}%
  \begin{center}\usefont{T1}{cmss}{sbc}{n}\LARGE\boldmath\thetitle\end{center}
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\@thanks\@empty
}
\AtBeginDocument{%
  \@ifpackageloaded{babel}%
                   {\def\@nadakurs@language{\iflanguage{swedish}}}%
                   {\def\@nadakurs@language{\expandafter\@secondoftwo}}}%
\AtEndDocument{%
  \clearpage
  \addtocounter{page}{-1}
  \immediate\write\@auxout{\string\gdef\string\@nada@last@page{\thepage}}
  \addtocounter{page}{1}
}
\def\@nada@last@page{\textbf{??}\G@refundefinedtrue}
\setlength{\parskip}{0\p@}
\newlength{\captionindent}
\setlength{\captionindent}{\leftmargini}
\setlength{\abovecaptionskip}{10\p@}
\setlength{\belowcaptionskip}{10\p@}
\def\onecaptflag{268 }
\long\def\@makecaption#1#2{\let\@tempa\relax
  {\advance\leftskip\captionindent
   \advance\rightskip\captionindent
   \ifdim\prevdepth>-99\p@ \vskip\abovecaptionskip \relax
   \else \def\@tempa{\vbox to\topskip{}}\fi
   \footnotesize{\bfseries #1.} \@tempa \vadjust{\penalty \onecaptflag}#2\par
   \ifnum\lastpenalty=\onecaptflag
      \unpenalty \setbox\@tempboxa\lastbox
      \nointerlineskip
      \hbox to\hsize{\hskip\parfillskip\unhbox\@tempboxa}%
   \fi \vskip\belowcaptionskip}}
\renewenvironment{abstract}{%
   \small\quotation\noindent\ignorespaces
}{
   \endquotation
}
\newcounter{problem}
\renewcommand\theproblem{\arabic{problem}}
\newenvironment{problem}{%
  \bigbreak
  \refstepcounter{problem}\noindent
  \llap{\textbf{\theproblem}\quad}\ignorespaces
}{%
  \par\if@nadaten@solutions\relax\else\filbreak\fi
}
\newenvironment{problem*}{%
  \bigbreak
  \refstepcounter{problem}\noindent
  \llap{\textbf{\theproblem}\quad}\ignorespaces
}{%
  \par
}
\newcounter{subproblem}[problem]
\renewcommand{\thesubproblem}{\arabic{problem}\alph{subproblem}}
\newenvironment{subproblem}{%
  \refstepcounter{subproblem}%
  \list{}{}%
  \item\leavevmode
  \llap{\hbox to \leftmargini{\textbf{\thesubproblem}\hfil}}%
  \ignorespaces
}{%
  \endlist\if@nadaten@solutions\relax\else\filbreak\fi
}
\newenvironment{subproblem*}{%
  \refstepcounter{subproblem}%
  \list{}{}%
  \item\leavevmode
  \llap{\hbox to \leftmargini{\textbf{\thesubproblem}\hfil}}%
  \ignorespaces
}{%
  \endlist
}
\specialcomment{solution}{%
  \bigbreak\noindent
  \textbf{\@nadakurs@language{L\"{o}sning:}{Solution:}}\space
}{%
  \par\if@nadaten@solutions\relax\else\filbreak\fi
}
\if@nadaten@solutions\relax\else\excludecomment{solution}\fi
%%%
%%% Adding "solution sketch" and "answer" as alternatives to
%%% "solution" 
%%%
\specialcomment{solutionsketch}{%
  \bigbreak\noindent
  \textbf{\@nadakurs@language{L\"{o}sningsskiss:}{Solution (sketch):}}\space
}{%
  \par\if@nadaten@solutions\relax\else\filbreak\fi
}
\if@nadaten@solutions\relax\else\excludecomment{solutionsketch}\fi
\specialcomment{answer}{%
  \bigbreak\noindent
  \textbf{\@nadakurs@language{Svar:}{Answer:}}\space
}{%
  \par\if@nadaten@solutions\relax\else\filbreak\fi
}
\if@nadaten@solutions\relax\else\excludecomment{answer}\fi
%%%
%%%
%%%
\newcommand{\choice}{\item[$\square$]}
\newcommand{\correctchoice}{%
  \item[$\if@nadaten@solutions\blacksquare\else\square\fi$]}
\newenvironment{multiplechoices}{\begin{itemize}}{\end{itemize}}
\endinput
%%
%% End of file `nada-ten.cls'.
