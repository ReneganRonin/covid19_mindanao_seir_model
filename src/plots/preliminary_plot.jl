# function plotter()
# @info "Running preliminary plot"
# df = CSV.read(DL_CONFIRMED_CASES, DataFrame)
# rename!(df, 1 => "province", 2 => "country")
# country = collect(df[:, 2])
# df_row = findfirst(country .== PH)
# df_data_row = df[df_row, :]
# country_data = [t + 1 for t ∈ df_data_row[5:end]]  # to remove zeroes
# date_format = Dates.DateFormat("m/d/Y")
# date_strings = String.(names(CSV.read(DL_CONFIRMED_CASES, DataFrame)))[5:end]
# dates = parse.(Date, date_strings, date_format) + Year(2000)
# plot(dates, country_data, ylabel="Confirmed cases", label=PH, xlabel="Dates", title="Philippines confirmed COVID19-cases (log₁₀)", xticks=dates[1:20:end],xrotation=45, legend=:topleft, yscale=:log10, size=(700, 450))
# savefig("covid19plotPH.png")
# @info "Plot saved"
# end

function create_plot(df::DataFrame; sf::AbstractString="")
    title = "Mindanao COVID19 Daily Case Report as of July 1, 2021"
    xlabel = "Dates"
    ylabel = "Confirmed Cases"
    xrotation = 45
    label = "Number of cases"
    xticks = df.dates[begin:12:end]
    @info "Plotting data..."
    bar(
        df.dates,
        df.confirmed_cases;
        xlabel=xlabel,
        ylabel=ylabel,
        legend=:topright,
        xrotation=xrotation,
        xticks=xticks,
        label=label,
        title=title,
        size=(800,600),
        legendtitlefontsize=10
    )
    savefig("$(sf)preliminary_plot.png")
    @info "Plot saved... exiting"
end

