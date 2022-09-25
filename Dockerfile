# FROM azul/zulu-openjdk-alpine:11-latest
FROM arm64v8/openjdk:17-jdk-slim-bullseye
# RUN addgroup spring
RUN useradd spring 
USER spring:spring
ARG DEPENDENCY=salon-eventos-backend/target/dependency
# ARG CERTIFICATES=
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
# COPY /etc/letsencrypt/live/dcevedo-ows1.ddnsfree.com/cert.pem /app/certificates
ENTRYPOINT [ "java","-cp","app:app/lib/*","com.ciclo3.saloneventos.SaloneventosApplication"]