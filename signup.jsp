<%-- 
    Document   : signup
    Created on : 21 Apr, 2019, 12:57:07 PM
    Author     : Abhishek
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*,java.util.*,java.sql.*,java.lang.*"%>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String password = request.getParameter("pass");
String contact = request.getParameter("contact");
try{
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con1=DriverManager.getConnection("jdbc:derby://localhost:1527/flight","flight","flight");
            Statement stmt=con1.createStatement();
            String sql="select * from users_detail where email='"+email+"' or contact='"+contact+"'";
            ResultSet rs=stmt.executeQuery(sql);
            int flag=0;
            while(rs.next())
            {
                String e=rs.getString(2);
                String c=rs.getString(4);
                if((e.equals(email))||(c.equals(contact)))
                {  
                       flag=1;
                       break;
                }
            }
            if(flag==1)
            {
%>             
                <center>
                <h3>Email Or Mobile Already Registered</h3>
                <a href="main.html"><button class="btn btn-primary">Home</button></a>
                </center>
<%
            }
            else
            {
%>
                <center>
                <h3>Welcome</h3>
                <a href="index.html"><button class="btn btn-primary">Book Your Ticket</button></a>
                </center>
<%
                int i=stmt.executeUpdate("insert into users_detail(name,email,password,contact) values('"+name+"','"+email+"','"+password+"','"+contact+"')");
%>
<%
            }
    }
    catch(Exception e){    
    System.out.print(e);
}
%>