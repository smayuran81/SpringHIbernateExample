package com.hibernate.persistence.entity;

import org.springframework.stereotype.Component;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * Created by msivasub on 01/11/2017.
 */

@Embeddable
public class Contact {

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Column
    String firstName;

    @Column
    String lastName;

    @Column
    String email;
}
