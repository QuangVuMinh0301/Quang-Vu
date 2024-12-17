/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author ADMIN
 */
public class AccountDAO extends DBContext {
    
    public List<Account> gettAll(){
       List<Account> list = new ArrayList<>();

        String sql = "select * from Account";
        //thuc thi cau truy van
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("ID");
                String user = rs.getString("Username").trim();
                String pass = rs.getString("Password").trim();
                int pri = rs.getInt("Priority");
                Account acc = new Account(user, pass, pri, id);
                list.add(acc);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
    
    public void insert(Account acc) {
        String sql = "INSERT INTO Account (Username,Password,Priority) VALUES (?,?, ?)";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, acc.getUsername());
            pre.setString(2, acc.getPassword());
            pre.setFloat(3, acc.getPriority());
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
     public Account getAccountByID(int id) {
        String sql = "select * from Account where ID = ?";
        //thuc thi cau truy van
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                String user = rs.getString("Username").trim();
                String pass = rs.getString("Password").trim();
                int priority = rs.getInt("Priority");
                int id2 = rs.getInt("ID");
                Account s = new Account(user, pass, priority, id2);

                return s;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void update(Account account) {
        String sql = "update Account set Priority = ? where ID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, account.getPriority());
            pre.setInt(2, account.getID());
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void changePass(Account account) {
        String sql = "update Account set Password = ? where Username = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, account.getPassword());
            pre.setString(2, account.getUsername());
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void deleteAccount(int id) {
        String sql = "delete from Account where ID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        for (Account account : dao.gettAll()) {
            System.out.println(account);
            
        }
    }
}
