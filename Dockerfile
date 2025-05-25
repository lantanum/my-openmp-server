FROM debian:bullseye-slim

# Установка зависимостей
RUN apt-get update && apt-get install -y libstdc++6 libncurses5 && rm -rf /var/lib/apt/lists/*

# Копируем все файлы сервера
COPY . /server
WORKDIR /server

# Разрешаем запуск
RUN chmod +x omp-server

# UDP-порт для SA-MP
EXPOSE 7777/udp

# Запускаем сервер
CMD ["./omp-server"]
