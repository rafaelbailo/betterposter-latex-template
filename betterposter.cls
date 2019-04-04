%%%% Better Poster latex template v1.0 (2019/04/04)
%%%% GNU General Public License v3.0
%%%% Rafael Bailo
%%%% https://github.com/rafaelbailo/betterposter-latex-template
%%%% 
%%%% Original design from Mike Morrison
%%%% https://twitter.com/mikemorrison

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{betterposter}[2019/04/04 Better Poster latex template v1.0]

%% "article" as the base class
\LoadClass{article}
\pagestyle{empty}

%%%% REQUIRED PACKAGES

%% Paper size
\RequirePackage{geometry} 
\geometry{a0paper}

%% Paper orientation
\geometry{landscape}

%% Remove default margins
\geometry{margin=0in}

%% Font
\RequirePackage{cmbright}
\RequirePackage[default]{lato}
\RequirePackage[T1]{fontenc}

%% Small separation on enumerate and itemize
\RequirePackage{enumitem}
\setlist{nolistsep}
\setenumerate{noitemsep}
\setitemize{noitemsep}
\setlength{\parindent}{0pt}

%% Colours
\RequirePackage{xcolor}
\definecolor{imperialblue}{RGB}{0,62,116}
\definecolor{empirical}{RGB}{0,77,64}
\definecolor{theory}{RGB}{26,35,126}
\definecolor{methods}{RGB}{140,22,22}
\definecolor{intervention}{RGB}{255,213,79}

\newcommand{\columnbackgroundcolor}{white}
\newcommand{\columnfontcolor}{black}
\newcommand{\maincolumnbackgroundcolor}{imperialblue}
\newcommand{\maincolumnfontcolor}{white}

%% Graphics
\RequirePackage{graphicx}

%% AMS packages
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}



%%%% SIZE COMMANDS

%% Poster lengths
\newlength{\leftbarwidth}
\newlength{\rightbarwidth}
\newlength{\columnmarginvertical}
\newlength{\columnmarginhorizontal}
\newlength{\maincolumnmarginvertical}
\newlength{\maincolumnmarginhorizontal}

%%%% SIZING OPTIONS

\newcommand{\fontsizestandard}{\fontsize{32.00}{50.50} \selectfont}
\newcommand{\fontsizemain}{\fontsize{116.00}{220.00} \selectfont}
\newcommand{\fontsizetitle}{\fontsize{80.00}{120.00} \selectfont}
\newcommand{\fontsizeauthor}{\fontsize{48.00}{68.00} \selectfont}
\newcommand{\fontsizesection}{\fontsize{48.00}{68.00} \selectfont}

\DeclareOption{a2paper}{
\geometry{a2paper}
\renewcommand{\fontsizestandard}{\fontsize{16.00}{25.00} \selectfont}
\renewcommand{\fontsizemain}{\fontsize{58.00}{110.00} \selectfont}
\renewcommand{\fontsizetitle}{\fontsize{40.00}{50.00} \selectfont}
\renewcommand{\fontsizeauthor}{\fontsize{24.00}{34.00} \selectfont}
\renewcommand{\fontsizesection}{\fontsize{24.00}{34.00} \selectfont}
}

\DeclareOption{a1paper}{
\geometry{a1paper}
\renewcommand{\fontsizestandard}{\fontsize{22.63}{35.36} \selectfont}
\renewcommand{\fontsizemain}{\fontsize{82.02}{155.56} \selectfont}
\renewcommand{\fontsizetitle}{\fontsize{56.57}{70.71} \selectfont}
\renewcommand{\fontsizeauthor}{\fontsize{33.94}{48.08} \selectfont}
\renewcommand{\fontsizesection}{\fontsize{33.94}{48.08} \selectfont}
}

\DeclareOption{a0paper}{
\geometry{a0paper}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%% Default values for lengths
\setlength{\leftbarwidth}{0.2\paperwidth}
\setlength{\rightbarwidth}{0.2\paperwidth}
\setlength{\columnmarginvertical}{0.025\paperheight}
\setlength{\columnmarginhorizontal}{0.025\paperheight}
\setlength{\maincolumnmarginvertical}{0.07\paperheight}
\setlength{\maincolumnmarginhorizontal}{0.07\paperheight}



%%%% TEMPLATE COMMANDS

%% Main beterposter command
\newcommand{\betterposter}[3]{%
\noindent
% Left column
\column{\dimexpr 1.0\textheight\relax}{\leftbarwidth}%
{\columnbackgroundcolor}{\columnfontcolor}{\columnmarginvertical}{\columnmarginhorizontal}{#2}%
% Central column
\column{\dimexpr 1.0\textheight\relax}{
\dimexpr 1.0\textwidth-\leftbarwidth-\rightbarwidth\relax
}{\maincolumnbackgroundcolor}{\maincolumnfontcolor}{\maincolumnmarginvertical}{\maincolumnmarginhorizontal}{#1}%
% Right column
\column{\dimexpr 1.0\textheight\relax}{\rightbarwidth}%
{\columnbackgroundcolor}{\columnfontcolor}{\columnmarginvertical}{\columnmarginhorizontal}{#3}%
}

%% Coloured column command
\newcommand{\column}[7]{%
\begin{minipage}[t][#1][t]{#2}%
\noindent\colorbox{#3}{%
\begin{minipage}[t][
\dimexpr 1.0\textheight\relax
][t]{\dimexpr 1.0\textwidth-0\fboxrule-2\fboxsep\relax}
{\leavevmode\color{#4}\centeredpage{#5}{#6}{#7}}
\end{minipage}}%
\end{minipage}%
}

%% Page with margins command
\newcommand{\centeredpage}[3]{%
\begin{minipage}[c][\textheight][c]{\textwidth}
\begin{center}
\begin{minipage}[t][
\dimexpr 1.0\textheight-2.0#1\relax
][t]{
\dimexpr 1.0\textwidth-2.0#2\relax		
}
{\fontsizestandard #3}
\end{minipage}
\end{center}
\end{minipage}
}

%% Main column command
\newcommand{\maincolumn}[2]{
\vfill{
\fontsizemain

#1

\vspace{1em}
}
\vfill	
\begin{minipage}[t][0.25\textheight][b]{\textwidth}
#2
\end{minipage}
}

%% QR code
\newcommand{\qrcode}[3]{
\begin{minipage}[c]{0.30\textwidth}
\includegraphics[width=\textwidth]{#1}
\end{minipage}%
\begin{minipage}[c]{0.12\textwidth}
\hfill
\includegraphics[height=0.85\textwidth]{#2}
\end{minipage}%
\begin{minipage}[c]{0.50\textwidth}
#3
\end{minipage}%
}

%% Compact QR code
\newcommand{\compactqrcode}[2]{
\begin{minipage}[t]{0.3\textwidth}
\includegraphics[width=\textwidth]{#1}

#2
\end{minipage}%
}

%% Section command
\renewcommand{\section}[1]{

\vspace{2em}{\fontsizesection\selectfont
\textbf{\leavevmode
#1
}}\\[0.5em]
}

%% Title command
\renewcommand{\title}[1]{
{\fontsizetitle\textbf{\leavevmode
#1
}}\\

}

%% Author command
\renewcommand{\author}[1]{
{\color{gray}\fontsizeauthor
#1
}\\[-1.0em]

}

%% Institution command
\newcommand{\institution}[1]{
\vspace{-1em}
{\color{gray}
#1
}\\[-1.0em]

}
