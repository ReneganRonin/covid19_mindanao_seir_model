function cleaner(data::AbstractString)
    df = CSV.read(data, DataFrame)
    @info "Selecting regions that are in Mindanao"
    filter!(c -> c.region ∈ MINDANAO, df)
    @info "Removing missing data"
    dropmissing!(df)
    @info "Setting date format to Y-m-d"
    date_format = Dates.DateFormat("Y-m-d")
    @info "Converting String from dataframe to Date"
    s = map(x -> x[1], split.(df.updateddate))
    dates = parse.(Date, s, date_format)
    df_dates = DataFrame(; dates=dates)
    @info "Combining Date objects to the dataframe"
    df = hcat(df_dates, df)
    @info "Sort dates..."
    sort!(df, :dates)
    confs = [:conf_asym, :conf_crit, :conf_died, :conf_mild, :conf_mod, :conf_severe]
    @info "Finalizing dataframe..."
    df = hcat(select(df, :dates), combine(df, confs => ByRow(+) => :confirmed_cases))
    gdf = groupby(df, :dates)
    @info "Done 😁"
    return combine(gdf, :confirmed_cases => sum => :confirmed_cases)
end
