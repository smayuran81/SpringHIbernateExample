package com.hibernate.main;

import com.hibernate.config.ParentConfig;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import javax.sql.DataSource;
import java.sql.SQLException;

/**
 * Created by msivasub on 27/10/2017.
 */
public class App {

    public static void main(String[] args) throws SQLException {
        ApplicationContext context = new AnnotationConfigApplicationContext(ParentConfig.class);
        DataSource dataSource = (DataSource) context.getBean("hsqldbDataSource");
        if(dataSource.getConnection().isReadOnly()) {
            System.out.println("testConnection");
        }
        System.out.println(dataSource.toString());


    }
}
