# Load the necessary R file with the functions
source("weather.R")

# Desired location #2
lat <- -23.5489
lon <- -46.6388

# Call the function weather_geo() to get the weather forecast with the new coordinates
result <- weather_geo(lat, lon)

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

cat("-----------------------------\n")

# Desired location #2
lat <- 37.42159
lon <- -122.08374

# Call the function weather_geo() to get the weather forecast with the new coordinates
result <- weather_geo(lat, lon)

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