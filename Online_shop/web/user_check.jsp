<%@page import="java.sql.*,java.util.*,java.util.Date" %>
<%
        try
        {
            String email= session.getAttribute("email").toString();
      
                response.sendRedirect("checkout.jsp");
        }    
        catch(Exception e)
        {
             response.sendRedirect("user/userlogin.jsp");
        }
%>