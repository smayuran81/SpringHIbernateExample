package com.hibernate.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.*;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.core.env.Environment;

import javax.sql.DataSource;
import java.util.Properties;

/**
 * Created by msivasub on 26/10/2017.
 * @EnableTransactionManagement: This enabled transaction maanager, which is same as tx in the xml configuration
 * DataSoource -> sessionFactory -> TransactionManager
 */


@Configuration
@EnableTransactionManagement
@PropertySource({"classpath:hsqldb.properties"})
@ComponentScan({"com.hibernate.persistence"})
public class PersistenceConfig {

    @Autowired
    private Environment env;

    @Autowired
    DataSource hsqlDbDataSource;


   private final Properties hibernateProperties() {

       final Properties hibernateProperties = new Properties();
       hibernateProperties.setProperty("hibernate.hbm2ddl.auto", env.getProperty("hibernate.hbm2ddl.auto"));
       hibernateProperties.setProperty("hibernate.dialect", env.getProperty("hibernate.dialect"));

       hibernateProperties.setProperty("hibernate.show_sql", "true");
        hibernateProperties.setProperty("hibernate.format_sql", "true");
       // hibernateProperties.setProperty("hibernate.globally_quoted_identifiers", "true");

       // Envers properties
       hibernateProperties.setProperty("org.hibernate.envers.audit_table_suffix", env.getProperty("envers.audit_table_suffix"));
       return hibernateProperties;
   }



    @Bean
    public LocalSessionFactoryBean sessionFactoryBean() {
        final LocalSessionFactoryBean sessionFactoryBean = new LocalSessionFactoryBean();
        sessionFactoryBean.setDataSource(hsqlDbDataSource);
        sessionFactoryBean.setPackagesToScan(new String[] { "com.hibernate.persistence.model" });
        sessionFactoryBean.setHibernateProperties(hibernateProperties());
        return sessionFactoryBean;
    }





    @Bean
    public PlatformTransactionManager hibernateTransactionManager() {
        final HibernateTransactionManager transactionManager = new HibernateTransactionManager();
        transactionManager.setSessionFactory(sessionFactoryBean().getObject());
        return transactionManager;
    }
}
