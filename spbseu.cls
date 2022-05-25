\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{spbseu}

\LoadClass[a4paper, 14pt]{extarticle}

\usepackage{silence}
\WarningsOff*

% Шрифт Times New Roman
\usepackage{fontspec}
\usepackage{microtype}
\microtypesetup{protrusion=false}
\defaultfontfeatures{Mapping=tex-text}
\usepackage{polyglossia}
\setmainlanguage{russian}
\newfontfamily\cyrillicfont{Times New Roman}
\setmainfont[Ligatures=TeX]{Times New Roman}


\usepackage[russian]{babel}   % настройка языка
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
\titlespacing*{\section}{\parskip}{\parskip}{6pt}

% Красная строка для subsection
\titlespacing*{\subsection}{\parindent}{6pt}{\parskip}
\titlespacing*{\subsubsection}{\parindent}{6pt}{\parskip}

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
\usepackage[
backend=biber,          % Движок
bibencoding=utf8,       % Кодировка bib файла
sorting=ntvy,           % Настройка сортировки списка литературы
style=gost-numeric,     % Стиль цитирования и библиографии (по ГОСТ)
language=autobib,       % Получение языка из babel/polyglossia, default: autobib % если ставить autocite или auto, то цитаты в тексте с указанием страницы, получат указание страницы на языке оригинала
autolang=other,         % Многоязычная библиография
clearlang=true,         % Внутренний сброс поля language, если он совпадает с языком из babel/polyglossia
defernumbers=true,      % Нумерация проставляется после двух компиляций, зато позволяет выцеплять библиографию по ключевым словам и нумеровать не из большего списка
sortcites=true,         % Сортировать номера затекстовых ссылок при цитировании (если в квадратных скобках несколько ссылок, то отображаться будут отсортированно, а не абы как)
doi=false,              % Показывать или нет ссылки на DOI
isbn=false,             % Показывать или нет ISBN, ISSN, ISRN
]{biblatex}[2016/09/17]
\toggletrue{bbx:gostbibliography}               % Включает библиографический список
\renewcommand{\mkgostheading}[1]{#1}            % Исправляет наклонные имена авторов
\renewcommand\multicitedelim{\addcomma\space}   % Запятая между ссылками


% Модификация bib файла перед тем, как им займётся biblatex
\DeclareSourcemap{
    \maps{
        \map{ % перекидываем значения полей language в поля langid, которыми пользуется biblatex
            \step[fieldsource=language, fieldset=langid, origfieldval, final]
            \step[fieldset=language, null]
        }
        \map{ % перекидываем значения полей numpages в поля pagetotal, которыми пользуется biblatex
            \step[fieldsource=numpages, fieldset=pagetotal, origfieldval, final]
            \step[fieldset=numpages, null]
        }
        \map{ % перекидываем значения полей pagestotal в поля pagetotal, которыми пользуется biblatex
            \step[fieldsource=pagestotal, fieldset=pagetotal, origfieldval, final]
            \step[fieldset=pagestotal, null]
        }
        \map[overwrite]{ % перекидываем значения полей shortjournal, если они есть, в поля journal, которыми пользуется biblatex
            \step[fieldsource=shortjournal, final]
            \step[fieldset=journal, origfieldval]
            \step[fieldset=shortjournal, null]
        }
        \map[overwrite]{ % перекидываем значения полей shortbooktitle, если они есть, в поля booktitle, которыми пользуется biblatex
            \step[fieldsource=shortbooktitle, final]
            \step[fieldset=booktitle, origfieldval]
            \step[fieldset=shortbooktitle, null]
        }
        \map{ % если в поле medium написано "Электронный ресурс", то устанавливаем поле media, которым пользуется biblatex, в значение eresource.
            \step[fieldsource=medium,
            match=\regexp{Электронный\s+ресурс},
            final]
            \step[fieldset=media, fieldvalue=eresource]
            \step[fieldset=medium, null]
        }
        % \map{% использование media=text по умолчанию
        %     \step[fieldset=media, fieldvalue=text]
        % }
        \map[overwrite]{ % стираем значения всех полей issn
            \step[fieldset=issn, null]
        }
        \map[overwrite]{ % стираем значения всех полей abstract, поскольку ими не пользуемся, а там бывают "неприятные" латеху символы
            \step[fieldsource=abstract]
            \step[fieldset=abstract,null]
        }
        \map[overwrite]{ % переделка формата записи даты
            \step[fieldsource=urldate,
            match=\regexp{([0-9]{2})\.([0-9]{2})\.([0-9]{4})},
            replace={$3-$2-$1$4}, % $4 вставлен исключительно ради нормальной работы программ подсветки синтаксиса, которые некорректно обрабатывают $ в таких конструкциях
            final]
        }
        \map[overwrite]{ % стираем ключевые слова
            \step[fieldsource=keywords]
            \step[fieldset=keywords,null]
        }
        % реализация foreach различается для biblatex v3.12 и v3.13.
        % Для версии v3.13 эта конструкция заменяет последующие 5 структур map
        % \map[overwrite,foreach={authorvak,authorscopus,authorwos,authorconf,authorother}]{ % записываем информацию о типе публикации в ключевые слова
        %     \step[fieldsource=$MAPLOOP,final=true]
        %     \step[fieldset=keywords,fieldvalue={,biblio$MAPLOOP},append=true]
        % }
        \map[overwrite]{ % записываем информацию о типе публикации в ключевые слова
            \step[fieldsource=authorvak,final=true]
            \step[fieldset=keywords,fieldvalue={,biblioauthorvak},append=true]
        }
        \map[overwrite]{ % записываем информацию о типе публикации в ключевые слова
            \step[fieldsource=authorscopus,final=true]
            \step[fieldset=keywords,fieldvalue={,biblioauthorscopus},append=true]
        }
        \map[overwrite]{ % записываем информацию о типе публикации в ключевые слова
            \step[fieldsource=authorwos,final=true]
            \step[fieldset=keywords,fieldvalue={,biblioauthorwos},append=true]
        }
        \map[overwrite]{ % записываем информацию о типе публикации в ключевые слова
            \step[fieldsource=authorconf,final=true]
            \step[fieldset=keywords,fieldvalue={,biblioauthorconf},append=true]
        }
        \map[overwrite]{ % записываем информацию о типе публикации в ключевые слова
            \step[fieldsource=authorother,final=true]
            \step[fieldset=keywords,fieldvalue={,biblioauthorother},append=true]
        }
        \map[overwrite]{ % добавляем ключевые слова, чтобы различать источники
            \perdatasource{biblio/external.bib}
            \step[fieldset=keywords, fieldvalue={,biblioexternal},append=true]
        }
        \map[overwrite]{ % добавляем ключевые слова, чтобы различать источники
            \perdatasource{biblio/author.bib}
            \step[fieldset=keywords, fieldvalue={,biblioauthor},append=true]
        }
        \map[overwrite]{ % добавляем ключевые слова, чтобы различать источники
            \step[fieldset=keywords, fieldvalue={,bibliofull},append=true]
        }
%        \map[overwrite]{ % стираем значения всех полей series
%            \step[fieldset=series, null]
%        }
        \map[overwrite]{ % перекидываем значения полей howpublished в поля organization для типа online
            \step[typesource=online, typetarget=online, final]
            \step[fieldsource=howpublished, fieldset=organization, origfieldval]
            \step[fieldset=howpublished, null]
        }
    }
}


\DeclareSourcemap{
  \maps[datatype=bibtex]{
    \map{
      \step[fieldset=langid, fieldvalue={tempruorder}]
    }
    \map[overwrite]{
      \step[fieldsource=langid, match=russian, final]
      \step[fieldsource=presort, 
        match=\regexp{(.+)}, 
        replace=\regexp{aa$1}]
    }
    \map{
      \step[fieldsource=langid, match=russian, final]
      \step[fieldset=presort, fieldvalue={az}]
    }
    \map[overwrite]{
      \step[fieldsource=langid, notmatch=russian, final]
      \step[fieldsource=presort, 
        match=\regexp{(.+)}, 
        replace=\regexp{za$1}]
    }
    \map{
      \step[fieldsource=langid, notmatch=russian, final]
      \step[fieldset=presort, fieldvalue={zz}]
    }
    \map{
      \step[fieldsource=langid, match={tempruorder}, final]
      \step[fieldset=langid, null]
    }
  }
}

\renewcommand\indent{\hspace{1.25cm}}
