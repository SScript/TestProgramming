package com.kafkatest;

import org.apache.kafka.clients.consumer.*;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.common.serialization.StringDeserializer;

import java.time.Duration;
import java.util.Arrays;
import java.util.Properties;

public class KafkaTest02 {
    private static String getVariableData(String string) {

        if (string == "bootstrap_servers")
            return "https://localhost:9091,https://localhost:9092,https://localhost:9093,https://localhost:9094,https://localhost:9095";
        // return "famel1scaccse1.teliacompany.net:9091,famel1scaccse2.teliacompany.net:9092,famel1scaccse3.teliacompany.net:9093,famel1scaccse4.teliacompany.net:9094,famel1scaccse5.teliacompany.net:9095";

        if (string == "group.id.SIKAFKA")
            return "Hid100004776.LV_TET.group.AT";

        if (string == "topic.id.SIKAFKA")
            return "Hid100004776.service_inventory.LV_TET.AT";

        if (string == "password")
            return "YwNtz5XFSwRMC8Fr";

        if (string == "username")
            return "Hid100004776.consumer.LV_TET.AT";

        return "";
    }

    public static void main(String[] args) {
        try{
            ConsumerRecords<String, String> records;

            Properties props = new Properties();
            // Server
            props.put("bootstrap.servers", getVariableData("bootstrap_servers"));
            //Consumer group
            props.setProperty("group.id", "group_id_SIKAFKA");
            props.setProperty("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
            props.setProperty("value.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");

            // Settings for authentication
            props.put("security.protocol", "SASL_SSL");
            props.put("sasl.mechanism", "SCRAM-SHA-512");
            props.put("ssl.endpoint.identification.algorithm", ""); //ssl.endpoint.identification.algorithm
            //props.put("ssl.enabled.protocols", "TLSv1.2,TLSv1.3");
            //props.put("ssl.protocol", "TLSv1.2");
            //props.put("session.timeout.ms", "10000");

            String jaasTemplate = "org.apache.kafka.common.security.scram.ScramLoginModule required username=\"%s\" password=\"%s\";";
            String jaasCfg = String.format(jaasTemplate, getVariableData("username"), getVariableData("password"));
            props.put("sasl.jaas.config", jaasCfg);
            KafkaConsumer<String, String> consumer = new KafkaConsumer<>(props);
            consumer.subscribe(Arrays.asList(getVariableData("topic.id.SIKAFKA")));

            System.out.printf("Start!");
        /*
        records = consumer.poll(1);
            if (records.count()>0)
                for (ConsumerRecord<String, String> record : records)
                    System.out.printf("offset = %d, key = %s, value = %s%n", record.offset(), record.key(), record.value());
        */
            records = consumer.poll(10000);
            while (records.count()>0) {
                for (ConsumerRecord<String, String> record : records)
                    System.out.printf("offset = %d, key = %s, value = %s%n", record.offset(), record.key(), record.value());
                records = consumer.poll(100);
            }
            System.out.printf("End!");
        }
        catch (Exception e)
        {
            System.out.printf(e.getMessage() + e.getLocalizedMessage());
        }
    }
}
