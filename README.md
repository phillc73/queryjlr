LINQ with R
=======

## Together at last

-----

### Quick Start

Run the following code (which will eventually be automatically executed on package load, or something)

```r
library(JuliaCall)

julia <- julia_setup()

```

If `julia_setup()` fails and refused to find Julia, refer to the [`JuliaCall` documentation](https://github.com/Non-Contradiction/JuliaCall).

Then install the package:

```r
# install.packages("remotes")
library("remotes")
remotes::install_github("phillc73/queryjlr")
library("queryjlr")
```

Both the `Query` and `DataFrames` packages from Julia will be loaded, and installed if not present, during loading of `queryjlr` library.

And try the following:

```r
linqr("@from i in mtcars begin
    @where i.disp > 200
    @select {i.mpg, i.cyl}
    @collect DataFrame
end")
```

For more about writing these types of queries, refer to the [`Query.jl` documentation](https://www.queryverse.org/Query.jl/stable/linqquerycommands/).

Finally, have fun!

