from dotenv import load_dotenv
import os

load_dotenv()

import rpy2.robjects as ro
from rpy2.robjects import pandas2ri

# Activate the automatic conversion of R objects to pandas DataFrames
pandas2ri.activate()

# Defining the R script and loading the instance in Python
r = ro.r
r.source('weather.R')

# Loading the function we have defined in R.
weather_function_r = ro.globalenv['weather_city']

# Invoking the R function and getting the result
df_result_r = weather_function_r('Sao Paulo,BR')

# Convert the result to a pandas DataFrame
df_result_py = pandas2ri.rpy2py(df_result_r) 

for index, row in df_result_py.iterrows():
    for column in df_result_py.columns:
        print(f"[{index}], {column}: {row[column]}")