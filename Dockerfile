FROM minio/minio
CMD ["server", "/data", "--console-address", ":9001"]
EXPOSE 9000
EXPOSE 9001
# Instala o cliente mc (MinIO Client)
RUN curl -O https://dl.min.io/client/mc/release/linux-amd64/mc \
  && chmod +x mc \
  && mv mc /usr/local/bin/

# Script de entrada para criar bucket ao iniciar
CMD mc alias set local http://localhost:9000 minioadmin minioadmin && \
    mc mb --ignore-existing local/dify-files && \
    minio server /data
