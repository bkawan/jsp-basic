<%-- 
    Document   : update
    Created on : Apr 9, 2016, 9:55:56 PM
    Author     : bikeshkawan
--%>


<%@page import="com.bk.firstjsp.dao.StudentDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bk.firstjsp.dao.impl.StudentDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bk.firstjsp.entity.Student" %>
<!DOCTYPE html>
<html>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">


    <title>Fixed Top Navbar Example for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="navbar-fixed-top.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

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

    }
       
        if ("POST".equalsIgnoreCase(request.getMethod())) {

            student.setFirstName(request.getParameter("fname"));
            student.setLastName(request.getParameter("lname"));

            student.setEmail(request.getParameter("email"));

            student.setAddress(request.getParameter("address"));
            student.setContactNo(request.getParameter("contact"));
//            int id = Integer.valueOf(request.getParameter("id"));
            student.setId(id);

            stdDao.update(student);
            response.sendRedirect("index.jsp");
        }
    %>

    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">Registration System</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active" ><a href="index.jsp">Home</a></li>


                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#/navbar/">Contact</a></li>
                    <li><a href="#">About</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>

    <div class="container">

        <!-- Main component for a primary marketing message or call to action -->
       
        <div id="update" class="jumbotron" style="display: block;padding-top:70px">
        <h1> Update Form </h1>


            <form role="form" method="POST" action="">

                <div class="form-group">
                    <label for="name">First Name</label>
                    <input class="form-control" name="fname" value="<%=student.getFirstName()%>"/>
                </div>

                <div class="form-group">

                    <label for="lname">Last Name</label>
                    <input class="form-control" name="lname" value="<%=student.getLastName()%>"/>
                </div>



                <div class="form-group">

                    <label for="email">Email</label>
                    <input class="form-control" name="email" value="<%=student.getEmail()%>"/>
                </div>


                <div class="form-group">

                    <label for="address">Address</label>
                    <input  class="form-control" name="address" value="<%=student.getAddress()%>"/>

                </div>


                <div class="form-group">
                    <label for="conact">contact </label>
                    <input  class="form-control" name="contact" value="<%=student.getContactNo()%>"/>

                </div>


                <div class="form-group">
                    <button class="btn btn-success btn-sm"type="submit">Update</button><span> <a href="index.jsp" class="btn btn-danger btn-sm">Cancel</a></span>
            </form>



        </div>

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    




</body>
</html>
