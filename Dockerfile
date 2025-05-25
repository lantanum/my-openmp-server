FROM debian:bullseye-slim

# Установка зависимостей (если нужно)
RUN apt-get update && apt-get install -y libstdc++6 libncurses5 && rm -rf /var/lib/apt/lists/*

# Копируем все файлы проекта
COPY . /server
WORKDIR /server

# Разрешаем запуск
RUN chmod +x omp-server

# Запускаем сервер
CMD ["./omp-server"]
