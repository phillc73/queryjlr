LINQ with R
=======

## Together at last

-----

### Quick Start

Install the package:

```r
# install.packages("remotes")
library("remotes")
remotes::install_github("phillc73/queryjlr")
library("queryjlr")
```

Run the setup function:

```r
queryjlr_setup()
```

You will be prompted to enter the full path of the Julia executable on your machine. If this path is incorrect, all else fails.

Both the `Query` and `DataFrames` packages from Julia will be loaded, and installed if not present, during `queryjlr_setup`

Then try the following:

```r
linqr("@from i in mtcars begin
    @where i.disp > 200
    @select {i.mpg, i.cyl}
    @collect DataFrame
end")
```

For more about writing these types of queries, refer to the [`Query.jl` documentation](https://www.queryverse.org/Query.jl/stable/linqquerycommands/).

Finally, have fun!

This package is only possible thanks to:

* Non-Contradiction's [JuliaCall](https://github.com/Non-Contradiction/JuliaCall) R package
* davidanthoff's [Query.jl](https://github.com/Non-Contradiction/JuliaCall) Julia package

