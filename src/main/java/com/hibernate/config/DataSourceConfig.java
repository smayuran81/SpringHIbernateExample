package com.hibernate.config;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;

/**
 * Created by msivasub on 26/10/2017.
 */

@Configuration
public class DataSourceConfig {


    @Autowired
    private Environment env;

    @Bean("hsqldbDataSource")
    public DataSource hsqlDbDataSource() {

        BasicDataSource basicDataSource = new BasicDataSource();
        basicDataSource.setDriverClassName(env.getProperty("jdbc.driverClassName"));
        basicDataSource.setUrl(env.getProperty("jdbc.url"));
        basicDataSource.setUsername(env.getProperty("jdbc.user"));
        basicDataSource.setPassword(env.getProperty("jdbc.pass"));


        return basicDataSource;
    }
}
