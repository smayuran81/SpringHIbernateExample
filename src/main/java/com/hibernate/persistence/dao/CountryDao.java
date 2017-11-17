package com.hibernate.persistence.dao;

import com.hibernate.persistence.entity.Country;

/**
 * Created by msivasub on 31/10/2017.
 */
public interface CountryDao {

    public void saveCountry(Country country);


    public void updateCountry(Country country);
}


