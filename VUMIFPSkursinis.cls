%% VUMIFPSkursinis.cls – „Tik svajotojai-romantikai gali pagerinti nepakeičiamą pasaulį“
%% Created by   „Atviras Kodas Lietuvai“  2015
%
%% Latest version available here: https://github.com/LIKS/course_work_template_vu_mif_se
%% Any suggestions or contributions are welcome!  Also see: http://latex.liks.lt!
%
%%  License CC BY 4.0 (see more at http://creativecommons.org/licenses/by/4.0/)
% You are free to (a) share - copy and redistribute the material in any medium
% or format (b) adapt - remix, transform, and build upon the material for any
% purpose, even commercially. As long as you give appropriate credit, provide a
% link to the license, and indicate if changes were made.)


% Kursinio darbo apiforminimas pagal Vilniaus universiteto
% Matematikos ir informatikos fakulteto Programų sistemų katedros reikalavimus
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{VUMIFPSkursinis}[2015/02/03 1.0 VU MIF SE course work class]
\LoadClass[12pt, a4paper]{article}
\RequirePackage{LTPlius}  % Nustatymų sulietuvinimas
\RequirePackage{fontspec} % Šrifto pasirinkimui
\setmainfont[
    Ligatures=TeX,
    Extension=.otf,
    UprightFont= *-regular,
    BoldFont=*-bold,
    ItalicFont=*-italic,
    BoldItalicFont=*-bolditalic
]{texgyretermes}  % Teksto  šrifatas bus Nimbus Roman No9 L, kuris yra
                  % atviras Times New Roman šrifto atitikmuo
\RequirePackage{setspace} % Intervalas tarp eilučių
\RequirePackage[
    left=3cm,
    top=2cm,
    right=1.5cm,
    bottom=2cm,
    footskip=0.6cm,
]{geometry}  % Lapo paraštės
\sloppy  % Tolygiai paskirsto tekstą nuo kairės iki dešinės paraštės
\RequirePackage[titles]{tocloft} % Turinio eilučių išlygiavimo nustatymui
\RequirePackage{fancyhdr} % Puslapio numerio vietos nustatymui
\pagestyle{fancy}

% Nustatoma puslapio numerio vieta puslapyje
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\lhead{}
\chead{}
\rhead{}
\lfoot{}
\cfoot{}
\rfoot{\thepage} % Numeris bus puslapio apačioje dešinėje

% Nerodyti įspėjimo dėl pakeistos article klasės antraščių stiliaus
\RequirePackage{silence}
\WarningFilter{caption}{Unsupported document class}

% Po lentelės antraštės prefiksu bus dedamas taškas
\RequirePackage{caption}
\captionsetup*[table]{labelsep=period}
\captionsetup*[figure]{labelsep=period, name=pav}

