<%-- 
    Document   : newjsp
    Created on : 20 Aug, 2020, 12:07:03 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
          <% 
             String busSelected = request.getParameter("param");
//             session.setAttribute("bid", busSelected);
//           context.setAttribute("bid",request.getParameter("selectedBus"));
//            ServletContext context=getServletContext(); 
            out.println(busSelected);
        %>
    </body>
</html>
