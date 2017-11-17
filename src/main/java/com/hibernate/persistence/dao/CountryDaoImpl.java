package com.hibernate.persistence.dao;

import com.hibernate.persistence.entity.Country;
import org.hibernate.HibernateException;
import org.springframework.stereotype.Repository;

/**
 * Created by msivasub on 31/10/2017.
 */
@Repository("countryDao")
public class CountryDaoImpl extends AbstractDao implements CountryDao {
    public void saveCountry(Country country) throws HibernateException {


        persist(country);
    }

    public void updateCountry(Country country) {
        update(country);
    }
}
