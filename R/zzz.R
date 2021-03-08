
.onLoad <- function(libname, pkgname) {

    JuliaCall::julia_install_package_if_needed("Query")
    JuliaCall::julia_install_package_if_needed("DataFrames")
    JuliaCall::julia_library("Query")
    JuliaCall::julia_library("DataFrames")

    }