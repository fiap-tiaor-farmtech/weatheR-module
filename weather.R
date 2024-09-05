# Instalar o pacote necessário (se ainda não estiver instalado)
# install.packages("httr")
# install.packages("jsonlite")

# Carregando bibliotecas
library(httr)
library(jsonlite)

# get function from namespace instead of possibly getting
# implementation shipped with recent R versions:
bp_URLencode = getFromNamespace("URLencode", "backports")

# Fazer a requisição à API
# response <- GET(url = call)

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

# Localidade desejada (substitua 'Sao Paulo,BR')
city <- "Sao Paulo,BR"

# Montar a URL da API
base_url <- "https://api.openweathermap.org/data/2.5/weather"
url <- bp_URLencode(paste0(base_url, "?q=", city, "&appid=", api_key, "&units=metric&lang=pt_br")) # nolint

response <- call_api(url)

# # Verificar se a requisição foi bem-sucedida
# if (status_code(response) != 200) {
#   stop('Erro ao consultar a API', call. = FALSE)
# }

# Converter a resposta em um objeto R
result <- fromJSON(content(response, "text"), simplifyVector = FALSE)

# Extrair as informações relevantes
if (result$cod == 200) {
  descricao <- result$weather[[1]]$description
  temperatura <- result$main$temp
  sensacao_termica <- result$main$feels_like
  umidade <- result$main$humidity
  vento <- result$wind$speed
  
  # Exibir a previsão do tempo
  cat('Previsão do tempo para', city, ':\n')
  cat('Descrição:', descricao, '\n')
  cat('Temperatura:', temperatura, '°C\n')
  cat('Sensação térmica:', sensacao_termica, '°C\n')
  cat('Umidade:', umidade, '%\n')
  cat('Velocidade do vento:', vento, 'm/s\n')
} else {
  cat('Cidade não encontrada ou ocorreu um erro na requisição.\n')
}