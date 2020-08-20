<%-- 
    Document   : newjsp
    Created on : Aug 19, 2020, 1:38:44 PM
    Author     : A1
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <h1> "Details Taken :)"</h1>
        <%@page import="java.util.ArrayList"%>
        <%ArrayList<ArrayList<String>> a = new ArrayList<ArrayList<String>>();%>
        <%
        session = request.getSession(false);
            String name = request.getParameter("FullName");
            String age = request.getParameter("age");
            ArrayList<String> al = new ArrayList<String>();
            al.add(name);
            al.add(age);
            a.add(al);
            session.setAttribute("Details", a);
            
          %>
         
    </body>
</html>
