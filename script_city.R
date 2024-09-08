# Load the necessary R file with the functions
source("weather.R")

# Set the desired city
city <- "Sao Paulo,BR"

# Call the function weather_city() to get the weather forecast with the new city
result <- weather_city(city)

if (result$cod == 200) {
  descricao <- result$weather.description
  temperatura <- result$main.temp
  sensacao_termica <- result$main.feels_like
  umidade <- result$main.humidity
  vento <- result$wind.speed

  # Display the weather forecast
  cat("Previsão do tempo para", city, ":\n")
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