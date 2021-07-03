# COVID19 Datasets are obtained from https://github.com/CSSEGISandData/COVID-19
# These datasets are timeseries of COVID19 confirmed cases, deaths, and recoveries.
# All are in CSV file formats

const CONFIRMED_CASES_DATASET = "https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"

const DEATHS_GLOBAL_DATASET = "https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"

const RECOVERED_GLOBAL_DATASET = "https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv"

# Country to plot
const PH = "Philippines"


const TIME_DL = Dates.format(Dates.now(), "MdY")
const DATASET_PATH = "dataset/$(TIME_DL)"
const DL_CONFIRMED_CASES = "$(DATASET_PATH)_confirmed_cases.csv"
const DL_DEATHS = "$(DATASET_PATH)_deaths_global.csv"
const DL_RECOVERED = "$(DATASET_PATH)_recovered_global.csv"