% Informacijos tituliniame puslapyje kintamieji
\newcommand{\university}[1]{\def\@university{#1}}
\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\papertype}[1]{\def\@papertype{#1}}
\newcommand{\department}[1]{\def\@department{#1}}
\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\newcommand{\reviewer}[1]{\def\@reviewer{#1}}
\newcommand{\reviewerstatus}[1]{\def\@reviewerstatus{#1}}
\newcommand{\status}[1]{\def\@status{#1}}
%\newcommand{\titleineng}[1]{\def\@titleineng{#1}}
\newcommand{\secondauthor}[1]{\def\@secondauthor{#1}}
\newcommand{\company}[1]{\def\@company{#1}}
% THIS IS MY NEWLY DEFINED COMMAND
\newcommand\tline[2] {$\underset{\text{#1}}{\text{\underline{\hspace{#2}}}}$}

%THIS ONE
\newcommand\tabove[2] {$\overset{\text{#1}}{\text{\underline{\hspace{#2}}}}$}


% Pirmos eilutės paragrafe atitraukimas 1 cm
\setlength{\parindent}{1cm}

% Nustatomas bibliografijos stilius
\RequirePackage[
    alldates=iso8601,
    autolang=other,
    backend=biber,
    sortcites=true,
    style=trad-alpha,
    abbreviate=true,
    minalphanames=3,
    maxalphanames=3,
    maxnames=9,
    minnames=4,
]{biblatex}
\RequirePackage[style=lithuanian]{csquotes}
\RequirePackage{amsmath}

% Pliuso ženklas, kuris rodomas esant >3 autoriams, sumažinamas ir pakeliamas
\renewcommand*{\labelalphaothers}{\textsuperscript{+}}

% -------------------------------
% Titulinio puslapio formatavimas
% -------------------------------
\newcommand{\@signatureplace}{%
    \parbox[t]{2.5cm}{%
        \makebox[2.5cm]{\raisebox{-0.5ex}{\scriptsize
        (para\v{s}as) }}}
}

\newcommand{\checkifdefined}[2]{%
    % Patikriname, ar visa reikalinga informacija tituliniam puslapiui
    % buvo nurodyta. #1 yra tikrinama reikšmė (be \ priekyje),
    % #2 - klaidos pranešimas.
    \@ifundefined{#1}{\PackageError{VUMIF}{#2}{Add the missing command}}%
}

\renewcommand\maketitle{\begin{titlepage}%
  \checkifdefined{@department}%
    {Tituliniame puslapyje nenurodyta katedra (komanda \protect\department)}
  \checkifdefined{@supervisor}%
    {Tituliniame puslapyje nenurodytas darbo vadovas (komanda \protect\supervisor)}
   ~
  \begin{center}
      {\setstretch{1.3}\large \MakeUppercase{\@university} \\
          \MakeUppercase{\@faculty} \\
         \MakeUppercase{\@department}\par }

     \null\vfil
     \vskip 2.5cm
     {\singlespacing \LARGE \MakeUppercase{\@title} \par}
%     {\singlespacing \Large \textbf{\@titleineng} \par}%
     \vskip 0.8cm
%     {\large \@papertype}
  \end{center}
  \@ifundefined{@secondauthor}{
     \vskip 1cm
  \begin{center}
      \singlespacing
      {\begin{tabular}[t]{l l}%
           & \medskip \null\hfill  Praktiką atliko: \hspace{3 mm} \tabove {\normalsize {Maksim Prokofjev}}{4.75in}  \\
           \vspace{1cm}
           & \medskip \null\hfill \hspace{3.1cm} \tabove {\normalsize {Programų sistemos, bakalauras, IV kursas}}{4.75in} \\

           & \medskip \null\hfill Praktikos institucija:\hspace{3 mm} \tabove {\normalsize {UAB „INVENTI“}}{4.5in} \\
           & \medskip \null\hfill Organizacijos praktikos vadovas:\hspace{3 mm} \tabove {\normalsize {Projektų vadovė Kristina Šaulinskienė}}{3.7in} \\
           & \medskip \null\hfill Organizacijos praktikos vadovo įvertinimas:\hspace{3 mm} \tabove {\normalsize {}}{2.95in} \\
           & \medskip \null\hfill Universiteto praktikos vadovas:\hspace{3 mm} \tabove {\normalsize {Lekt. Gediminas Rimša}}{3.8in} \\

           & \medskip \null\hfill \hspace{9cm} \tabove {\normalsize {}}{2.5in} \\[0.5in]

           & \medskip \null\hfill \hspace{6cm} \small{Ataskaitos įteikimo data} \hspace{3 mm} \tabove {\small {}}{2in}  \\
           & \medskip \null\hfill \hspace{6cm} \small{Registracijos Nr.} \hspace{3 mm} \tabove {\small {}}{2.4in}  \\
           & \medskip \null\hfill \hspace{7cm} \small{Įvertinimas} \hspace{3 mm} \tabove {\small {}}{2.4in}  \\


      \end{tabular} \par}%
  \end{center}
     \vskip 4cm
   }{
     \vskip 2.8cm
     \begin{flushright}
        \large
        \singlespacing
        {\begin{tabular}[t]{l l l}%
        \medskip Praktiką atliko: &\; \@status \\
        \bigskip   &\; \@author \hfill &\@signatureplace \\
        \bigskip   &\; \@company \hfill &\@signatureplace \\
        \medskip\bigskip &\; \@secondauthor \hfill &\@signatureplace \\
        \bigskip Universiteto praktikos vadovas: &\; \@supervisor \hfill &\@signatureplace \\
        Įmonės praktikos vadovė: &\; \@reviewer \hfill &\@signatureplace
        \end{tabular} \par}%
     \end{flushright}
     \vskip 3.8cm
   }

  \begin{center}
    {\singlespacing \@date \par}%
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  % Atlaisviname panaudotus kintamuosius
  \global\let\@outputtitle\relax
  \global\let\thanks\relax
%  \global\let\maketitle\relax
  \global\let\@papertype\@empty
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@company\@empty
  \global\let\@reviewerstatus\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\@university\@empty
  \global\let\@faculty\@empty
  \global\let\@department\@empty
  \global\let\@papertype\@empty
  \global\let\@supervisor\@empty
  \global\let\@reviewer\@empty
%  \global\let\title\relax
  \global\let\author\relax
  \global\let\company\relax
  \global\let\reviewerstatus\relax
  \global\let\date\relax
  \global\let\and\relax
  \global\let\department\relax
  \global\let\supervisor\relax
  \global\let\@signatureplace\relax
  \global\let\checkifdefined\relax
  \setcounter{footnote}{0}%
  % Nustatome dokumentui 1,5 eilutės intervalą
  \onehalfspacing
}

% Skyriaus pavadinimas, turinyje neturintis numerio
\newcommand{\sectionnonum}[1]{%
    \section*{#1}%
    \addcontentsline{toc}{section}{#1}%
}

% Skyriaus pavadinimas, turinyje neturintis numerio
\newcommand{\subsectionnonum}[1]{%
\subsection*{#1}%
\addcontentsline{toc}{subsection}{#1}%
}

\renewcommand\tableofcontents{%
    % Turinys su viengubu intervalu tarp eilučių
    \begin{singlespacing}%
        \section*{\bf\normalsize\centering\MakeUppercase\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
    \@starttoc{toc}%
    \end{singlespacing}%
    \newpage%
    }

% Tarpai tarp taškų turinyje
\renewcommand{\@dotsep}{1}

% Pakeitimai sekcijos eilutėms turinyje:
% 1. Turinyje turi taškai bėgti ir iki sekcijų
% 2. Nėra vertikalaus tarpo prieš sekcijos turinio eilutę
% 3. Ne pusstoris, o paprastas šriftas
\renewcommand\l@section[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty\@secpenalty
    \addvspace{0.6em \@plus\p@}
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode {
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      % Uppercasing first level titles
      \MakeUppercase{#1}}\nobreak\
      \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}
     \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
    \endgroup
  \fi}


% Sekcija pradeda naują puslapį
\renewcommand{\section}{%
    \cleardoublepage%
    \@startsection {section}{1}{\z@}%
        {-3.5ex \@plus -1ex \@minus -.2ex}%
        {2.3ex \@plus.2ex}%
        {\normalfont\Large\bfseries}%
}

% Priedo sekcijų formatavimas turiniui
\renewcommand{\appendix}{%
    \renewcommand{\section}{%
        \cleardoublepage%
         \secdef\@Appendix\@sAppendix%
    }%
    \setcounter{section}{0}%
    \renewcommand{\thesection}{nr. \arabic{section}}%
    % Insert record to TOC
    \addcontentsline{toc}{section}{\MakeUppercase{Priedai}}%}
}

\def\@Appendix[#1]#2{%
    \refstepcounter{section}%
    \addcontentsline{toc}{subsection}%
        {\arabic{section} priedas.~#2}%
    {\large\bfseries\appendixname\ \thesection\par
     #2\par}% \nohyphens\centering#2\par}%
    \sectionmark{#1}\vspace{\baselineskip}%
    \footnotesize%
}

\def\@sAppendix#1{%
    {\flushright\large\bfseries\appendixname\par
     \centering#1\par}% \nohyphens\centering#1\par}%
    \vspace{\baselineskip}%
    \footnotesize
}

% Literatūros sąrašą reikia pervadinti
\addto\captionslithuanian{%
    \renewcommand{\refname}{\v{S}altiniai}%
}

% Apibrėžiame ketvirto lygio skyrius
\newcommand{\subsubsubsection}{\subsubparagraph}

\makeatletter
\renewcommand\subsubsubsection{\@startsection{paragraph}{4}{0ex}{-3.25ex plus -1ex minus
-0.2ex}{1.5ex plus 0.2ex}{\normalfont\normalsize\bfseries}}
\makeatother

\stepcounter{secnumdepth}
\stepcounter{tocdepth}
\renewcommand{\paragraph}{\subparagraph}

% Turinio skyrių indentavimo nustatymas. Kiekvienam skyriui nustatoma:
% 1. Atitraukimo iš kairės plotis
% 2. Vietos, skiriama skaičiams, plotis
\makeatletter
  \renewcommand*\l@subsection{\@dottedtocline{2}{0.1cm}{0.87cm}}
  \renewcommand*\l@subsubsection{\@dottedtocline{3}{0.8cm}{1.22cm}}
  \renewcommand*\l@paragraph{\@dottedtocline{4}{1.5cm}{1.52cm}}
\makeatother

% Raktinių žodžių komandos
\newcommand\keywords[1]{%
    \par \bigskip \par
    % \hangindent=\parindent   % Lygiavimas nuo antros eilutės
    \noindent \textbf{Keywords:}\; \textbf{#1}
}
\newcommand\raktiniaizodziai[1]{%
    \par \bigskip \par
    % \hangindent=\parindent   % Lygiavimas nuo antros eilutės
    \noindent \textbf{Raktiniai žodžiai:}\; \textbf{#1}
}

% Tarpai tarp išnašų eilučių nustatomi į 1.5 eilutės
\let\oldfootnote\footnote
\renewcommand{\footnote}[1]{\oldfootnote{\onehalfspacing #1}}
