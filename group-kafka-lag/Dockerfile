FROM wurstmeister/kafka:1.0.0

ENV GROUP_ID slow-consumer
ENV KAFKA_HOST kafka
ENV KAFKA_PORT 9092
ENV TELEGRAF_HOST telegraf
ENV TELEGRAF_PORT 8094

COPY kafka-lag.sh .
RUN chmod +x kafka-lag.sh

CMD ["bash", "-c", "./kafka-lag.sh ${GROUP_ID} ${KAFKA_HOST} ${KAFKA_PORT} ${TELEGRAF_HOST} ${TELEGRAF_PORT}"]
