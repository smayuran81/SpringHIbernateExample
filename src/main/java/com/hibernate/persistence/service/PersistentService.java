package com.hibernate.persistence.service;

import com.hibernate.persistence.entity.Country;

/**
 * Created by msivasub on 31/10/2017.
 */
public interface PersistentService {

    void saveCountry(Country country);
}
