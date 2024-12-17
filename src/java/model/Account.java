/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ADMIN
 */
public class Account {
     String username;
    String password;
    int priority;
    int ID;

    public Account() {
        this.priority = 2;
    }

    public Account(String username, String password, int priority) {
        this.username = username;
        this.password = password;
        this.priority = priority;
    }

    public Account(String username, String password, int priority, int ID) {
        this.username = username;
        this.password = password;
        this.priority = priority;
        this.ID = ID;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    @Override
    public String toString() {
        return "Account{" + "username=" + username + ", password=" + password + ", priority=" + priority + '}';
    }

    
    
    
}
