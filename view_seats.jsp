<%-- 
    Document   : view_seats
    Created on : 20-Aug-2020, 11:47:03 AM
    Author     : dream
--%>

<!--
TODO :
1. Line 19,20,21 -> database configuration
3. proceed.jsp file -> Line 26 give name of jsp which should be loaded
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    session = request.getSession(false);
    //int bid = Integer.parseInt(session.getAttribute("bid").toString());
//Connecting to database
    String url = "jdbc:mysql://localhost:3306/aish";
    String uname = "aish";
    String pwd = null;
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, uname, pwd);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Seats</title>
        <link rel="stylesheet" href="style.css">
        <script>
            //declaring global variable to keep track of user fare and seatsSelected
            var fare = 0;
            var totalFare = 0;
            
            var seatsSelc = new Array();
            var buttonClicks = new Array();//keeps track of seats selected
            var finalSeats = new Array();// gets seats selected when proceed button clicked
            for (var i = 1; i <= 24; i++) {
                    buttonClicks.push(0);
                    seatsSelc.push(0);
            }
            
            function getFareDetails(){
                // Initializing total fare html element
                document.getElementById("fare").innerHTML = totalFare;
            }
            
            function buttonClickCount(id){
                // this function keeps track of how many times button is clicked
                //If clicked = 0  => seat selected, so append seat number, display seat number, and calculate and display total fare
                //If clicked = 1  => seat selected, so delete seat number, display seat number, and calculate and display total fare
                if(buttonClicks[id] == 0 && document.getElementById(id.toString()).onclick){
                        document.getElementById(id.toString()).style.backgroundColor = "#B2BEB5";
                        seatsSelc[id] = document.getElementById(id.toString()).innerHTML;
                        //seats.splice(id,0,document.getElementById(id.toString()).innerHTML);
                        //seats.push(document.getElementById(id.toString()).innerHTML);
                        var booked = new Array();
                        for (var i = seatsSelc.length - 1; i >= 0; i--) {
                                if(seatsSelc[i] != 0)
                                        booked.push(seatsSelc[i]);
                        }
                        document.getElementById("seats").innerHTML = booked;
                        buttonClicks[id]++;
                        totalFare += fare;
                        document.getElementById("fare").innerHTML = totalFare;
                }
                else if(buttonClicks[id] == 1 && document.getElementById(id.toString()).onclick){
                        document.getElementById(id.toString()).style.backgroundColor = "#4CAF50";
                        seatsSelc.splice(id,1);
                        seatsSelc.splice(id,0,0);
                        var booked = new Array();
                        for (var i = seatsSelc.length - 1; i >= 0; i--) {
                                if(seatsSelc[i] != 0)
                                        booked.push(seatsSelc[i]);
                        }
                        //seats.pop();
                        document.getElementById("seats").innerHTML = booked;
                        buttonClicks[id] = 0;
                        totalFare -= fare;
                        document.getElementById("fare").innerHTML = totalFare;
                }
            }
        </script>
    </head>
    <body>
        <div class="topdiv" id="top">
