# Instalar o pacote necessário (se ainda não estiver instalado)
# install.packages("httr")
# install.packages("jsonlite")

# Carregando bibliotecas
library(httr)
library(jsonlite)

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_URLencode = getFromNamespace("URLencode", "backports")

# Função para fazer requisição à API
call_api <- function(u) {
  data <- try(RETRY("GET", u))

  if (is(data, "try-error")) data <- list(status_code = 404)

  if (data$status_code != 200) {
    stop("Erro ao consultar a API", call. = FALSE)
  }

  return(data)
}

# Chave de acesso à API OpenWeatherMap
api_key <- "0ab1ba6c3616f8bad85d4275978ea1f4"

# URL da API
api_url <- "https://api.openweathermap.org/data/2.5/weather"

# Localidade desejada
city <- "Sao Paulo,BR"

# Montar a URL da API
url <- bp_URLencode(paste0(api_url, "?q=", city, "&appid=", api_key, "&units=metric&lang=pt_br")) # nolint

# Chamar API e converter a resposta em JSON
result <- fromJSON(content(call_api(url), "text"), simplifyVector = FALSE)

# Extrair as informações relevantes
if (result$cod == 200) {
  descricao <- result$weather[[1]]$description
  temperatura <- result$main$temp
  sensacao_termica <- result$main$feels_like
  umidade <- result$main$humidity
  vento <- result$wind$speed

  # Exibir a previsão do tempo
  cat("Previsão do tempo para", city, ":\n")
  cat("Descrição:", descricao, "\n")
  cat("Temperatura:", temperatura, "°C\n")
  cat("Sensação térmica:", sensacao_termica, "°C\n")
  cat("Umidade:", umidade, "%\n")
  cat("Velocidade do vento:", vento, "m/s\n")
} else {
  cat("Cidade não encontrada ou ocorreu um erro na requisição.\n")
}

q()