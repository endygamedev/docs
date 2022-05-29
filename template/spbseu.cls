% TODO:
%   1. Некритичекая ошибка при использовании `\tableofcontents`: Missing } inserted.
%   2. Большие пробелы до и после формул.
%   3. Нет отступа у первого абзаца в секции.
%   4. Сортировка в списке литературы.
%   5. Отчества в списке литературы.


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{spbseu}

\LoadClass[a4paper, 14pt]{extarticle}


% Шрифт Times New Roman
\usepackage{fontspec}
\usepackage{microtype}
\microtypesetup{protrusion=false}
\defaultfontfeatures{Mapping=tex-text}
\usepackage{polyglossia}
\setmainlanguage{russian}
\setmainfont[Ligatures=TeX]{Times New Roman}
\newfontfamily\cyrillicfont{Times New Roman}

\usepackage{csquotes}                       % цитирование
\usepackage{url}                            % перенос ссылок

\usepackage[left=3cm, right=1cm, top=2cm, bottom=2cm, nohead]{geometry} % отступы страницы
\usepackage[unicode]{hyperref}
\usepackage{import}         % разделение документа на части

\usepackage{indentfirst}    % красная строка после заголовка
\usepackage{amsmath}        % математические формулы
\usepackage{amssymb}        % математические символы
\usepackage{graphicx}       % вставка картинок
\usepackage{setspace}       % команды для найстройки отступов

\usepackage{totcount}       % счётчик страниц, рисунков и таблиц

