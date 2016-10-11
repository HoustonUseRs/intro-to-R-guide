
Use [bookdown](https://bookdown.org/yihui/bookdown/) to render this book locally.

```
bookdown::render_book('index.Rmd', 'bookdown::gitbook')
```

You can then view it by running a static server in `_book`.

You can also run

```
bookdown::serve_book()
```

which will nicely rebuild as you update content, but crashes in RStudio < 1.0.

The [gh-pages version](https://houstonusers.github.io/intro-to-R-guide/) of this book will update automatically when master is updated.