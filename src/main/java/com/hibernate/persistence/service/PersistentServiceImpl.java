package com.hibernate.persistence.service;

import com.hibernate.persistence.dao.CountryDao;
import com.hibernate.persistence.entity.Country;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by msivasub on 31/10/2017.
 */

@Service("persistentService")
@Transactional
public class PersistentServiceImpl implements PersistentService {

    @Autowired
    CountryDao countryDao;


    public void saveCountry(Country country) {

        if(country.getCountry_id()==null)
        countryDao.saveCountry(country);
        else{
            countryDao.updateCountry(country);

        }


    }
}
