<%@page import="java.sql.*,java.util.*"%>
<%
        Connection con=null;
        PreparedStatement st=null;
        Statement st1=null;
        ResultSet rs=null;
        String qry="";
        String qry2="";
        //int userid;
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String guestid = session.getAttribute("guest_id").toString();
        
        String url = request.getParameter("rurl");
    
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/fashion_mart","root","");
        }
        catch(ClassNotFoundException e)
        {
            out.println("Driver Error"+e.getMessage());
            return;
        }
        catch(SQLException e)
        {
            out.println("DSN Error"+e.getMessage());
            return;
        }
        
        try
        {
            qry="select * from users where email=? and pass=?";
            st=con.prepareStatement(qry);
            
            st.setString(1, email);
            st.setString(2, pass);
            
            rs=st.executeQuery();
            if(rs.next())
            {
              session.setAttribute("email", email);
              qry2 ="UPDATE cart SET email='"+email+"' where email='"+guestid+"'";
              st1=con.createStatement();
              st1.executeUpdate(qry2);
              if(url.equals("http://localhost:8084/Online_shop/cart.jsp"))
                  response.sendRedirect("../checkout.jsp");
              else
                response.sendRedirect(url);
            }
            else
            {   
                response.sendRedirect("userlogin.jsp");
            }
        }
        catch(Exception e)
        {
            out.println("Error : "+e.getMessage());
        }
%>