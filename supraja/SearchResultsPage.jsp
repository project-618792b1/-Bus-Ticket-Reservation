<%-- 
    Document   : SearchResultsPage
    Created on : 19 Aug, 2020, 9:46:06 AM
    Author     : hp
--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Results</title>
        <link rel="stylesheet" type="text/css" href="css/searchResultsStyle.css">
    </head>
    <body>
        <div class='title'>
            <center>
                <h2><b>Search Results Page</b></h2>
            </center>
        </div>
        <%
            session = request.getSession();
            String db = "mysql";
            String user = "root"; 
            try {
              java.sql.Connection con;
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              con = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+db, user, "");
              Statement stmt = con.createStatement();
              //int tid_no = Integer.parseInt(request.getParameter("tid")); //uncomment this **************************************
              int tid_no=1;//remove this line
              String Query = "select * from `tours_data` where `tid`='"+tid_no+"'";// should be generated  dynamically *********************************************
              ResultSet rs = stmt.executeQuery(Query);
              if(rs.next()){
          %>
          <div class='subtitle'>
            <h4>Available buses from <%=rs.getString("fromcity")%> to <%=rs.getString("tocity")%> on <%=rs.getString("tourdate")%></h4>
          </div>
          <%
              Query = "select * from `bus_data` where `tid`='"+tid_no+"'";
              rs = stmt.executeQuery(Query);
              while(rs.next()){
               %>
              <div class='table'>
                <table>
                    <tr>
                        <th><%=rs.getString("bname")%></th>
                        <th><%=rs.getString("dept_time")%></th>
                        <th><%=rs.getString("duration")%></th>
                        <th><%=rs.getString("arr_time")%></th>
                      </tr>
                    <tr>
                        <td><%=rs.getString("bcode")%></td>
                        <td><%=rs.getString("dept_add")%></td>
                        <td></td>
                        <td><%=rs.getString("arr_date")%></td>
                    </tr>
                    <tr>
                        <td><%=rs.getString("btype")%></td>
                        <td></td>
                        <td></td>
                        <td><%=rs.getString("arr_add")%></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <th rowspan="2">
                            <input type="button" id="selectedBus" onclick="click_fn(this)"  value="View Seats" name=<%=rs.getString("bid")%>/>
                        </th>
                        <th>Seats Available:</th>
                        <th rowspan="2">Rs. <%=rs.getString("fare")%></th>
                    </tr>
                    <tr>
                        <th><%=rs.getString("seats_capacity")%> out of <%=rs.getString("seats_avail")%> seats</th>
                    </tr>
                </table>
            </div>
              
           <% }
                }//if data is valid
                else{ // if data not valid
                    %>
                    <img src="./Nobuses.png"/>
                <%
                }
                stmt.close();
                con.close();
                }
                catch(SQLException e) {
                  out.println("SQLException caught: " +e.getMessage());
                }  
          %>
        <script>
        function click_fn(mybutton) {
        var checked_bus = mybutton.name;
        mybutton.style.background = "green";
        window.location="http://localhost:8090/Canti_sample/newjsp.jsp?param="+checked_bus;
      }
    </script>
    </body>
</html>
