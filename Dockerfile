FROM debian:bullseye-slim

# Установка зависимостей
RUN apt-get update && apt-get install -y libstdc++6 libncurses5 && rm -rf /var/lib/apt/lists/*

# Копируем файлы
COPY . /server
WORKDIR /server

# Делаем бинарник исполняемым
RUN chmod +x /server/omp-server

# UDP-порт
EXPOSE 7777/udp

# Запуск сервера
CMD ["/server/omp-server"]
