FROM postgres


ENV POSTGRES_HOST 172.20.0.4
ENV POSTGRES_USER cloud
ENV POSTGRES_PASSWORD cloud
ENV POSTGRES_DB cloud_computing

COPY postgres/init.sql /docker-entrypoint-initdb.d/
COPY postgres/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["postgres"]
