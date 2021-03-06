linqr <- function(query) {

    query_trim <- stringi::stri_trim_both(query)
    
    # if there isn't a named dataframe, string queries
    # Extract dataframe name using string splits
    query_split <- stringi::stri_split_fixed(query_trim, "in",
                                         omit_empty = TRUE,
                                         opts_fixed = stringi::stri_opts_fixed(case_insensitive = TRUE))
                                         
    query_split <- trimws(unlist(query_split))
    
    from_df <- stringi::stri_extract_first_words(query_split[2], 
                                                   locale = NULL)

    # setup the JuliaCall command
    JuliaCall::julia_command(paste0("
    function queryjl(", from_df, ")",
    query_trim,
    " end"))

    # setup the Julia object conversion
    julia_object <- JuliaCall::JuliaObject(get(from_df))

    # Execute the query
    julia_call("queryjl", julia_object)

}