<!-- 		TRIED TO DYNAMICALLY CREATE BUTTONS BUT ONCLICK WAS NOT SET CORRECTLY
                <script> 
                        createButtons();
                        setOnCLick();
                </script> -->
            <!--By default 24 buttons taken-->
            <button type="button" id="1" class="button" onclick="buttonClickCount(1)">1</button>
            <button type="button" id="2" class="button" onclick="buttonClickCount(2)">2</button>
            <button type="button" id="3" class="button" onclick="buttonClickCount(3)">3</button>
            <button type="button" id="4" class="button" onclick="buttonClickCount(4)">4</button>
            <button type="button" id="5" class="button" onclick="buttonClickCount(5)">5</button>
            <button type="button" id="6" class="button" onclick="buttonClickCount(6)">6</button>
            <button type="button" id="7" class="button" onclick="buttonClickCount(7)">7</button>
            <button type="button" id="8" class="button" onclick="buttonClickCount(8)">8</button>
            <button type="button" id="9" class="button" onclick="buttonClickCount(9)">9</button>
            <button type="button" id="10" class="button" onclick="buttonClickCount(10)">10</button>
            <button type="button" id="11" class="button" onclick="buttonClickCount(11)">11</button>
            <button type="button" id="12" class="button" onclick="buttonClickCount(12)">12</button><br><br>
            <button type="button" id="13" class="button" onclick="buttonClickCount(13)">13</button>
            <button type="button" id="14" class="button" onclick="buttonClickCount(14)">14</button>
            <button type="button" id="15" class="button" onclick="buttonClickCount(15)">15</button>
            <button type="button" id="16" class="button" onclick="buttonClickCount(16)">16</button>
            <button type="button" id="17" class="button" onclick="buttonClickCount(17)">17</button>
            <button type="button" id="18" class="button" onclick="buttonClickCount(18)">18</button>
            <button type="button" id="19" class="button" onclick="buttonClickCount(19)">19</button>
            <button type="button" id="20" class="button" onclick="buttonClickCount(20)">20</button>
            <button type="button" id="21" class="button" onclick="buttonClickCount(21)">21</button>
            <button type="button" id="22" class="button" onclick="buttonClickCount(22)">22</button>
            <button type="button" id="23" class="button" onclick="buttonClickCount(23)">23</button>
            <button type="button" id="24" class="button" onclick="buttonClickCount(24)">24</button>
            <%
                //get bid using getParameter method
                //int bid = 2;// default set to test other functionalities
                //Getting the boarding, destination and fare details
                PreparedStatement st = conn.prepareStatement("select dept_add, arr_add,fare from bus_data where bid=?");
                st.setInt(1,bid);
                ResultSet rs =  st.executeQuery();
                String boarding = "";
                String dest = "";
                int fare = 0;
                while(rs.next()){
                    boarding = rs.getString(1);
                    dest = rs.getString(2);
                    fare = rs.getInt(3);
                }
                //out.print(boarding+dest);
            %>
            <script type="text/javascript">
                //setting global variable fare -> used later to calculate totalFare
                fare = <%=fare%>;
            </script>
            <%
                //getting already locked seats to mark them red
                st = conn.prepareStatement("select seats, status from seatsData where bid=? and status=1");
                st.setInt(1,bid);
                rs =  st.executeQuery();
                //https://stackoverflow.com/questions/10708250/populating-a-javascript-array-using-mysql-and-jsp
            %>
            <script type='text/javascript'>
                // Loading locked seats into array
                var bookedData = [
                            <% while(rs.next()){%>
                                <%=rs.getInt("seats")%>,
                <%}%>];
                //changing color of locked seats to read and disabling onclick
                for(var j=0;j<bookedData.length;j++){
                    document.getElementById(bookedData[j].toString()).style.backgroundColor = "red";
                    document.getElementById(bookedData[j].toString()).onclick = null;
                }
            </script>
	</div>
	<div class="bottomdiv">
		<h3>Fare Details :</h3>
		<p> Boarding point - <i id="boarding"><%=boarding%></i></p>
		<p> Dropping point - <i id="dropping"><%=dest%></i></p>
		<p> Seats Selected - <i id="seats"></i></p>
		<p> Total Fare - <i id="fare"></i></p><br>
		<button type="button" id="proceed" onclick="final()">Proceed</button>
                <script>
                        //Code to call proceed.jsp -> where we get redirected to nextPage.jsp(here named->details.jsp)
                        document.getElementById("fare").innerHTML = totalFare;
                        function final(){
                            //This method is called when proceed button is clicked.
                            //It gets final selected seats into array-> finalSeats
                            for(var i = 0;i<seatsSelc.length;i++)
                                if(seatsSelc[i] !=0){
                                    finalSeats.push(seatsSelc[i]);
                                }
                            //document.write();
                            //Below code allows us to access finalSeats in scriptlet
                            window.location.replace("view_seats.jsp?finalSeats="+finalSeats);
                            
                            //below code takes us to details.jsp
                            if(finalSeats.length == 0 || finalSeats==null)
                                alert("Please select seats");
                            else{
                                <%if(request.getParameter("finalSeats")!=null)
                                    attributes(request);%>
                                window.location.href="proceed.jsp";}
                        }
                </script>
                <%!
                    private void attributes(HttpServletRequest request){
                        //Getting finalSeats-> We get a string of comma-separated values
                        HttpSession session = request.getSession();
                        String seatsSelected = request.getParameter("finalSeats");
                        session.setAttribute("seatsSelected", seatsSelected);
                        //session.setAttribute("seatsSelected", seatsSelected);
                        System.out.println("seats : "+seatsSelected);
                        //ServletContext context = getServletContext();
                        //context.setAttribute("seatsSelected",seatsSelected);
                        System.out.println(session.getAttribute("seatsSelected"));
                    }

                %>

	</div>
	<!--</div>-->
    </body>
</html>
