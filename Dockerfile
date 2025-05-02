FROM minio/minio
CMD ["server", "/data", "--console-address", ":9001"]
EXPOSE 9000
EXPOSE 9001
