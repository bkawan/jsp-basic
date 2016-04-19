<%-- 
    Document   : index
    Created on : Apr 6, 2016, 7:50:56 PM
    Author     : bikeshkawan
--%>

<%@page import="com.bk.firstjsp.dao.StudentDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bk.firstjsp.dao.impl.StudentDAOImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.bk.firstjsp.entity.Student" %>
<%@page import="com.bk.firstjsp.validation.validate" %>
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

        String errMessage = null;

        if ("POST".equalsIgnoreCase(request.getMethod())) {
            if (request.getParameter("fname") == null) {

                errMessage = "This is required field";
            } else {

                StudentDAO stdDaoImpl = new StudentDAOImpl();

                Student student = new Student();

                student.setFirstName(request.getParameter("fname"));
                student.setLastName(request.getParameter("lname"));

                student.setEmail(request.getParameter("email"));

                student.setAddress(request.getParameter("address"));
                student.setContactNo(request.getParameter("contact"));

                stdDaoImpl.insert(student);
            }
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
                <a class="navbar-brand"   href="index.jsp">Registration System</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a id="" href="">Home</a></li>
                    <li><a id="linkRegister" href="#">Register</a></li>
                    <li><a id="linkStdList" href="#">List All</a></li>


                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">Contact</a></li>
                    <li><a href="#">About</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>

    <div class="container">

        <div id="stdList" class="jumbotron" style="display: ">

            <h1> List of Registered People</h1>
            <table class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <td>ID</td>
                        <td>Name</td>
                        <td>Email</td>
                        <td>Address</td>
                        <td>Contact</td>
                        <td>Action</td>
                    </tr>
                </thead>
                <tbody>



                    <%
                        StudentDAO stdDao = new StudentDAOImpl();

                        for (Student student : stdDao.getAll()) {
                    %>

                    <tr>
                        <td><% out.print(student.getId());%></td>
                        <td><% out.print(student.getFirstName() + " " + student.getLastName());%></td>

                        <td><% out.print(student.getEmail());%></td>
                        <td><% out.print(student.getAddress());%></td>

                        <td><% out.print(student.getContactNo());%></td>
                        <td><span><a class="glyphicon glyphicon-edit" href="update.jsp?id=<% out.print(student.getId()); %>">Edit</a></span>

                            <span> <a id="confirm-delete" class="glyphicon glyphicon-remove" href="delete.jsp?id=<% out.print(student.getId()); %>">Delete</a></span>
                        </td>






                    </tr>
                    <%  };

                    %>

                </tbody>

            </table>

        </div>

        <div id="register" class="jumbotron" style="display: none;padding-top:50px">
            <h1> Registration form </h1>


            <form role="form" method="POST" action="">

                <div class="form-group">
                    <label for="name">First Name</label>

                    <input type="text" class="form-control" name="fname" required="required" maxlength="10"/>

                </div>

                <div class="form-group">

                    <label for="lname">Last Name</label>
                    <input  type="text" class="form-control" name="lname"/>
                </div>



                <div class="form-group">

                    <label for="email">Email</label>
                    <input type="email" class="form-control" name="email"/>
                </div>


                <div class="form-group">

                    <label for="address">Address</label>
                    <input type="text" class="form-control" name="address" />

                </div>


                <div class="form-group">
                    <label for="conact">contact </label>
                    <input type="text" class="form-control" name="contact"/>

                </div>


                <div class="form-group">
                    <button type="submit" name="submit">Submit</button>
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
    <script>

        $(document).on("ready", function () {

            $("#linkRegister").on("click", function () {
                $("#register").slideToggle();
                $("#stdList").hide();


            });
            $("#linkStdList").on("click", function () {
                $("#stdList").slideToggle();
                $("#register").hide();




            });

            $("table tr td #confirm-delete").on("click", function (e) {
                if (!confirm('Are you sure you want to Delete??')) {
                    e.preventDefault();
                    return false;
                }
                return true;

            });

        });
    </script> 





</body>
</html>

