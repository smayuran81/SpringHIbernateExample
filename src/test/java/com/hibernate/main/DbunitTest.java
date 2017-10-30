package com.hibernate.main;

import com.hibernate.config.TestDataSourceConfig;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by msivasub on 26/10/2017.
 */
//@Sql({"classpath:schema_notused.sql","classpath:insert.sql"} )
@Sql({"classpath:schema.sql", "classpath:insert1.sql"} )
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = TestDataSourceConfig.class)
@Configuration
public class DbunitTest {



    @Before
    public void  setup() throws SQLException {

        ApplicationContext context = new AnnotationConfigApplicationContext(TestDataSourceConfig.class);
        DataSource dataSource = (DataSource) context.getBean("hsqldbDataSource_test");
        Connection conn = dataSource.getConnection();
        if(!conn.isReadOnly()) {
            System.out.println("Connection Successfull");
            ResultSet rs=conn.getMetaData().getTableTypes();
            System.out.println("Connection Successfull");
        }
        else{
            System.out.println("Connection");
        }

    }

    @Test
    public void test() {

    }
}
