/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bk.firstjsp.dao;

import com.bk.firstjsp.entity.Student;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author bkawan
 * @date Apr 6, 2016
 * @time 8:05:48 PM
 */
public interface StudentDAO {

    int insert(Student student)throws ClassNotFoundException, SQLException;

    int update(Student student) throws ClassNotFoundException, SQLException;

    int delete(int id)throws ClassNotFoundException, SQLException;

    Student getById(int id)throws ClassNotFoundException, SQLException;

    List<Student> getAll()throws ClassNotFoundException, SQLException;

}
