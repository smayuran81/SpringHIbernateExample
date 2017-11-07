package com.hibernate.main;

import com.hibernate.config.TestDataSourceConfig;
import com.hibernate.persistence.entity.City;
import com.hibernate.persistence.entity.Country;
import com.hibernate.persistence.entity.Customer;
import com.hibernate.persistence.service.PersistentService;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
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
import java.util.Arrays;

/**
 * Created by msivasub on 26/10/2017.
 */
//@Sql({"classpath:schema_notused.sql","classpath:insert.sql"} )
@Sql({"classpath:schema.sql", "classpath:insert1.sql"} )
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = TestDataSourceConfig.class)
@Configuration
public class DbunitTest {



    @Autowired
    PersistentService persistentService;

    @BeforeClass
    public static void setUpClass() {


    }


    @Before
    public void  setup() throws SQLException {

        ApplicationContext context = new AnnotationConfigApplicationContext(TestDataSourceConfig.class);

    }

    @Test
    public void testCountry() throws InterruptedException {



        Country country = new Country();
        country.setCountry("myCountry");
        City city1 = new City();
        city1.setCity("mycity");
        country.setCityList(Arrays.asList(city1));
        persistentService.saveCountry(country);
        System.out.println(country);
        Thread.sleep(20000000000L);


    }

    @Test
    public void testCustomer() {

        Customer customer = new Customer();

    }
}
