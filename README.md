LINQ with R
=======

## Together at last

-----

### Quick Start

Run the following code (which will eventually be automatically executed on package load, or something)

```r
library(JuliaCall)
library(stringi)

julia <- julia_setup()

julia_library("Query")
julia_library("DataFrames")
```

If `julia_setup()` fails and refused to find Julia, refer to the [`JuliaCall` documentation](https://github.com/Non-Contradiction/JuliaCall).

You will also need both the `Query` and `DataFrames` packages from Julia installed.

Manually load the function found in `linq.R`

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

