<%-- 
    Document   : details
    Created on : 20-Aug-2020, 12:05:09 PM
    Author     : dream
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Your Array List</h1><br>
        <%
            //out.println(session.getAttribute("seatsSelected"));
            session = request.getSession(false);
            //ServletContext context = getServletContext();
            if(session.getAttribute("seatsList") != null){
                ArrayList<String> seatsL = (ArrayList<String>) session.getAttribute("seatsList");
                //ArrayList<String> seatsList = new ArrayList<String>();
                //StringTokenizer str = new StringTokenizer(seatsL,",");
                for(int i=0;i<seatsL.size();i++)
                    out.println(seatsL.get(i));
            }
            
        %>
    </body>
</html>
