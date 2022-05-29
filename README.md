<h2><img src="./template/logo.png" width=70>Пример использования шаблона</h2>

<h3>Иерархия репозитория</h3>

В папке `example` содержится пример использования данного шаблона в курсовой работе.

```bash
example
├── content               # папка со всеми составляющими работы
│   ├── appendix1.tex
│   ├── appendix2.tex
│   ├── conclusion.tex
│   ├── images
│   ├── intro.tex
│   ├── section1.tex
│   ├── section2.tex
│   └── section3.tex
├── main.tex              # итоговый компилируемый файл, который объединяет всё содержимое
├── Makefile
└── references.bib        # список источников

```

<h3>Make</h3>
<h4>Компиляция</h4>

```bash
$ make
$ biber main
$ make
```

<h4>Очистка</h4>

Сохраняется только PDF-файл
```bash
$ make clean
```

<h4>Полная очистка</h4>

```bash
$ make remove
```
