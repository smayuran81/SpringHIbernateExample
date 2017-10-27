package com.hibernate.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

/**
 * Created by msivasub on 27/10/2017.
 */
@Configuration
@Import({DataSourceConfig.class,PersistenceConfig.class})
public class ParentConfig {
}
