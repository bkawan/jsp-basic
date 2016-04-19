/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bk.firstjsp.dao.impl;

import com.bk.firstjsp.dao.StudentDAO;
import com.bk.firstjsp.dbutil.DBConnection;
import com.bk.firstjsp.entity.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author bkawan
 * @date Apr 6, 2016
 * @time 8:07:26 PM
 */
public class StudentDAOImpl extends DBConnection implements StudentDAO {

    private DBConnection dbConn = new DBConnection();

    @Override
    public int insert(Student student) throws ClassNotFoundException, SQLException {

        String sql = "INSERT INTO tbl_students (first_name,last_name,email,contact_no,address) VALUES (?,?,?,?,?)";
        //first open connection

        dbConn.open();

        // set the value to prepared statement from student class getters 
        PreparedStatement stmt = dbConn.initStatement(sql);
        stmt.setString(1, student.getFirstName());
        stmt.setString(2, student.getLastName());
        stmt.setString(3, student.getEmail());
        stmt.setString(4, student.getContactNo());
        stmt.setString(5, student.getAddress());

        // now insert into database and get result in int
        int result = stmt.executeUpdate();

        //close connection
        dbConn.close();

        return result;

    }

    @Override
    public int update(Student student) throws ClassNotFoundException, SQLException {
        String sql = "UPDATE tbl_students  set first_name=?, last_name=?, email=?,contact_no=?, address=? WHERE id=?";
        dbConn.open();

        PreparedStatement stmt = dbConn.initStatement(sql);
        stmt.setString(1, student.getFirstName());
        stmt.setString(2, student.getLastName());
        stmt.setString(3, student.getEmail());
        stmt.setString(4, student.getContactNo());
        stmt.setString(5, student.getAddress());
        stmt.setInt(6, student.getId());

        int result = stmt.executeUpdate();
        dbConn.close();

        return result;

    }

    @Override
    public int delete(int id) throws ClassNotFoundException, SQLException {
        String sql = "DELETE FROM tbl_students WHERE id=?";

        dbConn.open();
        PreparedStatement stmt = dbConn.initStatement(sql);
        stmt.setInt(1, id);

        int result = stmt.executeUpdate();
        dbConn.close();

        return result;

    }

    @Override
    public Student getById(int id) throws ClassNotFoundException, SQLException {
        Student student = null;
        String sql = "SELECT * FROM tbl_students WHERE id=?";

        dbConn.open();
        PreparedStatement stmt = dbConn.initStatement(sql);
        stmt.setInt(1, id);

        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            student = new Student();
            student.setId(rs.getInt("id"));
            student.setFirstName(rs.getString("first_name"));
            student.setLastName(rs.getString("last_name"));
            student.setEmail(rs.getString("email"));
            student.setAddress(rs.getString("address"));
            student.setContactNo(rs.getString("contact_no"));
        }
        dbConn.close();
        return student;
        
        
//        for(Student student: getAll()){
//            if(student.getId() == id){
//                return student;
//            }
//        }
//        return null;

    }

    @Override
    public ArrayList<Student> getAll() throws ClassNotFoundException, SQLException {
        ArrayList<Student> studentList = new ArrayList<>();

        dbConn.open();
        String sql = "SELECT * FROM tbl_students";
        PreparedStatement stmt = dbConn.initStatement(sql);

        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Student s = new Student();
            s.setId(rs.getInt("id"));
            s.setFirstName(rs.getString("first_name"));
            s.setLastName(rs.getString("last_name"));
            s.setEmail(rs.getString("email"));
            s.setAddress(rs.getString("address"));
            s.setContactNo(rs.getString("contact_no"));
            System.out.println(s.toString());
            studentList.add(s);
        }

        dbConn.close();

        return studentList;

    }

}
