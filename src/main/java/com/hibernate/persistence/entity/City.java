package com.hibernate.persistence.entity;

import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by msivasub on 03/11/2017.
 */

@Entity
@Table(name="city")
public class City {


    public int getCity_id() {
        return city_id;
    }

    public void setCity_id(int city_id) {
        this.city_id = city_id;
    }

    @Id
    @GeneratedValue
    private int city_id;


    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getCountry_id() {
        return country_id;
    }

    public void setCountry_id(int country_id) {
        this.country_id = country_id;
    }

    public Date getLast_update() {
        return last_update;
    }

    public void setLast_update(Date last_update) {
        this.last_update = last_update;
    }

    private String city;


    private int country_id;

    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private Date last_update;

}
