ARG BASE_IMAGE=${BASE_IMAGE:-python:3.11-alpine}
FROM ${BASE_IMAGE}

COPY .mariadb .mariadb
COPY pymysqlreplication pymysqlreplication
COPY README.md README.md
COPY setup.py setup.py
RUN apk add bind-tools
RUN apk add mysql-client
RUN pip install .
RUN pip install pytest

ARG MYSQL_5_7
ENV MYSQL_5_7 ${MYSQL_5_7}

ARG MYSQL_5_7_CTL
ENV MYSQL_5_7_CTL ${MYSQL_5_7_CTL}

ARG MYSQL_5_7_CTL_PORT
ENV MYSQL_5_7_CTL_PORT ${MYSQL_5_7_CTL_PORT}

ARG MYSQL_8_0
ENV MYSQL_8_0 ${MYSQL_8_0}

ARG MYSQL_8_0_PORT
ENV MYSQL_8_0_PORT ${MYSQL_8_0_PORT}

ARG MARIADB_10_6
ENV MARIADB_10_6 ${MARIADB_10_6}

ARG MARIADB_10_6_PORT
ENV MARIADB_10_6_PORT ${MARIADB_10_6_PORT}
