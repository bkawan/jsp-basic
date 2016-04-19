/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bk.firstjsp;

import com.bk.firstjsp.dao.StudentDAO;
import com.bk.firstjsp.dao.impl.StudentDAOImpl;
import com.bk.firstjsp.entity.Student;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author bkawan
 * @date Apr 6, 2016
 * @time 8:04:53 PM
 */
public class Main {

   public static void main(String args[]){
        
        StudentDAO stdDao = new StudentDAOImpl();

                      
        try {
            for (Student s : stdDao.getAll()) {
                
                System.out.println(s.getFirstName());
            }
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
