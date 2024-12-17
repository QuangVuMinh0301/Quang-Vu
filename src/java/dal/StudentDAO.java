/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import com.sun.jdi.connect.spi.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import model.Student;

/**
 *
 * @author ADMIN
 */
public class StudentDAO extends DBContext {

    public List<Student> getAll() {//read data tu DB
        List<Student> list = new ArrayList<>();

        String sql = "select * from [dbo].[ClassChung]";
        //thuc thi cau truy van
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name").trim();
                String phone = rs.getString("phoneNumber").trim();
                String bod = rs.getString("BoD");
                String address = rs.getString("Address").trim();
                String lop = rs.getString("Class").trim();
                Student s = new Student(name, phone, bod, address, lop);
                s.setId(String.valueOf(rs.getInt("ID")));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public void insert(Student st) {
        int generatedId = -1;
        String sql = "INSERT INTO [dbo].[ClassChung] ([name],[phoneNumber],[BoD],[Address],[Class]) VALUES (?, ?, ?, ?, ?)";

        try {
            PreparedStatement pre = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            pre.setString(1, st.getName());
            pre.setString(2, st.getPhoneNumber());
            pre.setObject(3, st.getBod());
            pre.setString(4, st.getAddress());
            pre.setString(5, st.getLop());
            pre.executeUpdate();

            // Retrieve the generated keys
            ResultSet rs = pre.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);  // Assuming the ID is an integer
            }

            insertToSubClass(st, generatedId);
        } catch (SQLException e) {
            e.printStackTrace();  // Print full stack trace for debugging
            System.out.println("Error inserting student: " + e.getMessage());
        }
    }

    public void insertToSubClass(Student student, int id) {
        String sql = "INSERT INTO [dbo].[LopCoBan] ([Name],[PhoneNumber] ,[BoD] ,[Address],[ClassChungID]) VALUES (?, ?, ?, ?,?)";
        if (student.getLop().equalsIgnoreCase("LopHLV")) {
            sql = "INSERT INTO [dbo].[LopHLV] ([Name],[PhoneNumber] ,[BoD] ,[Address],[ClassChungID]) VALUES (?, ?, ?, ?,?)";
        }
        if (student.getLop().equalsIgnoreCase("LopNangCao")) {
            sql = "INSERT INTO [dbo].[LopNangCao] ([Name],[PhoneNumber] ,[BoD] ,[Address],[ClassChungID]) VALUES (?, ?, ?, ?,?)";
        }
        if (student.getLop().equalsIgnoreCase("LopNguoiLon")) {
            sql = "INSERT INTO [dbo].[LopNguoiLon] ([Name],[PhoneNumber] ,[BoD] ,[Address],[ClassChungID]) VALUES (?, ?, ?, ?,?)";
        }
        if (student.getLop().equalsIgnoreCase("LopTuVe")) {
            sql = "INSERT INTO [dbo].[LopTuVe] ([Name],[PhoneNumber] ,[BoD] ,[Address],[ClassChungID]) VALUES (?, ?, ?, ?,?)";
        }

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, student.getName());
            pre.setString(2, student.getPhoneNumber());
            pre.setString(3, student.getBod());
            pre.setString(4, student.getAddress());
            pre.setInt(5, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Student> getCoursesByClass(String className) {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT [ID],[name] ,[phoneNumber] ,[BoD] ,[Address],[ClassChungID] FROM " + className;

        try (PreparedStatement pre = connection.prepareStatement(sql); ResultSet rs = pre.executeQuery()) {
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            while (rs.next()) {
                Student student = new Student();
                student.setName(rs.getString("name"));
                student.setPhoneNumber(rs.getString("phoneNumber"));
                student.setBod(rs.getString("BoD"));
                student.setAddress(rs.getString("Address"));
                student.setClassChungID(rs.getString("ClassChungID"));
                list.add(student);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public Student getStudentInClassChung(String ID) {
        String sql = "select * from [dbo].[ClassChung] where ID = ?";
        //thuc thi cau truy van
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, ID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                Student student = new Student();
                student.setName(rs.getString("name"));
                student.setPhoneNumber(rs.getString("phoneNumber"));
                student.setBod(rs.getString("BoD"));
                student.setAddress(rs.getString("Address"));
                student.setLop(rs.getString("Class"));
                student.setId(rs.getString("ID"));
                return student;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void update(Student st) {
        String sql = "update [dbo].[ClassChung] set name = ?, phoneNumber = ?, BoD = ?, Address = ?, Class = ? WHERE ID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, st.getName());
            pre.setString(2, st.getPhoneNumber());
            pre.setObject(3, st.getBod());
            pre.setString(4, st.getAddress());
            pre.setString(5, st.getLop());
            pre.setString(6, st.getId());
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateSubClass(Student st, String id) {
        String sql = "update [dbo].[LopCoBan] set name = ?, phoneNumber = ?, BoD = ?, Address = ? WHERE ClassChungID = ?";
        if (st.getLop().equalsIgnoreCase("LopHLV")) {
            sql = "update [dbo].[LopHLV] set name = ?, phoneNumber = ?, BoD = ?, Address = ? WHERE ClassChungID = ?";
        }
        if (st.getLop().equalsIgnoreCase("LopNangCao")) {
            sql = "update [dbo].[LopNangCao] set name = ?, phoneNumber = ?, BoD = ?, Address = ? WHERE ClassChungID = ?";
        }
        if (st.getLop().equalsIgnoreCase("LopNguoiLon")) {
            sql = "update [dbo].[LopNguoiLon] set name = ?, phoneNumber = ?, BoD = ?, Address = ? WHERE ClassChungID = ?";
        }
        if (st.getLop().equalsIgnoreCase("LopTuVe")) {
            sql = "update [dbo].[LopTuVe] set name = ?, phoneNumber = ?, BoD = ?, Address = ? WHERE ClassChungID = ?";
        }
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, st.getName());
            pre.setString(2, st.getPhoneNumber());
            pre.setObject(3, st.getBod());
            pre.setString(4, st.getAddress());
            pre.setString(5, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        System.out.println(new StudentDAO().getCoursesByClass("LopNangCao").get(0).getClassChungID());
    }

    public void delete(String oldClass, String id) {
        String sql = "DELETE FROM [dbo].[LopCoBan]\n"
                + "      WHERE ClassChungID like ?";
        if (oldClass.equalsIgnoreCase("LopHLV")) {
            sql = "DELETE FROM [dbo].[LopHLV]\n"
                    + "      WHERE ClassChungID like ?";
        }
        if (oldClass.equalsIgnoreCase("LopNangCao")) {
            sql = "DELETE FROM [dbo].[LopNangCao]\n"
                    + "      WHERE ClassChungID like ?";
        }
        if (oldClass.equalsIgnoreCase("LopNguoiLon")) {
            sql = "DELETE FROM [dbo].[LopNguoiLon]\n"
                    + "      WHERE ClassChungID like ?";
        }
        if (oldClass.equalsIgnoreCase("LopTuVe")) {
            sql = "DELETE FROM [dbo].[LopTuVe]\n"
                    + "      WHERE ClassChungID like ?";
        }
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteClassChung(String id) {
        String sql = "DELETE FROM [dbo].[Classchung]\n"
                + "      WHERE ID like ?";

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, id);
            pre.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean isDuplicateStudent(String name, String phoneNumber, String lop) {
        String sql = "SELECT COUNT(*) FROM students WHERE name = ? AND phoneNumber = ? AND class = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            pre.setString(2, phoneNumber);
            pre.setString(3, lop);
            try (ResultSet rs = pre.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Student> getStudentByName(String name) {
        List<Student> list = new ArrayList<>();
        String sql = "select * from [dbo].[ClassChung] where name LIKE ?";

        //thuc thi cau truy van
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, name);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                String name2 = rs.getString("name").trim();
                String phone = rs.getString("phoneNumber").trim();
                String bod = rs.getString("BoD");
                String address = rs.getString("Address").trim();
                String lop = rs.getString("Class").trim();
                Student s = new Student(name2, phone, bod, address, lop);
                s.setId(String.valueOf(rs.getInt("ID")));
                list.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public int countStudentInClassChung() {
        String sql = "SELECT COUNT(*) FROM ClassChung";
        int count = 0;
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    public int countStudentInSubClass(String classname) {
        String sql = "SELECT COUNT(*) FROM ClassChung WHERE class = ?";
        int count = 0;

        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, classname);
            ResultSet rs = pre.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

}
