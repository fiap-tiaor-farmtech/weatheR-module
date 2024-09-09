# Install the necessary packages (uncomment the lines bellow
# if you haven't installed them yet)
# install.packages("tidyr")

# Carregar a biblioteca tidyr e dplyr
library(tidyr)

# Load the necessary R file with the functions
source("weather.R")

# Read the CSV file
file_data <- read.table("saida_dados.csv", sep = ";", header = FALSE)

# Convert the data to a wide data frame
data <- file_data %>% spread(key = V1, value = V2)

# Call the function weather_geo() to get the weather forecast
# with the new coordinates
result <- weather_geo(data$latitude, data$longitude)

# Extract the relevant information
if (result$cod == 200) {
  cidade <- result$name
  pais <- result$sys.country
  descricao <- result$weather.description
  temperatura <- result$main.temp
  sensacao_termica <- result$main.feels_like
  umidade <- result$main.humidity
  vento <- result$wind.speed

  # Display the weather forecast
  cat("Previsão do tempo para", cidade, "-", pais, ":\n")
  cat("Descrição:", descricao, "\n")
  cat("Temperatura:", temperatura, "°C\n")
  cat("Sensação térmica:", sensacao_termica, "°C\n")
  cat("Umidade:", umidade, "%\n")
  cat("Velocidade do vento:", vento, "m/s\n")
} else {
  cat("Cidade não encontrada ou ocorreu um erro na requisição.\n")
}

# Quit the R session
q()