<%-- 
    Document   : login
    Created on : 21 Apr, 2019, 1:23:42 PM
    Author     : Abhishek
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*"%>
<html>
    <head>
        <title>Book my Flight</title>
    </head>
    <body>
<%
    String contact = request.getParameter("contact");
    String password = request.getParameter("pass");
    int flag=0;
        try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con1=DriverManager.getConnection("jdbc:derby://localhost:1527/flight","flight","flight");
            Statement stmt=con1.createStatement();
            ResultSet rs=stmt.executeQuery("select * from users_detail");
            while(rs.next())
            {
                String na=rs.getString(1);
                String c=rs.getString(4);
                String p=rs.getString(3);
                if((c.equals(contact))&&(p.equals(password)))
                {  
                    flag=1;
                    break;
                }
            }
            if(flag==1)
            {
%>
                <center>
                <h3>WELCOME</h3>
                <a href="index.html"><button class="btn btn-primary">Book Your Ticket</button></a> 
                </center>
<%
            }
            else{
%>
                    <center>
                    <h3>Please Enter Correct Details</h3>
                    <a href="main.html"><button class="btn btn-primary">Home</button></a>
                    </center>
<%
            }
        }
        catch(Exception e){
            System.out.println(e);
        }
%>
</body>
</html>
