# Carregando bibliotecas
library(httr)
library(jsonlite)

# Função para fazer requisição à API
weather_api <- function(params) {
  # get function from namespace instead of possibly getting
  # implementation shipped with recent R versions:
  bp_URLencode = getFromNamespace("URLencode", "backports")

  # Chave de acesso à API OpenWeatherMap
  api_key <- "0ab1ba6c3616f8bad85d4275978ea1f4"

  # URL da API
  api_url <- "https://api.openweathermap.org/data/2.5/weather"

  # Concatena a URL da API com os parâmetros da requisição
  url <- bp_URLencode(paste0(api_url, "?", params, "&appid=", api_key, "&units=metric&lang=pt_br")) # nolint

  # Faz a requisição à API no máximo 3 tentativas
  data <- try(RETRY("GET", url, times = 3))

  # Verifica se houve erro na requisição
  if (is(data, "try-error")) data <- list(status_code = 404)

  # Verifica se a requisição foi bem sucedida
  if (data$status_code != 200) {
    stop("Erro ao consultar a API", call. = FALSE)
  }

  # Converte o resultado para JSON
  result <- fromJSON(content(data, "text"), simplifyVector = FALSE)

  # Retorna o resultado
  return(result)
}

# Função para fazer requisição à API
weather_geo <- function(lat, lon) {
  # set parameters to call weather_api
  params <- paste0("lat=", lat, "&lon=", lon)

  # call weather_api
  result <- weather_api(params)

  # Retorna o resultado
  return(result)
}

# Função para fazer requisição à API
weather_city <- function(city) {
  # set parameters to call weather_api
  params <- paste0("q=", city)

  # call weather_api
  result <- weather_api(params)

  # Retorna o resultado
  return(result)
}