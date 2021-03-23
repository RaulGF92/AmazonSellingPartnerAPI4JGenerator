FROM maven:3.6.3-jdk-8

RUN mkdir /app
RUN mkdir /app/dist
RUN mkdir /app/log

WORKDIR /app

COPY entrypoint.sh entrypoint.sh
COPY injectlibrary-1.0.0.jar injectlibrary-1.0.0.jar

RUN chmod +x entrypoint.sh

RUN wget https://repo1.maven.org/maven2/io/swagger/swagger-codegen-cli/2.4.13/swagger-codegen-cli-2.4.13.jar -O /app/swagger-codegen-cli.jar

RUN ls -all

CMD ["./entrypoint.sh", "/app"]