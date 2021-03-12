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

    # tracemem for the named dataframe
    memtrace_df <- tracemem(get(from_df))

    # if the list already exists, is the current dataframe included
    if (memtrace_df %in% queryjlr_env$mem_list) {

        # If the current dataframe is in the memtrace list,
        # just execute the query. Fast!!
        JuliaCall::julia_call("queryjl",
                              get(paste0(from_df, "_julia_object"),
                              envir = queryjlr_env))

    } else {

        # if the current dataframe isn't in the list, add it
        queryjlr_env$mem_list[[paste(from_df)]] <- memtrace_df

        # setup the Julia object conversion
        julia_object <- JuliaCall::JuliaObject(get(from_df))

        # assign the Julia object back to the queryjlr environment
        assign(paste0(from_df, "_julia_object"),
               julia_object,
               envir = queryjlr_env)

        # register the Julia function call
        JuliaCall::julia_command(paste0("
        function queryjl(", from_df, ")",
        query_trim,
        " end"))

        # Execute the query
        JuliaCall::julia_call("queryjl", julia_object)

    }

}