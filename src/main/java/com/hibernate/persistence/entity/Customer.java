package com.hibernate.persistence.entity;

import javax.persistence.*;

/**
 * Created by msivasub on 01/11/2017.
 */

@Entity
public class Customer {

    @Id
    @GeneratedValue
    Long id;

    @Embedded
    @AttributeOverrides({
            @AttributeOverride(name="firstName", column = @Column(name="first_name")),
            @AttributeOverride(name="lastName", column = @Column(name="last_name")),
            @AttributeOverride(name="email", column = @Column(name="email")),
    })
    Contact contactDetails;
}
