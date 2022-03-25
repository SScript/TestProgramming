package com.kafkatest;

import org.apache.kafka.clients.consumer.*;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.common.serialization.StringDeserializer;

import java.time.Duration;
import java.util.Arrays;
import java.util.Properties;

public class KafkaTest01 {

    public static void main(String[] args) throws Exception {

        try{
            ConsumerRecords<String, String> records;

            Properties props = new Properties();
            // Server
            //props.put(ProducerConfig.BOOTSTRAP_SERVERS_CONFIG, getVariableData("bootstrap_servers"));
            props.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "");

            //Consumer group
            //props.setProperty("group.id", "group_id_SIKAFKA");
            props.setProperty(ConsumerConfig.GROUP_ID_CONFIG, "group_id_SIKAFKA");
            //props.setProperty("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
            props.setProperty(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
            //props.setProperty("value.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
            props.setProperty(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());

            props.setProperty(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");

            // Settings for authentication
            props.put("security.protocol", "SASL_SSL");
            props.put("sasl.mechanism", "SCRAM-SHA-512");

            // Settings for polling
            //props.put("ssl.endpoint.identification.algorithm", "");

            String jaasTemplate = "org.apache.kafka.common.security.scram.ScramLoginModule required username=\"%s\" password=\"%s\";";
            String jaasCfg = String.format(jaasTemplate, "username", "password");
            //String jaasCfg = String.format(jaasTemplate, "", "");
            props.put("sasl.jaas.config", jaasCfg);
            KafkaConsumer<String, String> consumer = new KafkaConsumer<String, String>(props);
            //consumer.subscribe(Arrays.asList(getVariableData("topic.id.SIKAFKA")));
            consumer.subscribe(Arrays.asList("java-topic"));

            System.out.printf("Start!");
            /*
            records = consumer.poll(1);
            if (records.count()>0)
            for (ConsumerRecord<String, String> record : records)
            System.out.printf("offset = %d, key = %s, value = %s%n", record.offset(), record.key(), record.value());
            */
            records = consumer.poll(Duration.ofMillis(100));
            while (records.count()>0) {
                for (ConsumerRecord<String, String> record : records)
                    System.out.printf("offset = %d, key = %s, value = %s%n", record.offset(), record.key(), record.value());
                records = consumer.poll((Duration.ofMillis(100)));
            }
            System.out.printf("End!");
        }
        catch (Exception e)
        {
            System.out.printf(e.getMessage() + e.getLocalizedMessage());
        }
    }

}