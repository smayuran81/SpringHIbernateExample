package com.hibernate.config;

import net.ttddyy.dsproxy.listener.logging.SystemOutQueryLoggingListener;
import net.ttddyy.dsproxy.support.ProxyDataSource;
import net.ttddyy.dsproxy.support.ProxyDataSourceBuilder;
import org.apache.commons.dbcp.BasicDataSource;
import org.hsqldb.util.DatabaseManagerSwing;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.core.env.Environment;
import net.ttddyy.dsproxy.listener.*;
import net.ttddyy.dsproxy.listener.*;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.lang.reflect.Method;

/**
 * Created by msivasub on 26/10/2017.
 */

@Configuration
@PropertySource({"classpath:hsqldb_test.properties"})
@Import({PersistenceConfig.class})
public class TestDataSourceConfig {


    @Autowired
    private Environment env;

    @Primary
    @Bean("hsqldbDataSource_test")
    public DataSource hsqlDbDataSource() {

        BasicDataSource basicDataSource = new BasicDataSource();
        basicDataSource.setDriverClassName(env.getProperty("jdbc.driverClassName"));
        basicDataSource.setUrl(env.getProperty("jdbc.url"));
        basicDataSource.setUsername(env.getProperty("jdbc.user"));
        basicDataSource.setPassword(env.getProperty("jdbc.pass"));
        SystemOutQueryLoggingListener listener = new SystemOutQueryLoggingListener();




        return ProxyDataSourceBuilder
                .create(basicDataSource)
                .name("testDs")
                .listener(listener)
                .proxyResultSet()
                .afterMethod(executionContext -> {
                    // print out JDBC API calls to console
                    Method method = executionContext.getMethod();
                    Class<?> targetClass = executionContext.getTarget().getClass();
                    System.out.println("JDBC: " + targetClass.getSimpleName() + "#" + method.getName());
                })
                .afterQuery((execInfo, queryInfoList) -> {
                    System.out.println("Query took " + execInfo.getElapsedTime() + "msec");
                })
                .build();


    }


    @PostConstruct
    public void getDbManager(){
        DatabaseManagerSwing.main(
                new String[] { "--url", env.getProperty("jdbc.url"), "--user", env.getProperty("jdbc.user"), "--password", env.getProperty("jdbc.pass")});
    }
}
