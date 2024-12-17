/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Student {
    String id;
    String name;
    String phoneNumber;
    String bod;
    String address;
    String lop;
    String ClassChungID;

    public Student() {
    }

    public String getClassChungID() {
        return ClassChungID;
    }

    public void setClassChungID(String ClassChungID) {
        this.ClassChungID = ClassChungID;
    }
    
    public Student(String name, String phoneNumber, String bod, String address) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.bod = bod;
        this.address = address;
    }

    public Student(String name, String phoneNumber, String bod, String address, String lop) {
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.bod = bod;
        this.address = address;
        this.lop = lop;
    }

    public Student(String id, String name, String phoneNumber, String bod, String address, String lop) {
        this.id = id;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.bod = bod;
        this.address = address;
        this.lop = lop;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getBod() {
        return bod;
    }

    public void setBod(String bod) {
        this.bod = bod;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLop() {
        return lop;
    }

    public void setLop(String lop) {
        this.lop = lop;
    }

    @Override
    public String toString() {
        return "Student{" + "name=" + name + ", phoneNumber=" + phoneNumber + ", bod=" + bod + ", address=" + address + ", lop=" + lop + '}';
    }
    
    
}
