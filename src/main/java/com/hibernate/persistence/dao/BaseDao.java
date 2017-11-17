package com.hibernate.persistence.dao;

import java.io.Serializable;

/**
 * Created by msivasub on 01/11/2017.
 */
public class BaseDao<T> extends AbstractDao  {

    public void save(T o) {

        persist(o);
    }
}
