from dotenv import load_dotenv
import os

load_dotenv()

import rpy2.robjects as robjects

# Defining the R script and loading the instance in Python
r = robjects.r
r['source']('weather.R')

# Loading the function we have defined in R.
weather_function_r = robjects.globalenv['weather_city']

#Invoking the R function and getting the result
df_result_r = weather_function_r('Sao Paulo,BR')

print(df_result_r)