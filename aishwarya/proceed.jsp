<%-- 
    Document   : proceed
    Created on : 20-Aug-2020, 12:01:35 PM
    Author     : dream
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList,java.util.StringTokenizer"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <%
            session = request.getSession(false);
            //ServletContext context = getServletContext();
            //System.out.println("proceed page: "+session.getAttribute("seatsSelected").toString());
            if(session.getAttribute("seatsSelected") != null){
                String seats = session.getAttribute("seatsSelected").toString();
                ArrayList<String> s = new ArrayList<>();
                StringTokenizer str = new StringTokenizer(seats,",");
                while(str.hasMoreTokens()){
                    s.add(str.nextToken().toString());
                }
                session.setAttribute("seatsList", s);
                response.sendRedirect("http://localhost:8080/Final/details.jsp");
            }
        %>
    </head>
    <body>
    </body>
</html>
