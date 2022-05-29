<h2><img src="./template/logo.png" width=70>Шаблон для оформления письменных работ СПбГЭУ</h2>

Пример использования данного шаблона рассмотрен в ветке [`example` →](https://github.com/endygamedev/docs/tree/example).

<details open>
  <summary><h3>Содержание</h3></summary>
  <a id="toc"></a>
  <ol>
    <li><b><a href="#dependencies">Зависимости</a></b></li>
    <li><b><a href="#install">Установка</a></b></li>
    <li><b><a href="#biblio">Библиография</a></b></li>
    <li><b><a href="#compile">Компиляция</a></b></li>
    <li><b><a href="#todo">TODO</a></b></li>
  </ol>
</details>


<h3><a href="#toc" id="dependencies">Зависимости</a></h3>

1. XeTeX — движок;
1. Biblatex — оформление библиографии.

<h3><a href="#toc" id="install">Установка</a></h3>

Для того чтобы подключить шаблон, нужно переместить все файлы из папки `template` в папку с рабочим `.tex`-файлом и в самом начале указать следующие параметры документа:

```tex
\documentclass{spbseu}
\usepackage{title}
...
```
Для титульного листа стоит заполнить следующий параметры:
```tex
...
% Заполнение данных
\type{Тип работы}               % тип работы (реферат, курсовая работа, ВКР, ...)
\discip{Дисциплина}             % наименование дисциплины
\topic{Тема}                    % наименование темы работы
\student{ФИО студента}          % ФИО студента
\group{Группа}                  % группа
\supervisor{ФИО преподавателя}  % ФИО преподавателя
\svposition{Должность}          % должность преподавателя
...
```

<h3><a href="#toc" id="biblio">Библиография</a></h3>

Для библиографии используется движок `biber` (`BibLaTeX`). Все источники стоит записывать в файле с расширением `.bib` в специальном формате. Сам файл нужно расположить в той же директории что и `.tex`-файл.

[Документация по `BibLaTeX` →](https://www.overleaf.com/learn/latex/Bibliography_management_with_biblatex)

Пример формата `.bib`:
```tex
...
@book { Lezhnev,
    author      = {А.В. Лежнёв},
    title       = {{Динамическое программирование в экономических задачах}},
    year        = {2010},
    address     = {Москва},
    publisher   = {Бином},
    pages       = {176}
}
...
```

<h3><a href="#toc" id="compile">Компиляция</a></h3>

```bash
$ xelatex -interaction=nonstopmode <filename>.tex     # Компилируем файл
$ biber <filename>                                    # Создаём библиографический список понятный для TeX
$ xelatex -interaction=nonstopmode <filename>.tex     # Компилируем файл снова
```

<h3><a href="#toc" id="todo">TODO</a></h3>

- [ ] Некритическая ошибка во время компиляции файла при использовании `\tableofcontents`: `"Missing } inserted."`.
- [ ] Большие вертикальные отступы до и после использования формул. Это можно исправить дописав `\setlength{\abovedisplayskip}{1.5mm}` и `\setlength{\belowdisplayskip}{1.5mm}`, но нужно чтобы это работало в `spbseu.cls`.
- [ ] Нет отступа у первого абзаца в секции, неработает `\usepackage{indentfirst}`.
- [ ] Сортировка в списке литературы.
- [ ] Отчества в списке литературы.
