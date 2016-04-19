/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.bk.firstjsp.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author bkawan
 * @date Apr 6, 2016
 * @time 8:08:54 PM
 */
public class DBConnection {
    
    private Connection conn = null;
    private PreparedStatement stmt;
    
    
    // to connect with database
    public void open() throws ClassNotFoundException, SQLException{
        //driver for to connect with database
    Class.forName("com.mysql.jdbc.Driver");

    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/firstjsp", "root", "root");
    
    }

    public PreparedStatement initStatement(String sql) throws SQLException{
        
        stmt = conn.prepareStatement(sql);
        return stmt;
    }
    
    public int executeUpdate() throws SQLException{
        return stmt.executeUpdate();
    }
    
    public ResultSet executeQuery() throws SQLException{
        
       return stmt.executeQuery();
    }
    
    public void close() throws SQLException{
        
        if((conn != null) && !conn.isClosed()){
            
            conn.close();
            conn = null;
    }
    }
    
}
