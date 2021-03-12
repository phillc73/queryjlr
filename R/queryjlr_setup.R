queryjlr_setup <- function(julia_home = NULL) {

    if (!is.null(julia_home)) {
        JULIA_HOME <- julia_home
    }

    JuliaCall::julia_setup(JULIA_HOME=julia_home)

    JuliaCall::julia_install_package_if_needed("Query")
    JuliaCall::julia_install_package_if_needed("DataFrames")
    JuliaCall::julia_library("Query")
    JuliaCall::julia_library("DataFrames")

}