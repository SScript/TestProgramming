package com.kafkatest;

import org.apache.kafka.clients.consumer.*;
import org.apache.kafka.clients.producer.ProducerConfig;
import org.apache.kafka.common.serialization.StringDeserializer;

import java.time.Duration;
import java.util.Arrays;
import java.util.Collections;
import java.util.Properties;

public class KafkaTest01 {
    private static String getVariableData(String string) {

        if (string == "bootstrap_servers")
            return "http://localhost:9091,http://localhost:9092,http://localhost:9093,http://localhost:9094,http://localhost:9095";
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


    public static void main(String[] args) throws Exception {
        KafkaConsumer<String, String> consumer;

        try{
            ConsumerRecords<String, String> records;

            Properties props = new Properties();
            // Server
            props.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, getVariableData("bootstrap_servers"));
            //props.put(ConsumerConfig.BOOTSTRAP_SERVERS_CONFIG, "famel1scaccse1.teliacompany.net:9091,famel1scaccse2.teliacompany.net:9092,famel1scaccse3.teliacompany.net:9093,famel1scaccse4.teliacompany.net:9094,famel1scaccse5.teliacompany.net:9095");
            props.setProperty(ConsumerConfig.GROUP_ID_CONFIG, "Hid100004776.LV_TET.group.AT");

            //props.setProperty("topic.id.SIKAFKA", "Hid100004776.service_inventory.LV_TET.AT");
            //props.setProperty("group.id.SIKAFKA", "Hid100004776.LV_TET.group.AT");

            //props.setProperty(ConsumerConfig.GROUP_ID_CONFIG, "group_id_SIKAFKA");
            props.setProperty(ConsumerConfig.KEY_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
            props.setProperty(ConsumerConfig.VALUE_DESERIALIZER_CLASS_CONFIG, StringDeserializer.class.getName());
            props.setProperty(ConsumerConfig.AUTO_OFFSET_RESET_CONFIG, "earliest");
            // Settings for authentication
            props.put("security.protocol", "SASL_SSL");
            props.put("sasl.mechanism", "SCRAM-SHA-512");
            props.put("ssl.endpoint.identification.algorithm", "");

            String jaasTemplate = "org.apache.kafka.common.security.scram.ScramLoginModule required username=\"%s\" password=\"%s\";";
            String jaasCfg = String.format(jaasTemplate, getVariableData("username"), getVariableData("password"));
            props.put("sasl.jaas.config", jaasCfg);
            consumer = new KafkaConsumer<>(props);
            //consumer.subscribe(Arrays.asList(getVariableData("topic.id.SIKAFKA")));
            consumer.subscribe(Collections.singletonList(getVariableData("topic.id.SIKAFKA")));

            System.out.println("Start!");
            //records = consumer.poll(500);
            records = consumer.poll(Duration.ofMillis(5000));
            while (records.count()>0) {
                for (ConsumerRecord<String, String> record : records)
                    System.out.printf("offset = %d, key = %s, value = %s%n", record.offset(), record.key(), record.value());
                records = consumer.poll((Duration.ofMillis(100)));
            }
            System.out.println("End!");
        }
        catch (Exception e)
        {
            System.out.println("---> End with error.");
            System.out.println(e.getMessage() + e.getLocalizedMessage());
            System.out.println("-----");
        } finally {
            consumer.close();
        }
    }

}