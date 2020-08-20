<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%--<html>
   <head>
      <title>Passenger Details</title>
   </head>
   
   <body>
      <center>
      
      <form action = "index.jsp" method = "POST">
            Email:
         <input type="email" id="email" name="email">
          Name: <input type = "text" name = "first_name">
         <br />
        
        Phone:
         <input type="tel" id="phone" name="phoneno">
      </form>
      
      
   
   </body>
</html>
--%>

<html>
   <head>
      <title>Passenger Details</title>
   </head>
   
   <body>
       
<%@page import="java.util.ArrayList"%>
       <%--
            session = request.getSession(false);
       ArrayList<String> s  = (ArrayList<String>)session.getAttribute("seatsList");
        int l = s.size();
        for(int i =0;i<l;i++){
    
    %>   System.out.println("Seat"+" "+s[i]+"\n");
        <button type="button" onclick="GFG_Fun()">Click Me!</button>
       <%
        }
     --%>
     <%
ArrayList<String> s  = new ArrayList<String>();
s.add("2");
s.add("3");
s.add("3");
        int l = s.size();
        for(int i =0;i<l;i++){
            %>
            <button type="button" onclick="GFG_Fun()">Click Me!</button>
              <% 
        }
              %>
           
<script> 
     
    // Create a break line element 
    var br = document.createElement("br");  
    function GFG_Fun() { 
                
    // Create a form synamically 
    var form = document.createElement("form"); 
    form.setAttribute("method", "post"); 
    form.setAttribute("action", "newjsp.jsp");
  
    // Create an input element for Full Name 
    var FN = document.createElement("input"); 
    FN.setAttribute("type", "text"); 
    FN.setAttribute("name", "FullName"); 
    FN.setAttribute("placeholder", "Full Name"); 
  
     // Create an input element for date of birth 
     var DOB = document.createElement("input"); 
     DOB.setAttribute("type", "text"); 
     DOB.setAttribute("name", "age"); 
     DOB.setAttribute("placeholder", "Age"); 
     //create an input element for gender
     
     var g = document.createTextNode("Gender");
     var m = document.createTextNode("Male");
     var x = document.createElement("input");
    x.setAttribute("type", "radio");
    x.setAttribute("name","Male");
    var f = document.createTextNode("Female");
    var y = document.createElement("input");
    y.setAttribute("type", "radio");
    y.setAttribute("name","Female");
     
    
     // Create an input element for emailID 
     
  
                // create a submit button 
                var s = document.createElement("input"); 
                s.setAttribute("type", "submit"); 
                s.setAttribute("value", "Submit"); 
                  
                // Append the full name input to the form 
                form.appendChild(FN);  
                  
                // Inserting a line break 
                form.appendChild(br.cloneNode());  
                  
                // Append the DOB to the form 
                form.appendChild(DOB);  
                form.appendChild(br.cloneNode());  
                  
                // Append the emailID to the form 
                form.appendChild(g);  
                form.appendChild(br.cloneNode());
                form.appendChild(m);  
                form.appendChild(br.cloneNode());
                form.appendChild(x);  
                form.appendChild(br.cloneNode());  
                  form.appendChild(f);  
                form.appendChild(br.cloneNode());
                // Append the Password to the form 
                form.appendChild(y);  
                form.appendChild(br.cloneNode());  
                  
                // Append the ReEnterPassword to the form 
            
                // Append the submit button to the form 
                form.appendChild(s);  
  
                document.getElementsByTagName("body")[0].appendChild(form); 
            } 
            
        </script> 
        <center>
      
      <form action = "index.jsp" method = "POST">
            Email:
         <input type="email" id="email" name="email">
          Name: <input type = "text" name = "first_name">
         <br />
        
        Phone:
         <input type="tel" id="phone" name="phoneno">
         <button type="submit"  value="Submit" action = "kwajha.jsp"> Submit </button>
      </form>
   </body>
</html>
