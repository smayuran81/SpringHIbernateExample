package com.hibernate.persistence.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by msivasub on 31/10/2017.
 */
public abstract class AbstractDao {

    @Autowired
    private SessionFactory sessionFactory;

    protected Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    public void persist(Object entity) {
       // getSession().merge(entity);
        getSession().persist(entity);
        //getSession().save(entity);
    }

    public void update(Object entity) {
        getSession().update(entity);
    }
}