% Команда для нормы
\newcommand{\norm}[1]{\left\lVert#1\right\rVert}


\numberwithin{equation}{section}    % нумерция формул


% Задание отступов
\renewcommand{\baselinestretch}{1.5}
\setlength{\baselineskip}{14pt}
\linespread{1.6}
\setlength{\parindent}{1.25cm}
\setlength{\parskip}{0em}
\setlength{\belowcaptionskip}{-14pt}    % убрать отступ у картинок
\emergencystretch=1em

% Шрифт в section и центрирование
\usepackage{titlesec}
\titlelabel{\thetitle. }
\titleformat{\section}[block]{\bfseries\filcenter}{\thetitle.}{14pt}{}
\titleformat{\subsection}[runin]{\bfseries}{\thesubsection.}{14pt}{}[{\\}]
\titlespacing*{\subsection}{\parindent}{7pt}{\parindent}
\titleformat{\subsubsection}[block]{\bfseries}{\thetitle.}{14pt}{}

% Заглавные буквы section
\usepackage{xparse}

\ExplSyntaxOn
\let\oldsection\section
\RenewDocumentCommand{\section}{ s o m }{
    \tl_set:Nx\section_upper{\cs_if_exist:NTF{\text_uppercase:n}
        {\text_uppercase:n{#3}}{\tl_upper_case:n{#3}}}
    \IfBooleanTF{#1}
        {\oldsection*{\section_upper}}
        {\IfNoValueTF{#2}
            {\oldsection{\section_upper}}
            {\oldsection[#2]{\section_upper}}}}
\ExplSyntaxOff

\makeatletter
\let\@oldcontentsline\contentsline
\def\contentsline#1#2{%
    \expandafter\ifx\csname l@#1\endcsname\l@section
        \expandafter\@firstoftwo
    \else
        \expandafter\@secondoftwo
    \fi
    {\@oldcontentsline{#1}{\MakeUppercase{#2}}}%
    {\@oldcontentsline{#1}{#2}}%
}
\makeatother

% Исправление форматирования разделов
\titlespacing*{\section}{\parskip}{\parskip}{\parskip}

% Красная строка для subsection
\titlespacing*{\subsection}{\parindent}{\parskip}{\parskip}
\titlespacing*{\subsubsection}{\parindent}{\parskip}{\parskip}

% Настройка содержания
\usepackage[toc, page]{}
\usepackage{tocloft}

% Шрифт заголовока содержания
\renewcommand{\cfttoctitlefont}{\hfill\bfseries\fontsize{14}{14}\selectfont\uppercase}
\renewcommand{\cftaftertoctitle}{\hfill\hfill}

% Шрифт и точки section
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsecfont}{\fontsize{14pt}{0pt}\selectfont}
\renewcommand{\cftdot}{}
\renewcommand{\cftsecpagefont}{}
\setlength{\cftbeforesecskip}{14pt}

% Шрифт и точки subsection
\renewcommand{\cftsubsecfont}{\fontsize{14pt}{0pt}\selectfont}
\setlength{\cftbeforesubsecskip}{4pt}
\renewcommand{\cftsubsecaftersnum}{.}
\setlength{\cftsubsecindent}{0pt}

% Subsubsection
\renewcommand{\cftsubsubsecaftersnum}{.}
\renewcommand{\cftsubsubsecfont}{\fontsize{14pt}{0pt}\selectfont}
\setlength{\cftbeforesubsubsecskip}{4pt}
\setlength{\cftsubsubsecindent}{0pt}

% Добавить список литературы в содержание
\usepackage[nottoc]{tocbibind}

\newenvironment{itemize*}%
  {\begin{itemize}[itemindent=\parindent, leftmargin=0cm, labelsep = 0.5cm]%
    \setlength{\itemsep}{0pt}%
    \setlength{\parskip}{0pt}
  }%
{\end{itemize}}

\newenvironment{enumerate*}%
  {\begin{enumerate}[itemindent=0pt,
                      leftmargin=0cm, 
                      labelsep = 0.5cm]%
    \setlength{\itemsep}{4pt}%
    \setlength{\parskip}{0pt}
  }%
{\end{enumerate}}

\usepackage[ampersand]{easylist}
\newenvironment{itez}
   {\begin{easylist}
    \ListProperties(Start1=1, Hang=false,  FinalSpace=1em, Indent=1.25cm)
   }%
  {\end{easylist}}

\newenvironment{itemz}
   {\begin{easylist}
    \ListProperties(Hide=100, Hang=false, Style*=--, FinalSpace=2cm, Indent=1.25cm)
   }%
  {\NewList \end{easylist}}

\usepackage{enumitem}
\setlist{nolistsep} 

% Убрать дополнительные вертикальные отступы вокруг списков
\usepackage{enumitem}
\setlist{nolistsep}

% Изменение стандартных значков \item на -
\renewcommand\labelitemi{-}

% Отступ списка
\setlength{\leftmargini}{1.8cm}

\usepackage{tikz}

% Подпись рисунков
% Центрирование подписей к рисункам
\usepackage[labelsep=endash]{caption}
\captionsetup[figure]{name={Рисунок}}
\captionsetup[table]{singlelinecheck=false}
\captionsetup[figure]{justification=centering}

% Большие ячейки в таблицах 
\usepackage{multirow}

% Настройка списка литературы
\bibliographystyle{gost-numeric.bbx}
\usepackage[parentracker=true,
            backend=biber,          % Движок
            hyperref=false,         % Ссылки
            bibencoding=utf8,       % Кодировка
            style=numeric-comp,     % Нумерация
            language=auto,          % Язык
            autolang=other,         % Язык (2)
            citestyle=gost-numeric, % Стиль ссылок
            defernumbers=false,     % Нумерация (2)
            bibstyle=gost-numeric,  % Стиль библиографии
            sorting=none,           % Сортировка (nvyt)
]{biblatex}

% Отступы для первого абзаца
\renewcommand\indent{\hspace{1.25cm}}

% Для листингов кода
\usepackage{listings, listings-rust}
\usepackage{color}

\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

\lstset{frame=tb,
  aboveskip=3mm,
  belowskip=3mm,
  showstringspaces=false,
  columns=flexible,
  basicstyle={\small\ttfamily},
  numbers=none,
  numberstyle=\tiny\color{gray},
  keywordstyle=\color{blue},
  commentstyle=\color{dkgreen},
  stringstyle=\color{mauve},
  breaklines=true,
  breakatwhitespace=true,
  tabsize=3
}
