%% 
%% This is file `etistheme.cls' v1.0
%%
%% An comfortable beamer class to produce presentations for ETIS users
%% and compatible with each kind of compilation
%% 
%% Copyright (C) May 2011 Gael Rigaud
%% 
%% Attention !!
%% package "pict2e" is necessary to avoid warnings
%% directory "Logos/" has to be in the project directory to display logos
%%
%% Modified by Mickaël GARNIER February 2012 to produce presentations for
%% LIPADE users
%%
%% Modified by Mickaël GARNIER February 2015 to produce presentations for
%% Curie Institute and PICT

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{curietheme}[11/03/2011, v1.0]

\LoadClassWithOptions{beamer}

\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{pict2e}
\RequirePackage{colortbl}

\useinnertheme[shadow=true]{rounded}
\useoutertheme{shadow}
\usecolortheme{orchid}
\usecolortheme{whale}
    
\definecolor{orange1}{RGB}{255,133,0}
\definecolor{orange2}{RGB}{200,80,0}
\definecolor{gris1}{RGB}{110,110,110}
\definecolor{gris2}{rgb}{186,185,185}

\colorlet{gris12}{gris1!60!white}

\mode<presentation>

\setbeamercolor{normal text}{fg=white, bg=black!90} % couleur du texte
\setbeamercolor{structure}{fg=orange2}%gris1!60!black} % puces et titre des blocks normaux
%\setbeamertemplate{background canvas}{}
%\setbeamercolor{background canvas}{bg=black}
%\setbeamertemplate{background canvas}[default]
\mode<all>

\setbeamercolor{palette primary}{use={structure,normal text},fg=gris1} %theme
\setbeamercolor{palette secondary}{use={structure,normal text},fg=gris1}%theme
\setbeamercolor{palette tertiary}{use={structure,normal text},bg=black,fg=gris12} % theme
\setbeamercolor{palette quaternary}{use={structure,normal text},fg=structure.fg,bg=gris1} % theme   

\setbeamercolor{block title}{fg=gris1,bg=black}
\setbeamercolor{block body}{fg=gris1!10,bg=black!90!gris1}
\setbeamercolor*{block title example}{fg=white,bg=gris2}
\setbeamercolor*{block body example}{fg=normal text.fg,bg=gris2!10} 
\setbeamercolor*{block title alerted}{fg = white,bg = red}
\setbeamercolor*{block body alerted}{bg = red!10}
   
\def\HRule#1#2#3{\centering\color{#1}\rule{#2}{#3}}
    
\setbeamercolor{titlelike}{fg=white}%orange1}
\setbeamercolor{subtitle}{fg=gris1}
		
\setbeamertemplate{sections/subsections in toc}[circle]
\setbeamercolor{section in toc}{fg=orange1}
\setbeamercolor{subsection in toc}{fg=gris2}
\setbeamercolor{title}{bg=black,fg=orange1}%}gris12,fg=white}
\setbeamercolor{author}{fg=gris2}
\setbeamercolor{institute}{fg=gris2}
\setbeamercolor{date}{fg=gris2}
\setbeamercolor{author in head/foot}{fg=gris1}
\setbeamercolor{title in head/foot}{fg=gris1}
\setbeamercolor{date in head/foot}{fg=gris1}
		    
\setbeamercolor*{author in head/foot}{parent=palette tertiary}
\setbeamercolor*{title in head/foot}{parent=palette secondary}
\setbeamercolor*{date in head/foot}{parent=palette primary}
\setbeamercolor*{section in head/foot}{bg=black,fg=gris12}
\setbeamercolor*{subsection in head/foot}{fg=gris12,bg=white}
    
\newif\ifbooltree
\booltreefalse
\newif\ifbooldefault
\booldefaulttrue
\newif\ifboolsplit
\boolsplitfalse
\newif\ifboolminiframe
\boolminiframefalse

\DeclareOption{tree}{\booltreetrue\booldefaultfalse}
\DeclareOption{split}{\boolsplittrue\booldefaultfalse}
\DeclareOption{default}{\booldefaulttrue}
\DeclareOption{miniframe}{\boolminiframetrue\booldefaultfalse}

\ProcessOptions

\newif\ifbeamer@theme@subsection

\DeclareOptionBeamer{subsection}[true]{\csname beamer@sb@subsection#1\endcsname}
\ExecuteOptionsBeamer{subsection=true}
\ProcessOptionsBeamer

\beamer@compresstrue

%%%%%%%%%%%%%%%%%%%%%% creation d un deuxieme block de base

\newenvironment{block2}[1]
{
\setbeamercolor{block title}{fg=orange1,bg=black}
\setbeamercolor{block body}{fg=orange1!10,bg=black!90!orange1}
\begin{block}{#1}
}
{
\end{block}
\setbeamercolor{block title}{fg=white,bg=gris1}
\setbeamercolor{block body}{fg=black,bg=gris1!1}
}


%%%%%%%%%%%%%%%%%%% title page
  
\setbeamertemplate{title page}
{
  \thispagestyle{empty}
  \vbox{}
  
\ifbooltree\vspace{-3em}\fi
\ifbooldefault\vspace{-2em}\fi
\ifboolsplit\vspace{-5em}\fi
\ifboolminiframe\vspace{-3em}\fi

  \vfill 
  \begin{centering}
    \begin{beamercolorbox}[sep=8pt,center,rounded=true,shadow=true]{title}
      \usebeamerfont{title}\inserttitle\par%
      \ifx\insertsubtitle\@empty%
      \else%
        \vskip0.25em%
        {\usebeamerfont{subtitle} {\color{gris2}\textit{\insertsubtitle}}\par}%
      \fi%     
    \end{beamercolorbox}%
    \vskip1em\par
    \begin{minipage}{0.05\linewidth}
    $$\color{orange1}\left(
    \begin{array}{c}
    \vspace{0.4\paperheight}
    \end{array}
    \right.$$
		\end{minipage}\hfill
		\begin{minipage}{0.9\linewidth}
		\begin{beamercolorbox}[sep=8pt,center,rounded=true,shadow=true]{author}
      \usebeamerfont{author}\insertauthor
    \end{beamercolorbox}
    \begin{beamercolorbox}[sep=8pt,center,rounded=true,shadow=true]{institute}
      \usebeamerfont{institute}\insertinstitute
    \end{beamercolorbox}
    \begin{beamercolorbox}[sep=8pt,center,rounded=true,shadow=true]{date}
      \usebeamerfont{date}\insertdate
    \end{beamercolorbox}\vskip0.5em
    {\usebeamercolor[fg]{titlegraphic}\inserttitlegraphic\par}
  \begin{figure}
	\centering
\begin{tabular}{m{0.5\linewidth}m{0.4\linewidth}}
  \includegraphics[height = 0.3\textheight]{Logos/Logo_CurieBig} &
  \includegraphics[height = 0.1\textheight]{Logos/Logo_PICTa}
\end{tabular}
  %\includegraphics[height = 0.08\textheight]{Logos/Logo_Poly_Rouge}\hspace{1em}
  %\includegraphics[height = 0.1\textheight]{Logos/Logo_edite}\hspace{1em}
  \insertlogo
  \end{figure} 
  \end{minipage}\hfill 
  \begin{minipage}{0.05\linewidth}
    $$\color{orange1}\left.
    \begin{array}{c}
    \vspace{0.4\paperheight}
    \end{array}
    \right)$$
	\end{minipage}  

  \end{centering}
  \vfill
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%% frametitle

\setbeamertemplate{frametitle}{
	\vspace{-0.2em}
	\begin{minipage}{0.1\paperwidth}
	\end{minipage}\hfill	
	\begin{minipage}{0.8\paperwidth}
	\begin{beamercolorbox}[wd=\linewidth,center]{}%
	\color{orange1}\textbf{\insertframetitle}
	\end{beamercolorbox}
	\end{minipage}\hfill
	\begin{minipage}{0.1\paperwidth}
	\end{minipage}
}
		
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%% footline		

\defbeamertemplate*{footline}{mytheme theme}{
  \leavevmode%

\begin{picture}(0,2)
\textcolor{black}{\put(350,-9){\circle*{42.5}}}
\put(0,-9){\fcolorbox{black}{black}{\phantom{\hspace{\paperwidth}}}}
\put(0,-15){\fcolorbox{black}{black}{\phantom{\hspace{\paperwidth}}}}
\put(0,-3){\fcolorbox{black}{black}{\phantom{\hspace{\paperwidth}}}}
\textcolor{orange1}{\put(350,-9){\circle{43}}}
\end{picture}		
  
  \hspace{-5.4em}\HRule{orange1}{0.904\paperwidth}{0.1mm}\hfill\\
  \vspace{1mm}
  \hbox{

  \begin{beamercolorbox}[wd=.36\paperwidth,ht=2.25ex,dp=1ex,center]{}%
    \textbf{\centering\textcolor{gris1}{\insertshortauthor}}
  \end{beamercolorbox}\textcolor{orange1}{|}
  \begin{beamercolorbox}[wd=0.12\paperwidth,ht=2.25ex,dp=1ex,right]{}%
    \textbf{\centering\color{gris1}\insertshortdate}
  \end{beamercolorbox}%
  \begin{beamercolorbox}[wd=0.22\paperwidth,ht=2.25ex,dp=1ex,right]{}%
    \textbf{\color{gris1}\insertframenumber\ / \inserttotalframenumber} \hspace{-1mm}
  \end{beamercolorbox}
  }
  \vspace{0.5em}    
} 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%% headline

\defbeamertemplate*{headline}{mytheme theme}{
\pagecolor{black!90}
\ifbooldefault 	
\vspace{-2.5em}
\ifx\insertsection\@empty\
\begin{table}% 
	\color{orange1}   
	\begin{tabular}{p{0.4\linewidth}p{0.4\linewidth}}
		\hfill\textcolor{gris1}{\insertsectionhead}&\textcolor{gris12}{\insertsubsectionhead}
	\end{tabular}
\end{table}
\else   
\begin{table}% 
	\color{orange1}   
	\begin{tabular}{p{0.4\linewidth}|p{0.4\linewidth}}
		\hfill\textcolor{gris1}{\insertsectionhead}&\textcolor{gris12}{\insertsubsectionhead}
	\end{tabular}
\end{table}
\fi
\fi

%%%%% miniframe

\ifboolminiframe
\vspace{-1em}
\begin{minipage}{0.01\linewidth}
\end{minipage}\hfill
\begin{minipage}{0.99\linewidth}
\begin{table}
\begin{tabular}{c}
{\textbf{ \insertnavigation{\linewidth}}}
\end{tabular}
\end{table}
\end{minipage}
\vspace{-1em}
\fi

%%%%% tree

\ifbooltree 
\begin{minipage}{0.1\linewidth}
\end{minipage}\hfill
\begin{minipage}{0.9\linewidth}
\vspace{-1.8mm}
\begin{beamercolorbox}[wd=\paperwidth,ht=2.5ex,dp=1.125ex,%
      leftskip=.3cm,rightskip=.3cm plus1fil]{section in head/foot}
      \usebeamerfont{section in head/foot}%
      \insertsectionnavigationhorizontal{\paperwidth}{}{}
    \end{beamercolorbox}
    \begin{beamercolorbox}[wd=\paperwidth,ht=2.5ex,dp=1.125ex,%
      leftskip=.3cm,rightskip=.3cm plus1fil]{subsection in head/foot}
      \usebeamerfont{subsection in head/foot}%
      \ifx\insertsection\@empty\
      \insertsubsectionhead
      \else
      \ifx\insertsubsection\@empty\
      \insertsubsectionhead
      \else
      {\color{orange1}$\vartriangleright\ $}\insertsubsectionhead
      \fi
      \fi
    \end{beamercolorbox}
    \vspace{1mm}		
\end{minipage}
\vspace{-3em}
\fi

%%%%% split

\ifboolsplit	
	\vspace{-1em}
  \leavevmode%
  \@tempdimb=2.4375ex%
  \ifnum\beamer@subsectionmax<\beamer@sectionmax%
    \multiply\@tempdimb by\beamer@sectionmax%
  \else%
    \multiply\@tempdimb by\beamer@subsectionmax%
  \fi%
  \ifdim\@tempdimb>0pt%
    \advance\@tempdimb by 1.125ex%
    \begin{beamercolorbox}[wd=.5\paperwidth,ht=\@tempdimb]{section in head/foot}%
      \vbox to\@tempdimb{\vfil\insertsectionnavigation{.5\paperwidth}\vfil}%
    \end{beamercolorbox}%
    \begin{beamercolorbox}[wd=.5\paperwidth,ht=\@tempdimb]{subsection in head/foot}%
      \vbox to\@tempdimb{\vfil\insertsubsectionnavigation{.5\paperwidth}\vfil}%
    \end{beamercolorbox}%
  \fi%
\fi

%%%%% Logo + Filet

\ifbooltree\fi
\ifboolsplit\vspace{-2em}\fi
\ifbooldefault\vspace{-3.7em}\fi 
\ifboolminiframe\vspace{-3em}\fi

		\begin{minipage}{0.1\linewidth}
		\vspace{0.04\textheight}
		\includegraphics[width=0.9\linewidth]{Logos/Logo_Curie}
		\end{minipage}\hfill
		\begin{minipage}{\linewidth}	
		\vspace{1.2em}\HRule{orange1}{\linewidth}{0.2mm}\hfill\\
		\end{minipage}

}
		
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setbeamersize{text margin left=1em,text margin right=1em}    
\setbeamertemplate{enumerate item}[circle]

% Set the colors for bib entries
\setbeamertemplate{bibliography item}[book]
\setbeamercolor{bibliography entry author}{fg = gris1!50!white}
\setbeamercolor{bibliography entry title}{fg = gris1!50!white}
\setbeamercolor{bibliography entry journal}{fg = gris1!50!white}
\setbeamercolor{bibliography entry note}{fg = gris1!50!white}
\setbeamercolor{bibliography entry}{fg = gris1!50!white}
\setbeamercolor{bibliography entry article}{fg = gris1!50!white}
\setbeamercolor{bibliography entry book}{fg = gris1!50!white}
\setbeamercolor{bibliography entry location}{fg = gris1!50!white}


%
% Table of contents
%


\defbeamertemplate*{subsection in toc}{theme}
{{\color{orange1}$\vartriangleright\ $}\inserttocsubsection\par}

\mode<all>

