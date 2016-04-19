<%-- 
    Document   : delete
    Created on : Apr 9, 2016, 10:40:21 PM
    Author     : bikeshkawan
--%>
<%@page import="com.bk.firstjsp.dao.StudentDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bk.firstjsp.dao.impl.StudentDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bk.firstjsp.entity.Student" %>
<!DOCTYPE html>

<%
    StudentDAO stdDao = new StudentDAOImpl();

    int id = Integer.valueOf(request.getParameter("id"));
    Student student = stdDao.getById(id);

    if (request.getParameter("id") == null || request.getParameter("id").isEmpty()) {
        response.sendRedirect("index.jsp");
    }
    else if (student == null)
    {
        response.sendRedirect("index.jsp");

    }else{
        
        stdDao.delete(id);
        response.sendRedirect("index.jsp");

        
    }
    
    
%>

