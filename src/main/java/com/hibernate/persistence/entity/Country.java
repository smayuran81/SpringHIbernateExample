package com.hibernate.persistence.entity;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CreationTimestamp;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

/**
 * Created by msivasub on 31/10/2017.
 */

@Entity
@Table(name="country")
public class Country {

    public Long getCountry_id() {
        return country_id;
    }

    @Id
    @GeneratedValue
    Long country_id;


    public void setCountry_id(Long country_id) {
        this.country_id = country_id;
    }

    public List<City> getCityList() {
        return cityList;
    }

    public void setCityList(List<City> cityList) {
        this.cityList = cityList;
    }

    @OneToMany(cascade=CascadeType.ALL,orphanRemoval = true)
    @JoinColumn(name="country_id")
    List<City> cityList;

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @Column
    private String country;

    public Date getLast_update() {
        return last_update;
    }

    public void setLast_update(Date last_update) {
        this.last_update = last_update;
    }

    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    @Column
    private Date last_update;


    @Override
    public boolean equals(Object other) {

        Country rhs = (Country)other;
        return new EqualsBuilder()
                .append(country,rhs.getCountry())
                .isEquals();

    }

    public int hashCode() {

        return new HashCodeBuilder(17,37).
                append(country).
                toHashCode();

    }


}
