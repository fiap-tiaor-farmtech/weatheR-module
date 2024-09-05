# Instalar o pacote necessário (se ainda não estiver instalado)
# install.packages("httr")
# install.packages("jsonlite")

# Description: Script principal que chama a função weather_api() para obter a previsão do tempo de uma cidade.
source("weather.R")

# Localidade desejada #1
lat <- -23.5489
lon <- -46.6388

# Faz a requisição à API
result <- weather_geo(lat, lon)

# Extrair as informações relevantes
if (result$cod == 200) {
  cidade <- result$name
  pais <- result$sys$country
  descricao <- result$weather[[1]]$description
  temperatura <- result$main$temp
  sensacao_termica <- result$main$feels_like
  umidade <- result$main$humidity
  vento <- result$wind$speed

  # Exibir a previsão do tempo
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

# Localidade desejada #2
lat <- 37.42159
lon <- -122.08374

# Faz a requisição à API
result <- weather_geo(lat, lon)

# Extrair as informações relevantes
if (result$cod == 200) {
  cidade <- result$name
  pais <- result$sys$country
  descricao <- result$weather[[1]]$description
  temperatura <- result$main$temp
  sensacao_termica <- result$main$feels_like
  umidade <- result$main$humidity
  vento <- result$wind$speed

  # Exibir a previsão do tempo
  cat("Previsão do tempo para", cidade, "-", pais, ":\n")
  cat("Descrição:", descricao, "\n")
  cat("Temperatura:", temperatura, "°C\n")
  cat("Sensação térmica:", sensacao_termica, "°C\n")
  cat("Umidade:", umidade, "%\n")
  cat("Velocidade do vento:", vento, "m/s\n")
} else {
  cat("Cidade não encontrada ou ocorreu um erro na requisição.\n")
}



q()