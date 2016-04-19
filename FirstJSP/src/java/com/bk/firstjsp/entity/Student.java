/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bk.firstjsp.entity;

/**
 *
 * @author bkawan
 * @date Apr 6, 2016
 * @time 8:05:13 PM
 */
public class Student {
    
     private int id;
    private String firstName, lastName, email, address, contactNo;

    public Student() {
    }

    public Student(int id, String firstName, String lastName, String email, String address, String contactNo) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.address = address;
        this.contactNo = contactNo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    @Override
    public String toString() {
        return "Student{" + "id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", address=" + address + ", contactNo=" + contactNo + '}';
    }

    public String stdDetails() {
        
      
        return(id + "  " + firstName + "  " + lastName + "  " + email + "  " + address + "  " + contactNo);

    }

}
