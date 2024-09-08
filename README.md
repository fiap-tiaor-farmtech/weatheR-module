# Weather Data Integration Project

This project integrates Python with an R script to fetch weather data for a specified city using environment variables.

## Prerequisites

- Python 3.x
- R
- `rpy2` library
- `python-dotenv` library
- `weather.R` script
- OpenWeatherMap API key

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/fiap-tiaor-farmtech/weatheR-module.git
    cd weatheR-module
    ```

2. Install the required Python libraries:
    ```sh
    pip install -r requirements.txt

    ```

3. Ensure R is installed on your system and accessible from the command line.

4. Create a `.env` file in the root directory of the project and add R_HOME environment variable:
    ```sh
    R_HOME=<path-to-R-installation>
    API_KEY=<your-openweathermap-api-key>
    ```

## Usage

1. Ensure the `weather.R` script is in the same directory as `weather.py`.

2. Run the Python script:
    ```sh
    python weather.py
    ```

## Example

When you run the script, it will print the weather data for "Sao Paulo, BR" as fetched by the R script.

## Code

```python
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
```