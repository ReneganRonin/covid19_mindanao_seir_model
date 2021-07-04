# COVID19 Datasets are obtained from https://github.com/CSSEGISandData/COVID-19
# These datasets are timeseries of COVID19 confirmed cases, deaths, and recoveries.
# All are in CSV file formats

const CONFIRMED_CASES_DATASET = "https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"

const DEATHS_GLOBAL_DATASET = "https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"

const RECOVERED_GLOBAL_DATASET = "https://github.com/CSSEGISandData/COVID-19/raw/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv"

# July 1, 2021
const DAILY_COVID_PH_URL = "https://data.gov.ph/sites/default/files/DOH%20COVID%20Data%20Drop_%2020210701%20-%2005%20DOH%20Data%20Collect%20-%20Daily%20Report.csv"

const WEEKLY_COVID_PH_URL = "https://data.gov.ph/sites/default/files/DOH%20COVID%20Data%20Drop_%2020210701%20-%2006%20DOH%20Data%20Collect%20-%20Weekly%20Report.csv"

# Country to plot
const COUNTRY = "Philippines"

# Main focus to plot
const MINDANAO = ("REGION XIII (CARAGA)", "REGION XII (SOCCSKSA RGEN)", "AUTONOMOUS REGION IN MUSLIM MINDANAO (ARMM)", "REGION XI (DAVAO REGION)", "REGION X (NORTHERN MINDANAO)", "REGION IX (ZAMBOANGA PENINSULA)")


const TIME_DL = Dates.format(Dates.now(), "MdY")
const DATASET_PATH = "dataset/$(TIME_DL)"
const DL_CONFIRMED_CASES = "$(DATASET_PATH)_confirmed_cases.csv"
const DL_DEATHS = "$(DATASET_PATH)_deaths_global.csv"
const DL_RECOVERED = "$(DATASET_PATH)_recovered_global.csv"
const DAILY_PH_COVID = "dataset/20210701_daily_ph_covid_data.csv"
const WEEKLY_PH_COVID = "dataset/20210701_weekly_ph_covid_data.csv"
