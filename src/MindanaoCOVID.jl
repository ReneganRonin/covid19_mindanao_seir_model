module MindanaoCOVID


# Packages
using CSV
using DataFrames 
using Dates
using StochasticDiffEq
import Downloads: download as dl
# Exports
export download_datasets
# Includes
include("constants.jl")
include("main.jl")
#include("utils/extract_ph.jl")
#include("utils/cleaners.jl")

"""
    download_datasets()

Downloads the datasets from https://github.com/CSSEGISandData/COVID-19 and stores them in the folder `datasets`
"""
function download_datasets()
    time_downloaded = Dates.format(Dates.now(), "MdY")
    dataset_path = "dataset/$(time_downloaded)"
    @info "Downloading datasets at $time_downloaded"
    dl(CONFIRMED_CASES_DATASET, dataset_path * "confirmed_cases.csv"; verbose=true)
    @info "Downloaded global confirmed cases"
    dl(DEATHS_GLOBAL_DATASET, dataset_path * "deaths_global.csv"; verbose=true)
    @info "Downloaded global deaths"
    dl(RECOVERED_GLOBAL_DATASET, dataset_path * "recovered_global.csv"; verbose=true)
    @info "Downloaded global recovered"
end

end
# module end
