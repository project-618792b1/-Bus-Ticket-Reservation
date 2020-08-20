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
            session = request.getSession();
            //ServletContext context = getServletContext();
            //System.out.println("proceed page: "+session.getAttribute("seatsSelected").toString());
            if(request.getParameter("finalSeats") != null){
                String seats = request.getParameter("finalSeats").toString();
                ArrayList<String> s = new ArrayList<>();
                StringTokenizer str = new StringTokenizer(seats,",");
                int i=0;
                while(str.hasMoreTokens()){
                    s.add(str.nextToken().toString());
                    out.println(s.get(i));
                    i++;
                }
                session.setAttribute("seatsList", s);
                response.sendRedirect("http://localhost:8080/Final/details.jsp");
            }
        %>
    </head>
    <body>

    </body>
</html>
