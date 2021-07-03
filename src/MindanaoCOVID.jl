module MindanaoCOVID

# Packages
using CSV
using DataFrames 
using Dates
using StochasticDiffEq
using Plots
import Downloads: download as dl

# Exports
export download_datasets
export plotter

# Includes
include("constants.jl")
include("main.jl")
include("plots/preliminary_plot.jl")
#include("utils/extract_ph.jl")
#include("utils/cleaners.jl")
"""
    download_datasets()

Downloads the datasets from https://github.com/CSSEGISandData/COVID-19 and stores them in the folder `datasets`
"""
function download_datasets()
    @info "Downloading datasets at $(TIME_DL)"
    dl(CONFIRMED_CASES_DATASET, DL_CONFIRMED_CASES; verbose=true)
    @info "Downloaded global confirmed cases"
    dl(DEATHS_GLOBAL_DATASET, DL_DEATHS; verbose=true)
    @info "Downloaded global deaths"
    dl(RECOVERED_GLOBAL_DATASET, DL_RECOVERED; verbose=true)
    @info "Downloaded global recovered"
end

end
# module end
